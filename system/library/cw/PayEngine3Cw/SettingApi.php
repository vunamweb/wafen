<?php 
/**
  * You are allowed to use this API in your web application.
 *
 * Copyright (C) 2018 by customweb GmbH
 *
 * This program is licenced under the customweb software licence. With the
 * purchase or the installation of the software in your application you
 * accept the licence agreement. The allowed usage is outlined in the
 * customweb software licence which can be found under
 * http://www.sellxed.com/en/software-license-agreement
 *
 * Any modification or distribution is strictly forbidden. The license
 * grants you the installation in one application. For multiuse you will need
 * to purchase further licences at http://www.sellxed.com/shop.
 *
 * See the customweb software licence agreement for more details.
 *
 */


require_once 'Customweb/Core/Stream/Input/File.php';
require_once 'Customweb/Util/Html.php';

require_once 'PayEngine3Cw/Language.php';
require_once 'PayEngine3Cw/Util.php';
require_once 'PayEngine3Cw/Exception/SettingNotFoundException.php';
require_once 'PayEngine3Cw/Database.php';
require_once 'PayEngine3Cw/OrderStatus.php';
require_once 'PayEngine3Cw/Store.php';


class PayEngine3Cw_SettingApi {
	
	/**
	 * @var PayEngine3Cw_Database
	 */
	private $database;
	private $space;
	
	private static $cache = array();
	
	private static $settingDefinitions = null;
	
	public function __construct($space) {
		$this->database = PayEngine3Cw_Database::getInstance();
		$this->space = strtolower($space);
	}
	
	public function getSpaceSettingDefintion() {
		$defintions = self::getSettingDefinitions();
		
		$space = strtolower($this->space);
		if (!isset($defintions[$space])) {
			throw new Exception("For the settings space '" . $space . "' there are no settings defintions.");
		}
		$spaceDefinitions = $defintions[$space];
		
		if ($this->space == 'payengine3cw') {
			return array_merge(self::getAdditionalBaseSettings(), $spaceDefinitions);
		}
		else {
			return array_merge(self::getAdditionalMethodSettings(), $spaceDefinitions);
		}
	}
	
	public function getSpace() {
		return $this->space;
	}
	
	public function setValue($key, $storeId, $value) {
		self::writeSetting($storeId, $this->space, $key, $value);
	}
	
	public function removeValue($key, $storeId) {
		self::removeSetting($storeId, $this->space, $key);
	}
	
	public function getValue($key, $storeId = null, $langId = null) {
		if ($storeId === null) {
			$storeId = PayEngine3Cw_Store::getStoreId();
		}
		$storeId = strval($storeId);
		
		$this->loadSettingsIntoCache($storeId);
		$key = strtolower($key);
		
		if (array_key_exists($key, self::$cache[$this->space][$storeId])) {
			$configValue = self::$cache[$this->space][$storeId][$key];
		}
		else {
			throw new Exception("Could not find setting value for key '" . $key . "' for store '" . $storeId . "' in space '" . $this->space . "'.");
		}
		
		if ($langId !== null) {
			$langId = (string)$langId;
			if (isset($configValue[$langId])) {
				return $configValue[$langId];
			}
			else {
				return reset($configValue);
			}
		}
		else {
			return $configValue;
		}
	}
	
	public function isSettingPresent($key, $storeId = null, $langId = null) {
		if ($storeId === null) {
			$storeId = PayEngine3Cw_Store::getStoreId();
		}
	
		$this->loadSettingsIntoCache($storeId);
	
		if (isset(self::$cache[$this->space][$storeId][$key])) {
			return true;
		}
		else {
			return false;
		}
	}
	
	private function loadSettingsIntoCache($storeId) {
		$storeId = strval($storeId);
		
		if (!isset(self::$cache[$this->space][$storeId])) {
				
			// Load first all default configurations:
			$defaultValues = array();
			if ($storeId !== PayEngine3Cw_Store::DEFAULT_STORE_ID && !isset(self::$cache[$this->space][PayEngine3Cw_Store::DEFAULT_STORE_ID])) {
				$defaultValues = $this->loadAllValuesPerStore(PayEngine3Cw_Store::DEFAULT_STORE_ID);
			}
			else if (isset(self::$cache[$this->space][PayEngine3Cw_Store::DEFAULT_STORE_ID])){
				$defaultValues = self::$cache[$this->space][PayEngine3Cw_Store::DEFAULT_STORE_ID];
			}
			$storeValues = $this->loadAllValuesPerStore($storeId);
			
			foreach ($this->getSpaceSettingDefintion() as $key => $definitions) {
				$key = strtolower($key);
				$type = strtolower($definitions['type']);
				if ($type == 'file') {
					$storeValue = null;
					if (isset($storeValues[$key]) && !empty($storeValues[$key])) {
						$path = PayEngine3Cw_Util::getFileUploadDir() . $storeValues[$key];
						if (file_exists($path)) {
							$storeValue = new Customweb_Core_Stream_Input_File($path);
						}
					}
					else if (isset($defaultValues[$key])) {
						$storeValue = $defaultValues[$key];
					}
					
					if ($storeValue === null) {
						if (isset($definitions['default'])) {
							try {
								$storeValue = PayEngine3Cw_Util::getAssetResolver()->resolveAssetStream($definitions['default']);
							} catch(Customweb_Asset_Exception_UnresolvableAssetException $e) {
							}
						}
					}
				}
				else if (isset($storeValues[$key])) {
					$storeValue = $storeValues[$key];
				}
				else if (isset($defaultValues[$key])) {
					$storeValue = $defaultValues[$key];
				}
				else {
					
					if ($type == 'multiselect' || $type == 'currencyselect') {
						$storeValue = explode(',', $definitions['default']);
					}
					else if ($type == 'multilangfield') {
						$storeValue = array();
						foreach(PayEngine3Cw_Util::getLanguages() as $language) {
							$storeValue[$language['language_id']] = $definitions['default'];
						}
					}
					else if ($type == 'orderstatusselect') {
						if ($definitions['default'] == 'authorized' || $definitions['default'] == 'uncertain' || $definitions['default'] == 'cancelled') {
							$storeValue = PayEngine3Cw_OrderStatus::getStatusIdByKey($definitions['default']);
						}
						else {
							$storeValue = $definitions['default'];
						}
					}
					else {
						$storeValue = $definitions['default'];
					}
				}
				self::$cache[$this->space][$storeId][$key] = $storeValue;
			}
		}
	}
	
	protected function loadAllValuesPerStore($storeId) {
		$prefix = $this->space . '_';
		$rs = $this->database->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$storeId . "' AND `key` LIKE '" . $this->database->escape(strtolower($prefix)) . "%'");
		$rows = $this->database->fetchAll($rs);
		$data = array();
		foreach ($rows as $result) {
			$key = str_replace($prefix, '', $result['key']);
			if (!$result['serialized']) {
				$data[$key] = $result['value'];
			} else {
				$data[$key] = unserialize($result['value']);
			}
		}
		
		return $data;
	}
	
	public static function removeSetting($storeId, $group, $key) {
		$db = PayEngine3Cw_Database::getInstance();
		$dbKey = strtolower($group . '_' . $key);
		$db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$storeId . "' AND `key` = '" . $db->escape($dbKey) . "'");
	}
	
	public static function writeSetting($storeId, $group, $key, $value) {
		
		$isSerialized = '0';
		if (is_array($value)) {
			
			foreach ($value as $c => $v) {
				$value[$c] = Customweb_Util_Html::unescapeXml($v);
			}
			
			$value = serialize($value);
			$isSerialized = '1';
		}
		else {
			$value = Customweb_Util_Html::unescapeXml($value);
		}
		$dbKey = strtolower($group . '_' . $key);
		
		$data = array(
			'key' => $dbKey,
			'store_id' => $storeId,
			'value' => $value,
			'serialized' => $isSerialized,
		);
		
		if (version_compare(VERSION, '2.3.0.0') >= 0) {
			// From Version 2.3.x on the group column is called code.
			$data['code'] = 'payengine3cw';
		}
		else {
			$data['group'] = 'payengine3cw';
		}
		
		$db = PayEngine3Cw_Database::getInstance();
		$rs = $db->query("SELECT setting_id FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$storeId . "' AND `key` = '" . $db->escape($dbKey) . "'");
		if ($rs === null) {
			PayEngine3Cw_Database::getInstance()->insert(DB_PREFIX . 'setting', $data);
		}
		else {
			$row = $db->fetch($rs);
			$db->update(DB_PREFIX . 'setting', $data, array('setting_id' => $row['setting_id']));
		}
	}
	
	public static function readSetting($storeId, $group, $key) {
		$db = PayEngine3Cw_Database::getInstance();
		$dbKey = strtolower($group . '_' . $key);
		$rs = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$storeId . "' AND `key` = '" . $db->escape($dbKey) . "'");
		
		if ($rs !== null) {
			$row = $db->fetch($rs);
			if ($row['serialized'] == '1') {
				return unserialize($row['value']);
			}
			else {
				return $row['value'];
			}
		}
		else {
			throw new PayEngine3Cw_Exception_SettingNotFoundException("Setting with key '" . $key . "' not found.");
		}
	}
	
	private static function getAdditionalMethodSettings() {
		$settings = array();
		
		$settings['status'] = array(
			'title' => PayEngine3Cw_Language::_('Status'),
			'type' => 'select',
			'description' => PayEngine3Cw_Language::_('Active payment methods can be used by customers to pay their orders.'),
			'options' => array(
				'1' => PayEngine3Cw_Language::_('Enabled'),
				'0' => PayEngine3Cw_Language::_('Disabled'),
			),
			'default' => 'disabled',
		);
		
		$settings['sort_order'] = array(
			'title' => PayEngine3Cw_Language::_('Sort Order'),
			'description' => PayEngine3Cw_Language::_("The sort order of the payment method."),
			'type' => 'textfield',
			'default' => '0',
		);
		
// 		$settings['show_logos'] = array(
// 			'title' => PayEngine3Cw_Language::_('Payment Logos'),
// 			'type' => 'select',
// 			'description' => PayEngine3Cw_Language::_("Should the payment logos be shown on the checkout page?"),
// 			'options' => array(
// 				'yes' => PayEngine3Cw_Language::_('Show payment logos on the checkout page'),
// 				'no' => PayEngine3Cw_Language::_('No'),
// 			),
// 			'default' => 'yes',
// 		);
		
		$zones = array();
		foreach (PayEngine3Cw_Util::getZones() as $zoneId => $zone) {
			$zones[$zoneId] = $zone['name'];
		}
		$settings['allowed_zones'] = array (
			'title' => PayEngine3Cw_Language::_('Allowed Zones'),
			'description' => PayEngine3Cw_Language::_('The payment method is available for the selected zones. If none is selected, the payment method is available for all zones.'),
			'type' => 'multiselect',
			'options' => $zones,
			'default' => '',
		);
		
		$settings['title'] = array(
			'title' => PayEngine3Cw_Language::_('Method Title'),
			'type' => 'multilangfield',
			'description' => PayEngine3Cw_Language::_("This controls the title which the user sees during checkout. If not set the default title is used."),
			'default' => '',
		);
		
		$settings['description'] = array(
			'title' => PayEngine3Cw_Language::_('Description'),
			'type' => 'multilangfield',
			'description' => PayEngine3Cw_Language::_('This controls the description which the user sees during checkout.'),
			'default' => '',
		);
		
		$settings['confirm_button_name'] = array(
			'title' => PayEngine3Cw_Language::_('Order Confirm Button'),
			'type' => 'multilangfield',
			'description' => PayEngine3Cw_Language::_("The customer may confirm the order on the checkout page. This field allows the modification of the displayed name. If the field is empty, the default value is used."),
			'default' => '',
		);
				
		$settings['min_total'] = array(
			'title' => PayEngine3Cw_Language::_('Minimal Order Total'),
			'type' => 'textfield',
			'description' => PayEngine3Cw_Language::_('Set here the minimal order total for which this payment method is available. If it is set to zero, it is always available.'),
			'default' => 0,
		);
		
		$settings['max_total'] = array(
			'title' => PayEngine3Cw_Language::_('Maximal Order Total'),
			'type' => 'textfield',
			'description' => PayEngine3Cw_Language::_('Set here the maximal order total for which this payment method is available. If it is set to zero, it is always available.'),
			'default' => 0,
		);
		
		return $settings;
	}
	
	private static function getAdditionalBaseSettings() {
		$settings = array();

		return $settings;
	}
	
	private static function getSettingDefinitions() {
		if (self::$settingDefinitions !== null) {
			return self::$settingDefinitions;
		}
	
		$definitions = array(
			'payengine3cw' => array(
				'operating_mode' => array(
					'title' => PayEngine3Cw_Language::_("Operation Mode"),
 					'description' => PayEngine3Cw_Language::_("Operation mode of the shop"),
 					'type' => 'SELECT',
 					'options' => array(
						'test' => PayEngine3Cw_Language::_("Test"),
 						'live' => PayEngine3Cw_Language::_("Live"),
 					),
 					'default' => 'test',
 				),
 				'merchant_id_live' => array(
					'title' => PayEngine3Cw_Language::_("Merchant ID Live"),
 					'description' => PayEngine3Cw_Language::_("Merchant ID for the test environment provided by Concardis PayEngine 3.0"),
 					'type' => 'TEXTFIELD',
 					'default' => '',
 				),
 				'merchant_password_live' => array(
					'title' => PayEngine3Cw_Language::_("API Private Key Live"),
 					'description' => PayEngine3Cw_Language::_("The API private key can be found in the backend of Concardis PayEngine 3.0 under My Account API Keys Private Key"),
 					'type' => 'TEXTFIELD',
 					'default' => '',
 				),
 				'merchant_id_test' => array(
					'title' => PayEngine3Cw_Language::_("Merchant ID Test"),
 					'description' => PayEngine3Cw_Language::_("Merchant ID for the test environment provided by Concardis PayEngine 3.0"),
 					'type' => 'TEXTFIELD',
 					'default' => '',
 				),
 				'merchant_password_test' => array(
					'title' => PayEngine3Cw_Language::_("API Private Key Test"),
 					'description' => PayEngine3Cw_Language::_("The API private key can be found in the backend of Concardis PayEngine 3.0 under My Account API Keys Private Key"),
 					'type' => 'TEXTFIELD',
 					'default' => '',
 				),
 				'order_schema' => array(
					'title' => PayEngine3Cw_Language::_("Order ID Schema"),
 					'description' => PayEngine3Cw_Language::_("Here you can set a schema for the reference transmitted to identify the payment The placeholder id will be replaced using the transaction id Will default to id if left empty"),
 					'type' => 'TEXTFIELD',
 					'default' => '{id}',
 				),
 				'log_level' => array(
					'title' => PayEngine3Cw_Language::_("Log Level"),
 					'description' => PayEngine3Cw_Language::_("Messages of this or a higher level will be logged"),
 					'type' => 'SELECT',
 					'options' => array(
						'error' => PayEngine3Cw_Language::_("Error"),
 						'info' => PayEngine3Cw_Language::_("Info"),
 						'debug' => PayEngine3Cw_Language::_("Debug"),
 					),
 					'default' => 'error',
 				),
 			),
 			'payengine3cw_creditcard' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'AED',
 						1 => 'ANG',
 						2 => 'ARS',
 						3 => 'AUD',
 						4 => 'AWG',
 						5 => 'BGN',
 						6 => 'BRL',
 						7 => 'BYN',
 						8 => 'CAD',
 						9 => 'CHF',
 						10 => 'CNY',
 						11 => 'CZK',
 						12 => 'DKK',
 						13 => 'EGP',
 						14 => 'EUR',
 						15 => 'GBP',
 						16 => 'GEL',
 						17 => 'HKD',
 						18 => 'HRK',
 						19 => 'HUF',
 						20 => 'ILS',
 						21 => 'ISK',
 						22 => 'JPY',
 						23 => 'KRW',
 						24 => 'LTL',
 						25 => 'LVL',
 						26 => 'MAD',
 						27 => 'MXN',
 						28 => 'NOK',
 						29 => 'NZD',
 						30 => 'PLN',
 						31 => 'RON',
 						32 => 'RUB',
 						33 => 'SEK',
 						34 => 'SGD',
 						35 => 'THB',
 						36 => 'TRY',
 						37 => 'UAH',
 						38 => 'USD',
 						39 => 'XAF',
 						40 => 'XOF',
 						41 => 'XPF',
 						42 => 'ZAR',
 					),
 				),
 				'capturing' => array(
					'title' => PayEngine3Cw_Language::_("Capturing"),
 					'description' => PayEngine3Cw_Language::_("Should the amount be captured automatically debit or should the amount only be reserved deferred"),
 					'type' => 'SELECT',
 					'options' => array(
						'direct' => PayEngine3Cw_Language::_("Directly after order"),
 						'deferred' => PayEngine3Cw_Language::_("Deferred"),
 					),
 					'default' => 'direct',
 				),
 				'iframe_height' => array(
					'title' => PayEngine3Cw_Language::_("Iframe height"),
 					'description' => PayEngine3Cw_Language::_("Height of the iframe in em units"),
 					'type' => 'TEXTFIELD',
 					'default' => '15',
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'element_style' => array(
					'title' => PayEngine3Cw_Language::_("Container Element"),
 					'description' => PayEngine3Cw_Language::_("Should the element which contains the credit cards be rendered inline with other elements or wide"),
 					'type' => 'SELECT',
 					'options' => array(
						'inline' => PayEngine3Cw_Language::_("Inline Default"),
 						'wide' => PayEngine3Cw_Language::_("Wide"),
 					),
 					'default' => 'inline',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'AjaxAuthorization' => PayEngine3Cw_Language::_("Ajax Authorization"),
 					),
 					'default' => 'AjaxAuthorization',
 				),
 				'alias_manager' => array(
					'title' => PayEngine3Cw_Language::_("Alias Manager"),
 					'description' => PayEngine3Cw_Language::_("The alias manager allows the customer to select from a credit card previously stored The sensitive data is stored by Concardis PayEngine 3.0"),
 					'type' => 'SELECT',
 					'options' => array(
						'active' => PayEngine3Cw_Language::_("Active"),
 						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 					),
 					'default' => 'inactive',
 				),
 			),
 			'payengine3cw_paypal' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'AED',
 						1 => 'ANG',
 						2 => 'ARS',
 						3 => 'AUD',
 						4 => 'AWG',
 						5 => 'BGN',
 						6 => 'BRL',
 						7 => 'BYN',
 						8 => 'CAD',
 						9 => 'CHF',
 						10 => 'CNY',
 						11 => 'CZK',
 						12 => 'DKK',
 						13 => 'EGP',
 						14 => 'EUR',
 						15 => 'GBP',
 						16 => 'GEL',
 						17 => 'HKD',
 						18 => 'HRK',
 						19 => 'HUF',
 						20 => 'ILS',
 						21 => 'ISK',
 						22 => 'JPY',
 						23 => 'KRW',
 						24 => 'LTL',
 						25 => 'LVL',
 						26 => 'MAD',
 						27 => 'MXN',
 						28 => 'NOK',
 						29 => 'NZD',
 						30 => 'PLN',
 						31 => 'RON',
 						32 => 'RUB',
 						33 => 'SEK',
 						34 => 'SGD',
 						35 => 'THB',
 						36 => 'TRY',
 						37 => 'UAH',
 						38 => 'USD',
 						39 => 'XAF',
 						40 => 'XOF',
 						41 => 'XPF',
 						42 => 'ZAR',
 					),
 				),
 				'capturing' => array(
					'title' => PayEngine3Cw_Language::_("Capturing"),
 					'description' => PayEngine3Cw_Language::_("Should the amount be captured automatically debit or should the amount only be reserved deferred"),
 					'type' => 'SELECT',
 					'options' => array(
						'direct' => PayEngine3Cw_Language::_("Directly after order"),
 						'deferred' => PayEngine3Cw_Language::_("Deferred"),
 					),
 					'default' => 'direct',
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'PaymentPage' => PayEngine3Cw_Language::_("Payment Page"),
 					),
 					'default' => 'PaymentPage',
 				),
 			),
 			'payengine3cw_paydirekt' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'AED',
 						1 => 'ANG',
 						2 => 'ARS',
 						3 => 'AUD',
 						4 => 'AWG',
 						5 => 'BGN',
 						6 => 'BRL',
 						7 => 'BYN',
 						8 => 'CAD',
 						9 => 'CHF',
 						10 => 'CNY',
 						11 => 'CZK',
 						12 => 'DKK',
 						13 => 'EGP',
 						14 => 'EUR',
 						15 => 'GBP',
 						16 => 'GEL',
 						17 => 'HKD',
 						18 => 'HRK',
 						19 => 'HUF',
 						20 => 'ILS',
 						21 => 'ISK',
 						22 => 'JPY',
 						23 => 'KRW',
 						24 => 'LTL',
 						25 => 'LVL',
 						26 => 'MAD',
 						27 => 'MXN',
 						28 => 'NOK',
 						29 => 'NZD',
 						30 => 'PLN',
 						31 => 'RON',
 						32 => 'RUB',
 						33 => 'SEK',
 						34 => 'SGD',
 						35 => 'THB',
 						36 => 'TRY',
 						37 => 'UAH',
 						38 => 'USD',
 						39 => 'XAF',
 						40 => 'XOF',
 						41 => 'XPF',
 						42 => 'ZAR',
 					),
 				),
 				'capturing' => array(
					'title' => PayEngine3Cw_Language::_("Capturing"),
 					'description' => PayEngine3Cw_Language::_("Should the amount be captured automatically debit or should the amount only be reserved deferred"),
 					'type' => 'SELECT',
 					'options' => array(
						'direct' => PayEngine3Cw_Language::_("Directly after order"),
 						'deferred' => PayEngine3Cw_Language::_("Deferred"),
 					),
 					'default' => 'direct',
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'PaymentPage' => PayEngine3Cw_Language::_("Payment Page"),
 					),
 					'default' => 'PaymentPage',
 				),
 			),
 			'payengine3cw_ratepayopeninvoice' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'EUR',
 						1 => 'CHF',
 					),
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'capturing' => array(
					'title' => PayEngine3Cw_Language::_("Capturing"),
 					'description' => PayEngine3Cw_Language::_("Should the amount be confirmed automatically or should the amount only be authorised Please note that the automatic confirmation should only be used for digital goods and similar cases Once the payment has been made the goods should be immediately available"),
 					'type' => 'SELECT',
 					'options' => array(
						'direct' => PayEngine3Cw_Language::_("Automatic confirmation delivery"),
 						'deferred' => PayEngine3Cw_Language::_("Authorization"),
 					),
 					'default' => 'deferred',
 				),
 				'address_equal' => array(
					'title' => PayEngine3Cw_Language::_("Address equality"),
 					'description' => PayEngine3Cw_Language::_("RatePay generally declines transactions where billing and delivery addresses do not match Please note that differing addresses require an additional agreement with RatePay"),
 					'type' => 'SELECT',
 					'options' => array(
						'equal' => PayEngine3Cw_Language::_("Must be the same"),
 						'different' => PayEngine3Cw_Language::_("May be different"),
 					),
 					'default' => 'equal',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'ServerAuthorization' => PayEngine3Cw_Language::_("Server Authorization"),
 					),
 					'default' => 'ServerAuthorization',
 				),
 			),
 			'payengine3cw_ratepaydirectdebits' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'EUR',
 						1 => 'CHF',
 					),
 				),
 				'capturing' => array(
					'title' => PayEngine3Cw_Language::_("Capturing"),
 					'description' => PayEngine3Cw_Language::_("Should the amount be confirmed automatically or should the amount only be authorised Please note that the automatic confirmation should only be used for digital goods and similar cases Once the payment has been made the goods should be immediately available"),
 					'type' => 'SELECT',
 					'options' => array(
						'direct' => PayEngine3Cw_Language::_("Automatic confirmation delivery"),
 						'deferred' => PayEngine3Cw_Language::_("Authorization"),
 					),
 					'default' => 'deferred',
 				),
 				'address_equal' => array(
					'title' => PayEngine3Cw_Language::_("Address equality"),
 					'description' => PayEngine3Cw_Language::_("RatePay generally declines transactions where billing and delivery addresses do not match Please note that differing addresses require an additional agreement with RatePay"),
 					'type' => 'SELECT',
 					'options' => array(
						'equal' => PayEngine3Cw_Language::_("Must be the same"),
 						'different' => PayEngine3Cw_Language::_("May be different"),
 					),
 					'default' => 'equal',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'ServerAuthorization' => PayEngine3Cw_Language::_("Server Authorization"),
 					),
 					'default' => 'ServerAuthorization',
 				),
 			),
 			'payengine3cw_ratepayinstallments' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'EUR',
 					),
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'ServerAuthorization' => PayEngine3Cw_Language::_("Server Authorization"),
 					),
 					'default' => 'ServerAuthorization',
 				),
 			),
 			'payengine3cw_sofortueberweisung' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'AED',
 						1 => 'ANG',
 						2 => 'ARS',
 						3 => 'AUD',
 						4 => 'AWG',
 						5 => 'BGN',
 						6 => 'BRL',
 						7 => 'BYN',
 						8 => 'CAD',
 						9 => 'CHF',
 						10 => 'CNY',
 						11 => 'CZK',
 						12 => 'DKK',
 						13 => 'EGP',
 						14 => 'EUR',
 						15 => 'GBP',
 						16 => 'GEL',
 						17 => 'HKD',
 						18 => 'HRK',
 						19 => 'HUF',
 						20 => 'ILS',
 						21 => 'ISK',
 						22 => 'JPY',
 						23 => 'KRW',
 						24 => 'LTL',
 						25 => 'LVL',
 						26 => 'MAD',
 						27 => 'MXN',
 						28 => 'NOK',
 						29 => 'NZD',
 						30 => 'PLN',
 						31 => 'RON',
 						32 => 'RUB',
 						33 => 'SEK',
 						34 => 'SGD',
 						35 => 'THB',
 						36 => 'TRY',
 						37 => 'UAH',
 						38 => 'USD',
 						39 => 'XAF',
 						40 => 'XOF',
 						41 => 'XPF',
 						42 => 'ZAR',
 					),
 				),
 				'capturing' => array(
					'title' => PayEngine3Cw_Language::_("Capturing"),
 					'description' => PayEngine3Cw_Language::_("Should the amount be captured automatically debit or should the amount only be reserved deferred"),
 					'type' => 'SELECT',
 					'options' => array(
						'direct' => PayEngine3Cw_Language::_("Directly after order"),
 						'deferred' => PayEngine3Cw_Language::_("Deferred"),
 					),
 					'default' => 'direct',
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'PaymentPage' => PayEngine3Cw_Language::_("Payment Page"),
 					),
 					'default' => 'PaymentPage',
 				),
 			),
 			'payengine3cw_ideal' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'EUR',
 					),
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'PaymentPage' => PayEngine3Cw_Language::_("Payment Page"),
 					),
 					'default' => 'PaymentPage',
 				),
 			),
 			'payengine3cw_alipay' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'AUD',
 						1 => 'CAD',
 						2 => 'EUR',
 						3 => 'GBP',
 						4 => 'HKD',
 						5 => 'SGD',
 						6 => 'USD',
 					),
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'PaymentPage' => PayEngine3Cw_Language::_("Payment Page"),
 					),
 					'default' => 'PaymentPage',
 				),
 			),
 			'payengine3cw_bcmc' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'EUR',
 					),
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'PaymentPage' => PayEngine3Cw_Language::_("Payment Page"),
 					),
 					'default' => 'PaymentPage',
 				),
 			),
 			'payengine3cw_wechatpay' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'EUR',
 						1 => 'USD',
 					),
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'PaymentPage' => PayEngine3Cw_Language::_("Payment Page"),
 					),
 					'default' => 'PaymentPage',
 				),
 			),
 			'payengine3cw_giropay' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'EUR',
 					),
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'PaymentPage' => PayEngine3Cw_Language::_("Payment Page"),
 					),
 					'default' => 'PaymentPage',
 				),
 			),
 			'payengine3cw_eps' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'EUR',
 					),
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'PaymentPage' => PayEngine3Cw_Language::_("Payment Page"),
 					),
 					'default' => 'PaymentPage',
 				),
 			),
 			'payengine3cw_postfinancecard' => array(
				'active_currencies' => array(
					'title' => PayEngine3Cw_Language::_("Allowed Currencies"),
 					'description' => PayEngine3Cw_Language::_("This payment method is only active for the selected currencies If none is selected the method is active for all currencies"),
 					'type' => 'currencyselect',
 					'default' => '',
 					'allowedCurrencies' => array(
						0 => 'CHF',
 						1 => 'EUR',
 					),
 				),
 				'capturing' => array(
					'title' => PayEngine3Cw_Language::_("Capturing"),
 					'description' => PayEngine3Cw_Language::_("Should the amount be captured automatically debit or should the amount only be reserved deferred"),
 					'type' => 'SELECT',
 					'options' => array(
						'direct' => PayEngine3Cw_Language::_("Directly after order"),
 						'deferred' => PayEngine3Cw_Language::_("Deferred"),
 					),
 					'default' => 'direct',
 				),
 				'device_id' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking"),
 					'description' => PayEngine3Cw_Language::_("Should device tracking be used and if when"),
 					'type' => 'SELECT',
 					'options' => array(
						'inactive' => PayEngine3Cw_Language::_("Inactive"),
 						'minimum' => PayEngine3Cw_Language::_("Minimum amount below"),
 						'new_customer' => PayEngine3Cw_Language::_("Run for new customers"),
 					),
 					'default' => 'inactive',
 				),
 				'device_id_minimum' => array(
					'title' => PayEngine3Cw_Language::_("Device tracking minimum amount"),
 					'description' => PayEngine3Cw_Language::_("Minimum cart amount which must be reached for device tracking to be used when configured to only run above certain amounts"),
 					'type' => 'TEXTFIELD',
 					'default' => '0',
 				),
 				'status_authorized' => array(
					'title' => PayEngine3Cw_Language::_("Authorized Status"),
 					'description' => PayEngine3Cw_Language::_("This status is set when the payment was successfull and it is authorized"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'authorized',
 				),
 				'status_uncertain' => array(
					'title' => PayEngine3Cw_Language::_("Uncertain Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for new orders that have an uncertain authorisation status"),
 					'type' => 'ORDERSTATUSSELECT',
 					'default' => 'uncertain',
 				),
 				'status_cancelled' => array(
					'title' => PayEngine3Cw_Language::_("Cancelled Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status when an order is cancelled"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'cancelled',
 				),
 				'status_captured' => array(
					'title' => PayEngine3Cw_Language::_("Captured Status"),
 					'description' => PayEngine3Cw_Language::_("You can specify the order status for orders that are captured either directly after the order or manually in the backend"),
 					'type' => 'ORDERSTATUSSELECT',
 					'options' => array(
						'no_status_change' => PayEngine3Cw_Language::_("Dont change order status"),
 					),
 					'default' => 'no_status_change',
 				),
 				'authorizationMethod' => array(
					'title' => PayEngine3Cw_Language::_("Authorization Method"),
 					'description' => PayEngine3Cw_Language::_("Select the authorization method to use for processing this payment method"),
 					'type' => 'SELECT',
 					'options' => array(
						'PaymentPage' => PayEngine3Cw_Language::_("Payment Page"),
 					),
 					'default' => 'PaymentPage',
 				),
 			),
 		);
	
		self::$settingDefinitions = $definitions;
		return self::$settingDefinitions;
	}
	
}
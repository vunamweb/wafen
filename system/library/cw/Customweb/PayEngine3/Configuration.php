<?php

/**
 *  * You are allowed to use this API in your web application.
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

require_once 'Customweb/PayEngine3/Exception/MissingConfigurationException.php';
require_once 'Customweb/I18n/Translation.php';


/**
 *
 * @author Sebastian Bossert
 * @Bean
 */
class Customweb_PayEngine3_Configuration {
	/**
	 *
	 * @var Customweb_Payment_IConfigurationAdapter
	 */
	private $configurationAdapter = null;
	
	private static $forceLive = false;
	
	/**
	 * Forces live mode to be used. Used for RatePay calculator, which does not support test mode.
	 * 
	 * @param boolean $value
	 */
	public static function forceLive($value = true) {
		self::$forceLive = $value;
	}

	public function __construct(Customweb_Payment_IConfigurationAdapter $configurationAdapter){
		$this->configurationAdapter = $configurationAdapter;
	}

	public function isLiveMode(){
		return self::$forceLive || $this->getConfigurationValue('operating_mode', Customweb_I18n_Translation::__("Operation mode")) == 'live';
	}

	public function getMerchantId(){
		return $this->getTestSwitchConfiguration('merchant_id', Customweb_I18n_Translation::__("Merchant ID"));
	}

	public function getMerchantPassword(){
		return $this->getTestSwitchConfiguration('merchant_password', Customweb_I18n_Translation::__("Merchant Password"));
	}

	public function getApiUrl(){
		if ($this->isLiveMode()) {
			return 'https://api.payengine.de/';
		}
		return 'https://apitest.payengine.de/';
	}

	public function getFrontendUrl(){
		if ($this->isLiveMode()) {
			return 'https://pp.payengine.de/';
		}
		else {
			return 'https://pptest.payengine.de/';
		}
	}

	public function getBaseJavascriptUrl(){
		return $this->getFrontendUrl() . 'bridge/1.0/payengine.min.js';
	}

	public function getWidgetJavascriptUrl(){
		return $this->getFrontendUrl() . 'widgetjs/payengine.widget.min.js';
	}

	public function getOrderIdSchema(){
		return $this->configurationAdapter->getConfigurationValue('order_schema');
	}

	/**
	 * Retrieves a setting which exists for both test and live.
	 *
	 * @param string $key
	 * @param Customweb_I18n_LocalizableString $label
	 */
	private function getTestSwitchConfiguration($key, Customweb_I18n_LocalizableString $label){
		if ($this->isLiveMode()) {
			$key .= '_live';
			$label = Customweb_I18n_Translation::__("@label (Live)", array(
				'@label' => $label->toString() 
			));
		}
		else {
			$key .= '_test';
			$label = Customweb_I18n_Translation::__("@label (Test)", array(
				'@label' => $label->toString() 
			));
		}
		return $this->getConfigurationValue($key, $label);
	}

	/**
	 * Retrieves a configuration value based on the supplied key.
	 * If the setting is a string surrounding whitespaces will be removed.
	 * If label is set, we check if the value is not empty, and throw an exception if it is.
	 *
	 * @param string $key
	 * @param string $label
	 * @param string $language
	 * @throws Exception
	 * @return
	 */
	private function getConfigurationValue($key, $label = null, $language = null){
		$value = $this->configurationAdapter->getConfigurationValue($key, $language);
		if (is_string($value)) {
			$value = trim($value);
		}
		if (empty($value) && !empty($label)) {
			throw new Customweb_PayEngine3_Exception_MissingConfigurationException($label);
		}
		return $value;
	}
}
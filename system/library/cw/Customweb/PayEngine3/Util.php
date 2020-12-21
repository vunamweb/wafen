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

require_once 'Customweb/Core/String.php';
require_once 'Customweb/Payment/Authorization/ErrorMessage.php';
require_once 'Customweb/I18n/Translation.php';


/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Util {

	/**
	 * @return array, list of keys for form fields which should be saved to paymentcustomercontext.
	 */
	private static function getSavableFormFields(){
		return array(
			'payengine3-y',
			'payengine3-m',
			'payengine3-d',
			'payengine3-phone',
			'payengine3-gender',
			'payengine3-iban',
			'payengine3-company-name',
			'payengine3-organization-registration-id',
			'payengine3-organization-vat-id',
			'payengine3-organization-entity-type',
			'payengine3-bic'
		);
	}

	/**
	 * @return array, list of keys for form fields which should be saved to the transaction
	 */
	private static function getTransmittableFormFields(){
		return array_merge(self::getSavableFormFields(),
				array(
					'payengine3-tracking',
					'payengine3-ratepay-tracking',
					'payengine3-consent',
					'payengine3-rate-result',
					'payengine3-debit-mandate' 
				));
	}

	/**
	 * Whitelist which parameters are expected.
	 *
	 * @param array $parameters
	 * @return array
	 */
	public static function filterFormFields(array $parameters){
		return array_intersect_key($parameters, array_flip(self::getTransmittableFormFields()));
	}

	/**
	 * Whitelist which parameters should be saved to paymentCustomerContext map..
	 *
	 * @param array $parameters
	 * @return array
	 */
	public static function filterPaymentMap(array $parameters){
		return array_intersect_key($parameters, array_flip(self::getSavableFormFields()));
	}

	private static function getSpecialCharFilter(){
		return array(
			"!",
			"@",
			"#",
			"$",
			"%",
			"^",
			"&",
			"*",
			"_",
			"+",
			"=",
			"[",
			"]",
			"{",
			"}",
			"\\",
			"\"",
			";",
			":",
			"\n",
			"\r",
			"\t",
			"<",
			">",
			"?",
			"/" 
		);
	}

	public static function cleanPhoneNumber($number){
		$cleaned = preg_replace("/[+]{0,1}[^\d\-\/]/", "", $number);
		//Max length of phone number is 15
		if (strlen($cleaned) > 15) {
			return substr($cleaned, 0, 15);
		}
		return $cleaned;
	}

	public static function cleanStringAlphaExtended($string, $length = null){
		if (empty($string)) {
			return $string;
		}
		$cleaned = preg_replace("/[^ ,.'\-\pL]/u", "", $string);
		if ($length !== null) {
			$cleaned = Customweb_Core_String::_($cleaned)->substring(0, $length)->toString();
		}
		return $cleaned;
	}

	public static function cleanStringAlphaNumericExtended($string, $length = null){
		if (empty($string)) {
			return $string;
		}
		$cleaned = preg_replace("/[^ ,.'\-\pL\d]/u", "", $string);
		if ($length !== null) {
			$cleaned = Customweb_Core_String::_($cleaned)->substring(0, $length)->toString();
		}
		return $cleaned;
	}

	/**
	 * Calculate the modifiers used for quantities to ensure only integers are passed.
	 * 
	 * E.g. 10.2 => modifier = 10^1
	 * 		10.22 => modifier = 10^2
	 * 
	 * @return array
	 */
	public static function getItemQuantityModifiers(array $basketItems, array $invoiceItems){
		$quantityModifiers = array();
		foreach ($invoiceItems as $invoiceItem) {
			foreach ($basketItems as $basketItem) {
				if ($invoiceItem->getOriginalSku() == $basketItem->getOriginalSku()) {
					$quantityModifiers[$basketItem->getSku()] = pow(10, strlen(substr(strrchr($invoiceItem->getQuantity(), "."), 1)));
				}
			}
		}
		return $quantityModifiers;
	}

	public static function extractErrorFromTransaction(array $transaction, $fallbackText = null){
		if (empty($fallbackText)) {
			$fallbackText = Customweb_I18n_Translation::__("The transaction failed.");
		}
		$customerMessage = $merchantMessage = $fallbackText;
		if (isset($transaction['merchantMessage'])) {
			$merchantMessage = $transaction['merchantMessage'];
		}
		if (isset($transaction['customerMessage'])) {
			$customerMessage = $transaction['customerMessage'];
		}
		return new Customweb_Payment_Authorization_ErrorMessage($customerMessage, $merchantMessage);
	}
}
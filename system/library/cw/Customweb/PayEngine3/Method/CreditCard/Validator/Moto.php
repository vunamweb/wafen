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

require_once 'Customweb/Form/Validator/IValidator.php';
require_once 'Customweb/I18n/Translation.php';


/**
 * This validator calls the PayEngineWidget validate function, and then the pay function.
 * The pay function calls a callback which was transmitted before, so we must define the callback here to be resultCallback(true) or false..
 * 
 * @author bossert
 */
class Customweb_PayEngine3_Method_CreditCard_Validator_Moto implements Customweb_Form_Validator_IValidator {
	private $prefix;
	private $control;
	private $paymentInstrumentControlId;

	public function __construct(Customweb_Form_Control_IControl $control, $prefix, $paymentInstrumentControlId){
		$this->control = $control;
		$this->prefix = $prefix;
		$this->paymentInstrumentControlId = $paymentInstrumentControlId;
	}

	public function getCallbackJs(){
		$message = Customweb_I18n_Translation::__("Please check your input.");
		$message = str_replace("'", "&#39;", $message);
		return "function(resultCallback, element){
document.{$this->prefix}Success = {callback: function(url){
	document.getElementById('{$this->paymentInstrumentControlId}').value = document.{$this->prefix}PaymentInstrumentId;
	resultCallback(true);
}, url: ''};
document.{$this->prefix}Fail = {callback: function(url){resultCallback(false, document.{$this->prefix}Error);}, url: ''};
PayEngineWidget.validate(document.{$this->prefix}Reference, function(error, result) {
	if(error && !(error.cardNumber && error.expiry && error.verification)) {
		resultCallback(false, '{$message}');
	} else {
		PayEngineWidget.pay(document.{$this->prefix}Reference);
	}
});
}";
	}

	public function getControl(){
		return $this->control;
	}
}

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

require_once 'Customweb/PayEngine3/Authorization/Transaction.php';
require_once 'Customweb/Form/Element.php';
require_once 'Customweb/PayEngine3/Method/CreditCard/Validator/Ajax.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/PayEngine3/Method/Default.php';
require_once 'Customweb/Form/Control/Html.php';
require_once 'Customweb/Form/WideElement.php';
require_once 'Customweb/Payment/Util.php';
require_once 'Customweb/Util/JavaScript.php';


/**
 *
 * @author Sebastian Bossert
 * @Method(paymentMethods={'creditcard'}, authorizationMethods={'ajaxauthorization', 'recurring'})
 */
class Customweb_PayEngine3_Method_CreditCard_Ajax extends Customweb_PayEngine3_Method_Default {

	/**
	 * Returns prefix to uniquely identify the widget's payment method.
	 */
	public function getWidgetPrefix(){
		return 'payengine3_' . $this->getPaymentMethodName() . '_';
	}

	public function getOrderId(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$applied = Customweb_Payment_Util::applyOrderSchemaImproved($this->getContainer()->getConfiguration()->getOrderIdSchema(),
				$transaction->getExternalTransactionId(), 30);
		$applied = str_replace("_", "x", $applied); // separate externaltransactionid
		$applied = preg_replace("/\W/", "", $applied);
		return $applied;
	}

	public function getJavaScriptCallbackFunction(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$context = $transaction->getTransactionContext();
		/* @var $context Customweb_Payment_Authorization_Ajax_ITransactionContext */
		
		$successCallback = $context->getJavaScriptSuccessCallbackFunction();
		
		if ($transaction->getTransactionContext()->getAlias() instanceof Customweb_PayEngine3_Authorization_Transaction) {
			$url = $this->getSubmissionUrl($transaction, 'alias');
			return "function(formFieldValues){($successCallback)($url);}";
		}
		
		$failCallback = $context->getJavaScriptFailedCallbackFunction();
		$url = $this->getSubmissionUrl($transaction, 'return');
		$failUrl = "'" . $this->getContainer()->createSecuredEndpointUrl('process', 'fail', $transaction) . "'";
		$prefix = $this->getWidgetPrefix();
		return "function(formFieldValues) {
	document.{$prefix}Success = {url: {$url}, callback: ({$successCallback})};
	document.{$prefix}Fail = {url: {$failUrl}, callback: ({$failCallback})};

	PayEngineWidget.pay(document.{$prefix}Reference);
}";
	}
	
	/**
	 * Returns submission url with single quotation marks surrounding it, and containing reference to tracking field if required.
	 * 
	 * @param Customweb_PayEngine3_Authorization_Transaction $transaction
	 * @param string $action
	 * @return string
	 */
	private function getSubmissionUrl(Customweb_PayEngine3_Authorization_Transaction $transaction, $action){
		$url = "'" . $this->getContainer()->createSecuredEndpointUrl('process', $action, $transaction);
		if ($this->useDeviceId($transaction->getTransactionContext()->getOrderContext())) {
			$url .= "&payengine3-tracking=' + formFieldValues['payengine3-tracking']";
		}
		else {
			$url .= "'";
		}
		return $url;
	}

	protected function getAliasFields(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$fields = parent::getVisibleFormFields($transaction->getTransactionContext()->getOrderContext(), $transaction->getAlias(), null,
				$transaction->getTransactionContext()->getPaymentCustomerContext());
		
		$control = new Customweb_Form_Control_Html('payengine3-selected', $transaction->getAliasForDisplay());
		$fields[] = new Customweb_Form_Element(Customweb_I18n_Translation::__("Selected payment"), $control);
		
		return $fields;
	}

	public function getVisibleFormFields(Customweb_Payment_Authorization_IOrderContext $orderContext, $aliasTransaction, $failedTransaction, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentCustomerContext){
		if ($aliasTransaction instanceof Customweb_PayEngine3_Authorization_Transaction) {
			return $this->getAliasFields($aliasTransaction);
		}
		$fields = parent::getVisibleFormFields($orderContext, $aliasTransaction, $failedTransaction, $paymentCustomerContext);
		
		$language = $orderContext->getLanguage()->getIso2LetterCode();
		$prefix = $this->getWidgetPrefix();
		$loadJs = Customweb_Util_JavaScript::loadScript($this->getContainer()->getConfiguration()->getWidgetJavascriptUrl(),
				'payengine3WidgetLoaded', $prefix . 'WidgetInitialize');
		$productName = $this->getProductName();
		$merchantId = $this->getContainer()->getConfiguration()->getMerchantId();
		
		$customStyle = '';
		if ($this->existsPaymentMethodConfigurationValue('custom_style')) {
			$customStyle = $this->getPaymentMethodConfigurationValue('custom_style');
		}
		
		$script = "
		var {$prefix}Reference;
		var {$prefix}Error;
						
		function {$prefix}InitCallback(error, result) {
			if(error && !(error.cardNumber && error.expiry && error.verification)) {
				{$prefix}Error = error;
			}
			document.{$prefix}Reference = result;
		}

		function {$prefix}ResultCallback(error, result) {
			if (typeof document.{$prefix}Success === 'undefined' || typeof document.{$prefix}Fail === 'undefined') {
				alert('The payment could not be loaded. Please reload the page and try again.');
				if(error && !(error.cardNumber && error.expiry && error.verification)) {
					console.dir(error);
				}
				return;
			}
			if(error && !(error.cardNumber && error.expiry && error.verification)) {
				if(error.errors) {
					var codes = error.errors.map(function(e) { return e.code; }).join(',');
					var messages = error.errors.map(function(e) { return e.message; }).join(' ');
					document.{$prefix}Fail.url += '&codes=' + codes + '&messages=' + messages;
				}
				document.{$prefix}Fail.url += '&message=' + error.message;
				document.{$prefix}Error = error.message;
				document.{$prefix}Fail.callback(document.{$prefix}Fail.url);
			}
			else {
				document.{$prefix}PaymentInstrumentId = result.paymentInstrumentId;
				document.{$prefix}Success.callback(document.{$prefix}Success.url + '&paymentInstrumentId=' + result.paymentInstrumentId);
			}
		}

		function {$prefix}WidgetInitialize(){
			var container = document.getElementById('{$prefix}widget-container');
			container.parentNode.style.display = 'block';
			var publishableKey = '{$merchantId}';		
			var optionalParameters = new Object;
			optionalParameters.initCallback = {$prefix}InitCallback;
			optionalParameters.products = ['{$productName}'];
			optionalParameters.layout = null;
			optionalParameters.language = '{$language}';
			optionalParameters.customStyleId = '{$customStyle}' || null;
			optionalParameters.hidePayButton = true;
			optionalParameters.redirectUser = true;
			optionalParameters.hideTitleIcons = true;
			optionalParameters.skipFinalResultView = true;

			PayEngineWidget.initAsInlineComponentPi(
				container,
				publishableKey,
				optionalParameters,
				{$prefix}ResultCallback
		    );
		}
		
		if (typeof window.payengine3WidgetLoadedSafariSafe === 'undefined') {
			window.payengine3WidgetLoadedSafariSafe = 'defined';
			function payengine3WidgetLoaded(){
				return (typeof PayEngineWidget !== 'undefined');
			}
			{$loadJs}
		}
		else {
			{$prefix}WidgetInitialize();
		}";
		
		$height = $this->getIframeHeight();
		if (ctype_digit($height) || is_int($height)) {
			$height .= 'em';
		}
		$htmlContent = "<div id='{$prefix}widget-container' style='height:{$height}; overflow:hidden;'></div>";
		$control = new Customweb_Form_Control_Html('payengine3-container', $htmlContent);
		$control->addValidator($this->getValidator($control));
		
		if ($this->useWideElement()) {
			$field = new Customweb_Form_WideElement($control);
		}
		else {
			$field = new Customweb_Form_Element('', $control);
		}
		$field->setRequired(false);
		$field->appendJavaScript($script);
		
		$fields[] = $field;
		
		return $fields;
	}

	protected function getValidator(Customweb_Form_Control_IControl $control){
		return new Customweb_PayEngine3_Method_CreditCard_Validator_Ajax($control, $this->getWidgetPrefix());
	}

	private function useWideElement(){
		return $this->existsPaymentMethodConfigurationValue('element_style') && $this->getPaymentMethodConfigurationValue('element_style') === 'wide';
	}

	protected function getIframeHeight(){
		if ($this->existsPaymentMethodConfigurationValue('iframe_height')) {
			$height = $this->getPaymentMethodConfigurationValue('iframe_height');
			if (!empty($height)) {
				return $height;
			}
		}
		return 15;
	}

	public function setAliasForDisplay(Customweb_PayEngine3_Authorization_Transaction $transaction, array $paymentInstrument){
		if ($transaction->getTransactionContext()->getAlias() == 'new' && isset($paymentInstrument['recurring']) && $paymentInstrument['recurring'] &&
				 isset($paymentInstrument['attributes']) && isset($paymentInstrument['attributes']['cardNumber'])) {
			$transaction->setAliasForDisplay($paymentInstrument['attributes']['cardNumber']);
		}
	}
}
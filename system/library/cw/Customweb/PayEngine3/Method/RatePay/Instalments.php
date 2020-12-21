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

require_once 'Customweb/PayEngine3/Method/RatePay/Invoice.php';
require_once 'Customweb/Form/Validator/NotEmpty.php';
require_once 'Customweb/Form/Control/HiddenInput.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/Form/HiddenElement.php';
require_once 'Customweb/Form/Control/Html.php';
require_once 'Customweb/PayEngine3/Method/RatePay/TemplateAdapter.php';
require_once 'Customweb/Form/WideElement.php';


/**
 *
 * @author Sebastian Bossert
 * @Method(paymentMethods={'RatePayInstallments'})
 */
class Customweb_PayEngine3_Method_RatePay_Instalments extends Customweb_PayEngine3_Method_RatePay_Invoice {

	public function processServerAuthorizationParent(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		return parent::processServerAuthorization($transaction, $formData);
	}

	public function getVisibleFormFields(Customweb_Payment_Authorization_IOrderContext $orderContext, $aliasTransaction, $failedTransaction, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentCustomerContext){
		$fields = parent::getVisibleFormFields($orderContext, $aliasTransaction, $failedTransaction, $paymentCustomerContext);
		$agreement = array_pop($fields);
		$rateField = $this->getRateTransmissionField();
		$rateTypeField = $this->getRateTypeTransmissionField();
		$ibanField = $this->getDebitIbanTransmissionField();
		$bicField = $this->getDebitBicTransmissionField();
		$mandateField = $this->getDebitMandateTransmissionField();
		$fields[] = $this->getRateCalculator($orderContext, $rateField->getControl()->getControlId(), $rateTypeField->getControl()->getControlId(), $ibanField->getControl()->getControlId(), $bicField->getControl()->getControlId(), $mandateField->getControl()->getControlId());
		$fields[] = $rateField;
		$fields[] = $rateTypeField;
		$fields[] = $ibanField;
		$fields[] = $bicField;
		$fields[] = $mandateField;
		$fields[] = $agreement;
		return $fields;
	}

	private function getRateCalculator(Customweb_Payment_Authorization_IOrderContext $orderContext, $rateId, $rateTypeId, $ibanId, $bicId, $mandateId){
		$adapter = new Customweb_PayEngine3_Method_RatePay_TemplateAdapter($this->getContainer());
		$calculator = $adapter->renderHtml($orderContext, $rateId, $rateTypeId, $ibanId, $bicId, $mandateId);
		$calculator = str_replace('"', "'", $calculator);
		$control = new Customweb_Form_Control_Html('payengine3-calculator', $calculator);
		$element = new Customweb_Form_WideElement($control);
		$content = $control->getContent()->toString();
		$element->appendJavaScript($this->extractJavascript($content));
		$control->setContent($this->removeJavascript($content));
		return $element;
	}
	
	private function removeJavascript($html) {
		return preg_replace("/<script.*<\/script>/ms", "", $html); // greedy, if possible match multiple script elements at once.
	}
	
	private function extractJavascript($html) {
		$sources = array();
		preg_match_all("/<script.*?src='(.+?)'/", $html, $sources);
		$scripts = array();
		preg_match_all("/<script type='text\/javascript'>(.+?)<\/script>/ms", $html, $scripts);
		$script = implode("\n", $scripts[1]);
		$script .= "var script;";
		foreach($sources[1] as $source) {
			$script .= "script = document.createElement('script'); script.src='$source'; document.head.appendChild(script); ";
		}
		return $script;
	}

	private function getRateTypeTransmissionField(){
		$control = new Customweb_Form_Control_HiddenInput('payengine3-rate-type', 'debit');
		$control->addValidator(
				new Customweb_Form_Validator_NotEmpty($control, Customweb_I18n_Translation::__("Please select invoice or debit type.")));
		$control->setRequired(true);
		return new Customweb_Form_HiddenElement($control);
	}
	
	private function getDebitIbanTransmissionField(){
		$control = new Customweb_Form_Control_HiddenInput('payengine3-iban');
		$control->addValidator(new Customweb_Form_Validator_NotEmpty($control, Customweb_I18n_Translation::__("Please enter your IBAN.")));
		$control->setRequired(true);
		return new Customweb_Form_HiddenElement($control);
	}
	private function getDebitBicTransmissionField(){
		$control = new Customweb_Form_Control_HiddenInput('payengine3-bic');
		$control->setRequired(false);
		return new Customweb_Form_HiddenElement($control);
	}

	private function getDebitMandateTransmissionField(){
		$control = new Customweb_Form_Control_HiddenInput('payengine3-debit-mandate');
// 		$control->addValidator(new Customweb_Form_Validator_NotEmpty($control, Customweb_I18n_Translation::__("Please agree to the mandate.")));
// 		$control->setRequired(true);
		return new Customweb_Form_HiddenElement($control);
	}

	private function getRateTransmissionField(){
		$control = new Customweb_Form_Control_HiddenInput('payengine3-rate-result');
		$control->addValidator(new Customweb_Form_Validator_NotEmpty($control, Customweb_I18n_Translation::__("Please calculate and select a rate.")));
		$control->setRequired(true);
		return new Customweb_Form_HiddenElement($control);
	}

	public function getAdditionalOrderPayload(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		$payload = parent::getAdditionalOrderPayload($transaction, $formData);
		
		if ($formData['payengine3-rate-type'] === 'debit') {
			$payload['payment']['iban'] = $formData['payengine3-iban'];
			$address = $transaction->getTransactionContext()->getOrderContext()->getBillingAddress();
			$payload['payment']['accountHolder'] = $address->getFirstName() . ' ' . $address->getLastName();
			if(isset($formData['payengine3-bic']) && !empty($formData['payengine3-bic'])) {
				$payload['payment']['bic'] = $formData['payengine3-bic'];
			}
		}
		
		$rate = json_decode(base64_decode($formData['payengine3-rate-result']), true);
		$payload['payment']['totalAmount'] = floatval($rate['totalAmount']);
		$payload['payment']['numberOfRates'] = floatval($rate['numberOfRates']);
		$payload['payment']['rate'] = floatval($rate['rate']);
		$payload['payment']['lastRate'] = floatval($rate['lastRate']);
		$payload['payment']['interestRate'] = floatval($rate['interestRate']);
		return $payload;
	}
}
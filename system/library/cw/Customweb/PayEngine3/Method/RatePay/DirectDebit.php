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
require_once 'Customweb/Form/Element.php';
require_once 'Customweb/Form/Validator/NotEmpty.php';
require_once 'Customweb/Form/Validator/Checked.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/Form/Control/Html.php';
require_once 'Customweb/Form/Control/SingleCheckbox.php';
require_once 'Customweb/Form/Control/TextInput.php';


/**
 *
 * @author Sebastian Bossert
 * @Method(paymentMethods={'RatePayDirectDebits'})
 */
class Customweb_PayEngine3_Method_RatePay_DirectDebit extends Customweb_PayEngine3_Method_RatePay_Invoice {

	public function useBasket(){
		return true;
	}

	public static function extractIban(Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext, array $formData){
		$update = $paymentContext->getMap();
		$iban = null;
		
		if (isset($formData['payengine3-iban'])) {
			$update['payengine3-iban'] = $iban = trim($formData['payengine3-iban']);
		}
		
		if (empty($iban)) {
			throw new Exception(Customweb_I18n_Translation::__("Please enter your IBAN."));
		}
		$paymentContext->updateMap($update);
		return $iban;
	}

	public function getAdditionalOrderPayload(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		$additional = parent::getAdditionalOrderPayload($transaction, $formData);
		$iban = $this->extractIban($transaction->getPaymentCustomerContext(), $formData);
		$additional['payment']['iban'] = $iban;
		$address = $transaction->getTransactionContext()->getOrderContext()->getBillingAddress();
		$additional['payment']['accountHolder'] = $address->getFirstName() . ' ' . $address->getLastName();
		return $additional;
	}

	public function getVisibleFormFields(Customweb_Payment_Authorization_IOrderContext $orderContext, $aliasTransaction, $failedTransaction, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentCustomerContext){
		$fields = parent::getVisibleFormFields($orderContext, $aliasTransaction, $failedTransaction, $paymentCustomerContext);
		
		// ensure agreement is at the bottom
		$agreement = array_pop($fields);
		
		$map = $paymentCustomerContext->getMap();
		
		$defaultValues = array(
			'payengine3-iban' => null 
		);
		
		$defaultValues = array_merge($defaultValues, $map);
		
		$mandateCompanyControl = new Customweb_Form_Control_Html('payengine3-mandate-company', $this->getPaymentMethodParameter('mandate_company'));
		$mandateCompanyControl->setRequired(false);
		$element = new Customweb_Form_Element("", $mandateCompanyControl);
		$element->setRequired(false);
		$fields[] = $element;
		
		$mandateCreditorControl = new Customweb_Form_Control_Html('payengine3-mandate-creditor',
				$this->getPaymentMethodParameter('mandate_creditor'));
		$mandateCreditorControl->setRequired(false);
		$element = new Customweb_Form_Element(Customweb_I18n_Translation::__("Creditor ID"), $mandateCreditorControl);
		$element->setRequired(false);
		$fields[] = $element;
		
		$legalControl = new Customweb_Form_Control_Html('payengine3-legal-text', $this->getLegalText());
		$legalControl->setRequired(false);
		$element = new Customweb_Form_Element("", $legalControl);
		$element->setRequired(false);
		$fields[] = $element;
		
		$mandateReferenceControl = new Customweb_Form_Control_Html('payengine3-mandate-reference',
				Customweb_I18n_Translation::__("The mandate reference will be transmitted after order completion."));
		$mandateReferenceControl->setRequired(false);
		$element = new Customweb_Form_Element(Customweb_I18n_Translation::__("Mandate Reference"), $mandateReferenceControl);
		$element->setRequired(false);
		$fields[] = $element;
		
		$holderControl = new Customweb_Form_Control_Html('payengine3-account-holder',
				$orderContext->getBillingAddress()->getFirstName() . ' ' . $orderContext->getBillingAddress()->getLastName());
		$fields[] = new Customweb_Form_Element(Customweb_I18n_Translation::__("Account Holder"), $holderControl);
		
		$ibanControl = new Customweb_Form_Control_TextInput('payengine3-iban', $defaultValues['payengine3-iban']);
		$ibanControl->addValidator(new Customweb_Form_Validator_NotEmpty($ibanControl, Customweb_I18n_Translation::__("Please enter your IBAN.")));
		$fields[] = new Customweb_Form_Element(Customweb_I18n_Translation::__("IBAN"), $ibanControl);
		
		$mandateTextControl = new Customweb_Form_Control_Html('payengine3-mandate-text', $this->getMandateText());
		$mandateTextControl->setRequired(false);
		$element = new Customweb_Form_Element("", $mandateTextControl);
		$element->setRequired(false);
		$fields[] = $element;
		
		$fields[] = $agreement;
		
		return $fields;
	}

	protected function getAgreementElement(Customweb_Payment_Authorization_IOrderContext $orderContext){
		$textToAgree = Customweb_I18n_Translation::__("I agree to the displayed mandate and linked conditions.");
		$checkbox = new Customweb_Form_Control_SingleCheckbox("payengine3-consent", "accepted", $textToAgree);
		$checkbox->addValidator(
				new Customweb_Form_Validator_Checked($checkbox, Customweb_I18n_Translation::__("You have to agree to the RatePay agreement.")));
		return new Customweb_Form_Element(Customweb_I18n_Translation::__("Terms &amp; Conditions and Privacy"), $checkbox);
	}

	private function getLegalText(){
		return Customweb_I18n_Translation::__(
				"Within the order process, we will be sending your data to RatePAY GmbH for the purpose of verifying your identity and creditworthiness as well as the performance of the contract. The <a href='//ratepay.com/legal/' title='Legal - RatePAY' target='_blank'>Additional General Terms and Conditions and Data Protection Notice of RatePAY GmbH</a> apply.");
	}

	private function getMandateText(){
		return Customweb_I18n_Translation::__(
				"I hereby authorise RatePAY GmbH, Franklinstr. 28-29, 10587 Berlin, Germany, to send instructions to my credit institute to debit all payments arising from this contract to the above-stated bank account, and authorise my credit institute to debit my account with all payments arising from this contract in accordance with the instructions from RatePAY GmbH.<br/>Note:<br/>Upon the conclusion of the contract, I will receive the mandate reference of RatePAY. I may request a refund of the debited amount within eight weeks after the debit date. The Terms & Conditions of my credit institute apply.");
	}

	protected function getPaymentMethodParameter($key){
		$parameters = $this->getPaymentMethodParameters();
		return $parameters[$key];
	}

	public function setAliasForDisplay(Customweb_PayEngine3_Authorization_Transaction $transaction, array $paymentInstrument){
		if ($transaction->getTransactionContext()->getAlias() == 'new' && isset($paymentInstrument['recurring']) && $paymentInstrument['recurring'] &&
				 ($paymentInstrument['attributes']) && isset($paymentInstrument['attributes']['iban'])) {
			$transaction->setAliasForDisplay($paymentInstrument['attributes']['iban']);
		}
	}
}
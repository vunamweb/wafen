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

require_once 'Customweb/Form/Element.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/PayEngine3/Method/Default.php';
require_once 'Customweb/Form/Control/Select.php';


/**
 *
 * @author Sebastian Bossert
 * @Method(paymentMethods={'ideal'})
 */
class Customweb_PayEngine3_Method_Ideal extends Customweb_PayEngine3_Method_Default {

	public function getAdditionalOrderPayload(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		if (!isset($formData['payengine3-bic'])) {
			throw new Exception("BIC must be set.");
		}
		$additional = parent::getAdditionalOrderPayload($transaction, $formData);
		$additional['payment']['bic'] = $formData['payengine3-bic'];
		$billing = $transaction->getTransactionContext()->getOrderContext()->getBillingAddress();
		$additional['payment']['accountHolder'] = $billing->getFirstName() . ' ' . $billing->getLastName();
		return $additional;
	}

	public function getVisibleFormFields(Customweb_Payment_Authorization_IOrderContext $orderContext, $aliasTransaction, $failedTransaction, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentCustomerContext){
		$fields = parent::getVisibleFormFields($orderContext, $aliasTransaction, $failedTransaction, $paymentCustomerContext);
		$fields[] = $this->getBankField();
		return $fields;
	}

	private function getBankField(){
		$control = new Customweb_Form_Control_Select('payengine3-bic', $this->getBankOptions());
		$element = new Customweb_Form_Element(Customweb_I18n_Translation::__("BIC"), $control);
		return $element;
	}

	private function getBankOptions(){
		return array(
			'RABONL2U' => 'Rabobank',
			'ABNANL2A' => 'ABN AMRO',
			'FVLBNL22' => 'Van Lanschot Bankiers',
			'TRIONL2U' => 'Triodos Bank',
			'INGBNL2A' => 'ING Bank',
			'SNSBNL2A' => 'SNS Bank',
			'ASNBNL21' => 'ASN',
			'RBRBNL21' => 'RegioBank',
			'KNABNL2H' => 'Knab',
			'INTENL2H' => 'Intersolve',
			'BUNQNL2A' => 'Bunq',
			'MOYONL21' => 'Moneyou' 
		);
	}
}

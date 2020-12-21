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
require_once 'Customweb/PayEngine3/Method/CreditCard/Ajax.php';
require_once 'Customweb/PayEngine3/Method/CreditCard/Validator/Moto.php';
require_once 'Customweb/Form/Control/HiddenInput.php';
require_once 'Customweb/Form/HiddenElement.php';


/**
 *
 * @author Sebastian Bossert
 * @Method(paymentMethods={'creditcard'}, authorizationMethods={'motoauthorization'})
 */
class Customweb_PayEngine3_Method_CreditCard_Moto extends Customweb_PayEngine3_Method_CreditCard_Ajax {
	private $paymentInstrumentControlId;

	public function getVisibleFormFields(Customweb_Payment_Authorization_IOrderContext $orderContext, $aliasTransaction, $failedTransaction, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentCustomerContext){
		$paymentInstrument = $this->getPaymentInstrumentElement($aliasTransaction);
		$fields = parent::getVisibleFormFields($orderContext, $aliasTransaction, $failedTransaction, $paymentCustomerContext);
		$fields[] = $paymentInstrument;
		return $fields;
	}

	private function getPaymentInstrumentElement($aliasTransaction){
		$default = '';
		if ($aliasTransaction instanceof Customweb_PayEngine3_Authorization_Transaction) {
			$default = $aliasTransaction->getPaymentInstrumentId();
		}
		$control = new Customweb_Form_Control_HiddenInput('paymentInstrumentId', $default);
		$this->paymentInstrumentControlId = $control->getControlId();
		return new Customweb_Form_HiddenElement($control);
	}

	protected function getValidator(Customweb_Form_Control_IControl $control){
		return new Customweb_PayEngine3_Method_CreditCard_Validator_Moto($control, $this->getWidgetPrefix(), $this->paymentInstrumentControlId);
	}
}
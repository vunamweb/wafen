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
require_once 'Customweb/Core/DateTime.php';
require_once 'Customweb/Payment/Authorization/IAdapter.php';
require_once 'Customweb/PayEngine3/Adapter.php';


/**
 *
 * @author Sebastian Bossert
 */
abstract class Customweb_PayEngine3_Authorization_AbstractAdapter extends Customweb_PayEngine3_Adapter implements 
		Customweb_Payment_Authorization_IAdapter {

	protected function createTransactionInner(Customweb_Payment_Authorization_ITransactionContext $transactionContext, $failedTransaction){
		$transaction = new Customweb_PayEngine3_Authorization_Transaction($transactionContext);
		$transaction->setAuthorizationMethod($this->getAuthorizationMethodName());
		$transaction->setLiveTransaction($this->getContainer()->getConfiguration()->isLiveMode());
		$transaction->setUpdateExecutionDate(Customweb_Core_DateTime::_()->addMinutes(30));
		
		$alias = $transactionContext->getAlias();
		if ($alias instanceof Customweb_PayEngine3_Authorization_Transaction) {
			$transaction->setExternalCustomerId($alias->getExternalCustomerId());
			// Persona & addresses may change
			$transaction->setPaymentInstrumentId($alias->getPaymentInstrumentId());
			$transaction->setProductName($this->getContainer()->getPaymentMethodByTransaction($transaction)->getAliasProductName());
		}
		else {
			$transaction->setProductName($this->getContainer()->getPaymentMethodByTransaction($transaction)->getProductName());
		}
		
		$transaction->setBackendOperationSupport($this->getContainer()->getPaymentMethodByTransaction($transaction));
		
		return $transaction;
	}

	protected function setExternalData(Customweb_PayEngine3_Authorization_Transaction $transaction, Customweb_PayEngine3_Authorization_Transaction $initial){
		$transaction->setPaymentInstrumentId($initial->getPaymentInstrumentId());
		$transaction->setExternalBillingId($initial->getExternalBillingId());
		$transaction->setExternalShippingId($initial->getExternalShippingId());
		$transaction->setExternalCustomerId($initial->getExternalCustomerId());
		$transaction->setExternalPersonaId($initial->getExternalPersonaId());
	}

	public function isAuthorizationMethodSupported(Customweb_Payment_Authorization_IOrderContext $orderContext){
		try {
			$this->getContainer()->getPaymentMethod($orderContext->getPaymentMethod(), $this->getAuthorizationMethodName());
			return true;
		}
		catch (Exception $e) {
			return false;
		}
	}

	public function isDeferredCapturingSupported(Customweb_Payment_Authorization_IOrderContext $orderContext, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext){
		return $this->getContainer()->getPaymentMethod($orderContext->getPaymentMethod(), $this->getAuthorizationMethodName())->isDeferredCapturingActive();
	}

	public function preValidate(Customweb_Payment_Authorization_IOrderContext $orderContext, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext){
		$this->getContainer()->getPaymentMethod($orderContext->getPaymentMethod(), $this->getAuthorizationMethodName())->preValidate($orderContext,
				$paymentContext);
	}

	public function validate(Customweb_Payment_Authorization_IOrderContext $orderContext, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext, array $formData){
		$this->getContainer()->getPaymentMethod($orderContext->getPaymentMethod(), $this->getAuthorizationMethodName())->validate($orderContext,
				$paymentContext, $formData);
	}
}

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

require_once 'Customweb/PayEngine3/Authorization/AbstractAdapter.php';
require_once 'Customweb/Payment/Authorization/Recurring/IAdapter.php';


/**
 *
 * @author Sebastian Bossert
 * @Bean
 */
class Customweb_PayEngine3_Authorization_Recurring_Adapter extends Customweb_PayEngine3_Authorization_AbstractAdapter implements 
		Customweb_Payment_Authorization_Recurring_IAdapter {

	public function createTransaction(Customweb_Payment_Authorization_Recurring_ITransactionContext $transactionContext){
		$transaction = $this->createTransactionInner($transactionContext, null);
		$this->setExternalData($transaction, $transactionContext->getInitialTransaction());
		$transaction->setProductName($this->getContainer()->getPaymentMethodByTransaction($transaction)->getAliasProductName());
		return $transaction;
	}

	public function getAdapterPriority(){
		return 100;
	}

	public function getAuthorizationMethodName(){
		return self::AUTHORIZATION_METHOD_NAME;
	}

	public function process(Customweb_Payment_Authorization_ITransaction $transaction){
		$this->getContainer()->getAuthorizationHandler()->registerAndExecuteOrder($transaction, array());
		$this->getContainer()->getAuthorizationHandler()->authorizeTransaction($transaction, array());
	}

	public function isPaymentMethodSupportingRecurring(Customweb_Payment_Authorization_IPaymentMethod $paymentMethod){
		try {
			return !in_array('recurring',
					$this->getContainer()->getPaymentMethod($paymentMethod, $this->getAuthorizationMethodName())->getNotSupportedFeatures());
		}
		catch (Exception $e) {
			return false;
		}
	}
}
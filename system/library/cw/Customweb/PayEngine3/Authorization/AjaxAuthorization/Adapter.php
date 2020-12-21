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
require_once 'Customweb/Payment/Authorization/Ajax/IAdapter.php';


/**
 *
 * @author Sebastian Bossert
 * @Bean
 */
class Customweb_PayEngine3_Authorization_AjaxAuthorization_Adapter extends Customweb_PayEngine3_Authorization_AbstractAdapter implements 
		Customweb_Payment_Authorization_Ajax_IAdapter {

	public function createTransaction(Customweb_Payment_Authorization_Ajax_ITransactionContext $transactionContext, $failedTransaction){
		return $this->createTransactionInner($transactionContext, $failedTransaction);
	}

	public function getAdapterPriority(){
		return 100;
	}

	public function getAuthorizationMethodName(){
		return self::AUTHORIZATION_METHOD_NAME;
	}

	public function getVisibleFormFields(Customweb_Payment_Authorization_IOrderContext $orderContext, $aliasTransaction, $failedTransaction, $paymentCustomerContext){
		return $this->getContainer()->getPaymentMethod($orderContext->getPaymentMethod(), $this->getAuthorizationMethodName())->getVisibleFormFields(
				$orderContext, $aliasTransaction, $failedTransaction, $paymentCustomerContext);
	}

	public function getAjaxFileUrl(Customweb_Payment_Authorization_ITransaction $transaction){
		return (string) $this->getContainer()->getPaymentMethodByTransaction($transaction)->getAjaxFileUrl($transaction);
	}

	public function getJavaScriptCallbackFunction(Customweb_Payment_Authorization_ITransaction $transaction){
		return $this->getContainer()->getPaymentMethodByTransaction($transaction)->getJavascriptCallbackFunction($transaction);
	}
}
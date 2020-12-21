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

require_once 'Customweb/PayEngine3/Container.php';
require_once 'Customweb/Payment/Endpoint/Controller/DelayedNotification.php';
require_once 'Customweb/Payment/Endpoint/Annotation/ExtractionMethod.php';
require_once 'Customweb/Payment/Authorization/DefaultTransaction.php';


/**
 *
 * @Controller("waiting")
 *
 */
class Customweb_PayEngine3_Endpoint_Waiting extends Customweb_Payment_Endpoint_Controller_DelayedNotification {
	private $____module___Container;

	/**
	 * @Action("check")
	 */
	public function check(Customweb_Core_Http_IRequest $request){
		sleep(2);
		$transaction = $this->getTransaction($request);
		$this->getContainer()->getAuthorizationHandler()->authorizeTransaction($transaction);
		$this->saveIfProcessed($transaction);
		return parent::check($request);
	}

	public function getControllerName(){
		return 'waiting';
	}
	
	protected function getWaitingText(Customweb_Payment_Authorization_ITransaction $transaction) {
		return $this->getContainer()->getPaymentMethodByTransaction($transaction)->getWaitingText($transaction->getTransactionContext()->getOrderContext()->getLanguage());
	}
	
	private function getTransaction(Customweb_Core_Http_IRequest $request){
		$transactionHandler = $this->getContainer()->getBean('Customweb_Payment_ITransactionHandler');
		$idMap = $this->getTransactionId($request);
		if ($idMap['key'] == Customweb_Payment_Endpoint_Annotation_ExtractionMethod::EXTERNAL_TRANSACTION_ID_KEY) {
			$transaction = $transactionHandler->findTransactionByTransactionExternalId($idMap['id']);
		}
		if ($transaction === null) {
			throw new Exception('No transaction found');
		}
		if (!$transaction instanceof Customweb_Payment_Authorization_DefaultTransaction) {
			throw new Exception('Transaction is not of type Customweb_Payment_Authorization_DefaultTransaction');
		}
		return $transaction;
	}

	/**
	 * Checks if the transaction has been authorized or failed, and saves it if it has.
	 * 
	 * @param Customweb_PayEngine3_Authorization_Transaction $transaction
	 */
	private function saveIfProcessed(Customweb_PayEngine3_Authorization_Transaction $transaction){
		if (!$transaction->isAuthorized() && !$transaction->isAuthorizationFailed()) {
			return;
		}
		$transactionHandler = $this->getContainer()->getBean('Customweb_Payment_ITransactionHandler');
		/* @var $transactionHandler Customweb_Payment_ITransactionHandler */
		try {
			$transactionHandler->beginTransaction();
			$transactionHandler->persistTransactionObject($transaction);
			$transactionHandler->commitTransaction();
		}
		catch (Customweb_Payment_Exception_OptimisticLockingException $e) {
			$transactionHandler->rollbackTransaction();
		}
	}

	/**
	 *
	 * @return Customweb_PayEngine3_Container
	 */
	protected function getContainer(){
		if ($this->____module___Container == null) {
			$container = parent::getContainer();
			if (!$container instanceof Customweb_PayEngine3_Container) {
				$container = new Customweb_PayEngine3_Container($container);
			}
			$this->____module___Container = $container;
		}
		return $this->____module___Container;
	}
}
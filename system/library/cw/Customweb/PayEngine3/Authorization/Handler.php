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

require_once 'Customweb/PayEngine3/Communication/Order/ProcessRequestBuilder.php';
require_once 'Customweb/Payment/Authorization/ErrorMessage.php';
require_once 'Customweb/PayEngine3/Communication/Simple.php';
require_once 'Customweb/Payment/Authorization/ITransactionRefund.php';
require_once 'Customweb/PayEngine3/Communication/Customer/Persona/Registrar.php';
require_once 'Customweb/Core/DateTime.php';
require_once 'Customweb/Payment/Authorization/ITransactionCapture.php';
require_once 'Customweb/PayEngine3/Communication/Order/StatusRequestBuilder.php';
require_once 'Customweb/PayEngine3/Communication/Transaction/StatusRequestBuilder.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/Util/Address.php';
require_once 'Customweb/PayEngine3/Communication/Customer/Address/Registrar.php';
require_once 'Customweb/Payment/Authorization/ITransactionCancel.php';
require_once 'Customweb/PayEngine3/Adapter.php';
require_once 'Customweb/PayEngine3/Communication/Customer/Registrar.php';


/**
 *
 * @author Sebastian Bossert
 * @Bean
 */
class Customweb_PayEngine3_Authorization_Handler extends Customweb_PayEngine3_Adapter {

	private function handleFailure(Customweb_PayEngine3_Authorization_Transaction $transaction, array $parameters, $defaultMessage){
		$customerMessage = $merchantMessage = (string) $defaultMessage;
		if (!empty($parameters['messageMerchant'])) {
			$merchantMessage = $parameters['messageMerchant'];
		}
		else if (!empty($parameters['merchantMessage'])) {
			$merchantMessage = $parameters['merchantMessage'];
		}
		if (!empty($parameters['messageCustomer'])) {
			$customerMessage = $parameters['messageCustomer'];
		}
		else if (!empty($parameters['customerMessage'])) {
			$customerMessage = $parameters['customerMessage'];
		}
		$transaction->setAuthorizationFailed(new Customweb_Payment_Authorization_ErrorMessage($customerMessage, $merchantMessage));
		$transaction->setUpdateExecutionDate(null);

		if (!empty($parameters['providerCode']) && $parameters['providerCode'] == 703) {
			$map = $transaction->getPaymentCustomerContext()->getMap();
			$map['ratepay_locked'] = Customweb_Core_DateTime::_()->format('r');
			$transaction->getPaymentCustomerContext()->updateMap($map);
		}
	}

	public function authorizeTransaction(Customweb_PayEngine3_Authorization_Transaction $transaction, $parameters = array()){
		try {
			$orderData = $this->getOrderData($transaction);

			$executedTransactions = array();
			if (isset($orderData['transactions'])) {
				$executedTransactions = $orderData['transactions'];
			}

			if (empty($executedTransactions)) {
				$this->handleFailure($transaction, $parameters,
						new Customweb_Payment_Authorization_ErrorMessage(
								Customweb_I18n_Translation::__("The transaction failed, no transactions executed.")));
				return;
			}
			$authParameters = array();
			if (isset($orderData['paymentProviderTransactionId'])) {
				$authParameters['paymentProviderTransactionId'] = $orderData['paymentProviderTransactionId'];
			}
			if (isset($orderData['merchantId'])) {
				$authParameters['merchantId'] = $orderData['merchantId'];
			}
			if (isset($orderData['meta']['descriptor'])) {
				$authParameters['meta_descriptor'] = $orderData['meta']['descriptor'];
				$transaction->setDescriptor($orderData['meta']['descriptor']);
			}

			if (isset($orderData['paymentInstrument'])) {
				if (isset($orderData['paymentInstrument']['paymentInstrumentId'])) {
					$authParameters['paymentInstrumentId'] = $orderData['paymentInstrument']['paymentInstrumentId'];
					$transaction->setPaymentInstrumentId($authParameters['paymentInstrumentId']);
				}
				if (isset($orderData['paymentInstrument']['attributes'])) {
					$authParameters['paymentInstrumentAttributes'] = $orderData['paymentInstrument']['attributes'];
					$transaction->setPaymentInstrumentAttributes($authParameters['paymentInstrumentAttributes']);
				}
				$this->getContainer()->getPaymentMethodByTransaction($transaction)->setAliasForDisplay($transaction, $orderData['paymentInstrument']);
			}

			$transaction->addAuthorizationParameters($authParameters);
			$transaction->setPaymentId($transaction->getExternalOrderId());
			foreach ($executedTransactions as $executed) {
				if (strtoupper($executed['type']) == 'DEBIT') {
					switch (strtoupper($executed['status'])) {
						case 'OK':
							$transaction->authorize();
							$capture = $transaction->capture();
							$capture->setExternalId($executed['transactionId']);
							$transaction->setAuthorizationUncertain();
							$transaction->setUpdateExecutionDate(Customweb_Core_DateTime::_()->addHours(6));
							break;
						case 'SUCCESS':
							$transaction->authorize();
							$capture = $transaction->capture();
							$capture->setExternalId($executed['transactionId']);
							$transaction->setUpdateExecutionDate(null);
							break;
						case 'FAILURE':
							$this->handleFailure($transaction, $parameters,
									new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("The transaction failed.")));
							break;
						case 'DECLINED':
							$this->handleFailure($transaction, $parameters,
									new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("The transaction was declined.")));
							break;
						case 'ABORTED':
							$this->handleFailure($transaction, $parameters,
									new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("The transaction was aborted.")));
							break;
						case 'EXPIRED':
							$this->handleFailure($transaction, $parameters,
									new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("The transaction expired.")));
							break;
						case 'PENDING':
						case 'IN PROGRESS':
						case 'CREATED':
						default:
							$transaction->setUpdateExecutionDate(Customweb_Core_DateTime::_()->addMinutes(15));
							break;
					}
				}
				if (strtoupper($executed['type']) == 'PREAUTH') {
					switch ($executed['status']) {
						case 'OK':
							$transaction->authorize();
							$transaction->setPreAuthorizationId($executed['transactionId']);
							$transaction->setUpdateExecutionDate(null);
							$paymentMethod = $this->getContainer()->getPaymentMethodByTransaction($transaction);
							if ($paymentMethod->isCaptureAfterPreauth()) {
								$paymentMethod->capture($transaction, $transaction->getUncapturedLineItems(), true);
							}
							break;
						case 'FAILURE':
							$this->handleFailure($transaction, $parameters,
									new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("The transaction failed.")));
							break;
						case 'DECLINED':
							$this->handleFailure($transaction, $parameters,
									new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("The transaction was declined.")));
							break;
						case 'ABORTED':
							$this->handleFailure($transaction, $parameters,
									new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("The transaction was aborted.")));
							break;
						case 'EXPIRED':
							$this->handleFailure($transaction, $parameters,
									new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("The transaction expired.")));
							break;
						case 'CREATED':
						case 'PENDING':
						case 'IN PROGRESS':
						default:
							$transaction->setUpdateExecutionDate(Customweb_Core_DateTime::_()->addMinutes(15));
							break;
					}
				}
			}
			$transaction->addAuthorizationParameters($authParameters);
		}
		catch (Exception $e) {
			$transaction->setAuthorizationFailed(
					new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("A technical error occured."),
							Customweb_I18n_Translation::__("A technical error occured.") . ' ' . $e->getMessage()));
			$transaction->setUpdateExecutionDate(null);
		}
	}

	public function updateTransaction(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$uncertain = false;
		if ($transaction->isAuthorizationUncertain()) {
			//Uncertain is only possible for debit transasction
			foreach ($transaction->getCaptures() as $capture) {
				/**
				 * @var Customweb_PayEngine3_Authorization_TransactionCapture $capture
				 */
				$data = $this->getTransactionData($transaction, $capture->getExternalId());
				switch ($data['status']) {
					case 'SUCCESS':
						$transaction->setAuthorizationUncertain(false);
						break;
					case 'EXPIRED':
					case 'ABORTED':
					case 'DECLINED':
					case 'FAILURE':
						$transaction->setUncertainTransactionFinallyDeclined();
						break;
					case 'OK':
						$uncertain = true;
						break;
					case 'CREATED':
					case 'PENDING':
					case 'IN PROGRESS':
					default:
						throw new Exception('Capture in unexpected state');
				}
			}
		}
		$capturePending = false;
		foreach ($transaction->getCaptures() as $capture) {
			/**
			 * @var Customweb_PayEngine3_Authorization_TransactionCapture $capture
			 */
			if ($capture->getStatus() == Customweb_Payment_Authorization_ITransactionCapture::STATUS_PENDING) {
				$data = $this->getTransactionData($transaction, $capture->getExternalId());
				switch ($data['status']) {
					case 'SUCCESS':
						$capture->setStatus(Customweb_Payment_Authorization_ITransactionCapture::STATUS_SUCCEED);
						break;
					case 'EXPIRED':
					case 'ABORTED':
					case 'DECLINED':
					case 'FAILURE':
						$capture->setStatus(Customweb_Payment_Authorization_ITransactionCapture::STATUS_FAILED);
						break;
					case 'OK':
					case 'CREATED':
					case 'PENDING':
					case 'IN PROGRESS':
						$capturePending = true;
						//Still pending
						break;
					default:
						throw new Exception('Capture in unexpected state');
				}
			}
		}
		$cancelPending = false;
		foreach ($transaction->getCancels() as $cancel) {
			/**
			 * @var Customweb_PayEngine3_Authorization_TransactionCancel $cancel
			 */
			if ($cancel->getStatus() == Customweb_Payment_Authorization_ITransactionCancel::STATUS_PENDING) {
				$data = $this->getTransactionData($transaction, $cancel->getExternalId());
				switch ($data['status']) {
					case 'SUCCESS':
						$cancel->setStatus(Customweb_Payment_Authorization_ITransactionCancel::STATUS_SUCCEED);
						break;
					case 'FAILURE':
						$cancel->setStatus(Customweb_Payment_Authorization_ITransactionCancel::STATUS_FAILED);
						break;
					case 'OK':
					case 'CREATED':
					case 'IN PROGRESS':
						$cancelPending = true;
						//Still pending
						break;
					default:
						throw new Exception('Cancel in unexpected state');
				}
			}
		}
		$refundPending = false;
		foreach ($transaction->getRefunds() as $refund) {
			/**
			 * @var Customweb_PayEngine3_Authorization_TransactionRefund $cancel
			 */
			if ($refund->getStatus() == Customweb_Payment_Authorization_ITransactionRefund::STATUS_PENDING) {
				$data = $this->getTransactionData($transaction, $refund->getExternalId());
				switch ($data['status']) {
					case 'SUCCESS':
						$refund->setStatus(Customweb_Payment_Authorization_ITransactionRefund::STATUS_SUCCEED);
						break;
					case 'FAILURE':
						$refund->setStatus(Customweb_Payment_Authorization_ITransactionRefund::STATUS_FAILED);
						break;
					case 'OK':
					case 'CREATED':
					case 'IN PROGRESS':
						$refundPending = true;
						//Still pending
						break;
					default:
						throw new Exception('Refund in unexpected state');
				}
			}
		}
		if ($uncertain || $capturePending || $cancelPending || $refundPending) {
			$transaction->setUpdateExecutionDate(Customweb_Core_DateTime::_()->addHours(6));
		}
	}

	/**
	 *
	 * @param Customweb_PayEngine3_Authorization_Transaction $transaction
	 * @param array $formData
	 * @throw Customweb_Payment_Exception_PaymentErrorException|Exception
	 */
	public function registerCustomer(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		if ($transaction->getExternalCustomerId() === null) {
			$customerRegistrar = new Customweb_PayEngine3_Communication_Customer_Registrar($this->getContainer(), $transaction, $formData);
			$customerId = $customerRegistrar->register();
			$transaction->setExternalCustomerId($customerId);
		}

		if ($transaction->getExternalPersonaId() === null) {
			$personaRegistrar = new Customweb_PayEngine3_Communication_Customer_Persona_Registrar($this->getContainer(), $transaction,
					$formData, $transaction->getExternalCustomerId());
			$personaId = $personaRegistrar->register();
			$transaction->setExternalPersonaId($personaId);
		}

		if ($transaction->getExternalBillingId() === null) {
			$billingRegistrar = new Customweb_PayEngine3_Communication_Customer_Address_Registrar($this->getContainer(), $transaction,
					$formData, $transaction->getExternalCustomerId(), false);
			$billingId = $billingRegistrar->register();
			$transaction->setExternalBillingId($billingId);
		}

		if ($transaction->getExternalShippingId() === null) {
			if (Customweb_Util_Address::compareAddresses($transaction->getTransactionContext()->getOrderContext()->getBillingAddress(),
					$transaction->getTransactionContext()->getOrderContext()->getShippingAddress())) {
				$transaction->setExternalShippingId($transaction->getExternalBillingId());
			}
			else {
				$shippingRegistrar = new Customweb_PayEngine3_Communication_Customer_Address_Registrar($this->getContainer(), $transaction,
						$formData, $transaction->getExternalCustomerId(), true);
				$shippingId = $shippingRegistrar->register();
				$transaction->setExternalShippingId($shippingId);
			}
		}
	}

	/**
	 *
	 * @param Customweb_PayEngine3_Authorization_Transaction $transaction
	 * @param array $formData
	 * @return string the url for redirection
	 * @throw Customweb_Payment_Exception_PaymentErrorException|Exception
	 */
	public function registerAndExecuteOrder(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		$this->registerCustomer($transaction, $formData);
		$requestBuilder = new Customweb_PayEngine3_Communication_Order_ProcessRequestBuilder($this->getContainer(), $transaction, $formData);
		$helper = new Customweb_PayEngine3_Communication_Simple($this->getContainer(), $requestBuilder);
		$order = $helper->execute();
		if ($order['status'] == 'CLOSED') {
			$parameters = $order;
			if (isset($order['transactions']) && !empty($order['transactions'])) {
				$parameters += $order['transactions'][0];
			}
			unset($parameters['transactions']);
			$this->handleFailure($transaction, $parameters,
					Customweb_I18n_Translation::__(Customweb_I18n_Translation::__("The order could not be created.")));
			return $transaction->getFailedUrl();
		}
		$transaction->setExternalOrderId($order['orderId']);
		return $order['redirectUrl'];
	}

	public function getOrderData(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$requestBuilder = new Customweb_PayEngine3_Communication_Order_StatusRequestBuilder($this->getContainer(), $transaction);
		$helper = new Customweb_PayEngine3_Communication_Simple($this->getContainer(), $requestBuilder);
		$order = $helper->execute();
		return $order;
	}

	public function getTransactionData(Customweb_PayEngine3_Authorization_Transaction $transaction, $externalTransactionId){
		$requestBuilder = new Customweb_PayEngine3_Communication_Transaction_StatusRequestBuilder($this->getContainer(), $transaction,
				$externalTransactionId);
		$helper = new Customweb_PayEngine3_Communication_Simple($this->getContainer(), $requestBuilder);
		$data = $helper->execute();
		return $data;
	}
}
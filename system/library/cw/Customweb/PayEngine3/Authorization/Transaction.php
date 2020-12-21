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

require_once 'Customweb/PayEngine3/Authorization/TransactionCancel.php';
require_once 'Customweb/Util/Url.php';
require_once 'Customweb/Payment/Authorization/ITransactionRefund.php';
require_once 'Customweb/Util/Invoice.php';
require_once 'Customweb/PayEngine3/Authorization/TransactionRefund.php';
require_once 'Customweb/Payment/Authorization/ITransactionCapture.php';
require_once 'Customweb/PayEngine3/Authorization/TransactionCapture.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/Payment/Authorization/Moto/ITransactionContext.php';
require_once 'Customweb/Payment/Authorization/DefaultTransaction.php';
require_once 'Customweb/PayEngine3/Util.php';
require_once 'Customweb/Payment/Authorization/Moto/IAdapter.php';


/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Authorization_Transaction extends Customweb_Payment_Authorization_DefaultTransaction {
	private $externalCustomerId;
	private $externalPersonaId;
	private $externalBillingId;
	private $externalShippingId;
	private $externalOrderId;
	private $preAuthorizationId;
	private $paymentInstrumentId;
	private $paymentInstrumentAttributes;
	private $productName;
	private $descriptor;
	private $formData = array();
	private $isRefundSupported = false;
	private $isCaptureSupported = false;
	private $isCancelSupported = false;

	public function getPaymentInstrumentAttributes(){
		return $this->paymentInstrumentAttributes;
	}

	public function setPaymentInstrumentAttributes($paymentInstrumentAttributes){
		$this->paymentInstrumentAttributes = $paymentInstrumentAttributes;
	}

	/**
	 * @return mixed
	 */
	public function getDescriptor(){
		return $this->descriptor;
	}

	/**
	 * @param mixed $descriptor
	 */
	public function setDescriptor($descriptor){
		$this->descriptor = $descriptor;
	}

	public function setBackendOperationSupport(Customweb_PayEngine3_Method_Default $paymentMethod){
		$this->isRefundSupported = $paymentMethod->isRefundSupported();
		$this->isCaptureSupported = $paymentMethod->isCaptureSupported();
		$this->isCancelSupported = $paymentMethod->isCancelSupported();
	}

	public function isRefundPossible(){
		return parent::isRefundPossible() && $this->isRefundSupported;
	}
	
	/**
	 * Only regard successful captures as captured.
	 * {@inheritDoc}
	 * @see Customweb_Payment_Authorization_DefaultTransaction::getCapturedAmount()
	 */
	public function getCapturedAmount(){
		$captured = 0;
		foreach($this->getCaptures() as $capture) {
			if($capture instanceof Customweb_PayEngine3_Authorization_TransactionCapture) {
				if($capture->getStatus() === Customweb_Payment_Authorization_ITransactionCapture::STATUS_SUCCEED) {
					$captured += Customweb_Util_Invoice::getTotalAmountIncludingTax($capture->getCaptureItems());
				}
			}
		}
		return $captured;
	}
	
	/**
	 * Only regard successful refunds as refunded.
	 * {@inheritDoc}
	 * @see Customweb_Payment_Authorization_DefaultTransaction::getRefundedTotalAmount()
	 */
	public function getRefundedTotalAmount(){
		$refunded = 0;
		foreach($this->getRefunds() as $refund) {
			if($refund instanceof Customweb_PayEngine3_Authorization_TransactionRefund) {
				if($refund->getStatus() === Customweb_Payment_Authorization_ITransactionRefund::STATUS_SUCCEED) {
					$refunded += Customweb_Util_Invoice::getTotalAmountIncludingTax($refund->getRefundItems());
				}
			}
		}
		return $refunded;
	}

	public function isCapturePossible(){
		return parent::isCapturePossible() && $this->isCaptureSupported;
	}

	public function isCancelPossible(){
		return parent::isCancelPossible() && $this->isCancelSupported;
	}

	protected function getTransactionSpecificLabels(){
		$labels = parent::getTransactionSpecificLabels();

		$labels[] = array(
			'label' => Customweb_I18n_Translation::__("Concardis PayEngine 3.0 Order ID"),
			'value' => $this->getExternalOrderId()
		);
		$labels[] = array(
			'label' => Customweb_I18n_Translation::__("Concardis PayEngine 3.0 Customer ID"),
			'value' => $this->getExternalCustomerId()
		);
		$labels[] = array(
			'label' => Customweb_I18n_Translation::__("Concardis PayEngine 3.0 Persona ID"),
			'value' => $this->getExternalPersonaId()
		);
		$labels[] = array(
			'label' => Customweb_I18n_Translation::__("Concardis PayEngine 3.0 Billing Address ID"),
			'value' => $this->getExternalBillingId()
		);
		$labels[] = array(
			'label' => Customweb_I18n_Translation::__("Concardis PayEngine 3.0 Shipping Address ID"),
			'value' => $this->getExternalShippingId()
		);
		$labels[] = array(
			'label' => Customweb_I18n_Translation::__("Concardis PayEngine 3.0 Payment Instrument ID"),
			'value' => $this->getPaymentInstrumentId()
		);

		$attributes = $this->getPaymentInstrumentAttributes();
		if ($attributes) {
			foreach ($attributes as $key => $value) {
				if (is_array($value)) {
					foreach ($value as $k => $v) {
						if(is_array($v)) {
							$v = json_encode($v); // enough is enough..
						}
						if ($v) {
							$labels[] = array(
								'label' => Customweb_I18n_Translation::__("Concardis PayEngine 3.0 Payment Instrument @attribute",
										array(
											'@attribute' => $key . '_' . $k
										)),
								'value' => $v
							);
						}
					}
				}
				else {
					$labels[] = array(
						'label' => Customweb_I18n_Translation::__("Concardis PayEngine 3.0 Payment Instrument @attribute",
								array(
									'@attribute' => $key
								)),
						'value' => (string) $value
					);
				}
			}
		}

		$authParameters = $this->getAuthorizationParameters();
		if (isset($authParameters['paymentProviderTransactionId'])) {
			$labels[] = array(
				'label' => Customweb_I18n_Translation::__("Payment Provider ID"),
				'value' => $authParameters['paymentProviderTransactionId']
			);
		}
		if ($this->getDescriptor()) {
			$labels[] = array(
				'label' => Customweb_I18n_Translation::__("Descriptor"),
				'value' => $this->getDescriptor()
			);
		}

		return $labels;
	}

	/**
	 * @return mixed
	 */
	public function getProductName(){
		return $this->productName;
	}

	/**
	 * @param mixed $productName
	 */
	public function setProductName($productName){
		$this->productName = $productName;
	}

	/**
	 * @return mixed
	 */
	public function getPaymentInstrumentId(){
		return $this->paymentInstrumentId;
	}

	/**
	 * @param mixed $paymentInstrumentId
	 */
	public function setPaymentInstrumentId($paymentInstrumentId){
		$this->paymentInstrumentId = $paymentInstrumentId;
	}

	public function getExternalCustomerId(){
		return $this->externalCustomerId;
	}

	public function setExternalCustomerId($customerId){
		$this->externalCustomerId = $customerId;
		return $this;
	}

	public function getExternalPersonaId(){
		return $this->externalPersonaId;
	}

	public function setExternalPersonaId($personaId){
		$this->externalPersonaId = $personaId;
		return $this;
	}

	public function getExternalBillingId(){
		return $this->externalBillingId;
	}

	public function setExternalBillingId($billingId){
		$this->externalBillingId = $billingId;
		return $this;
	}

	public function getExternalShippingId(){
		return $this->externalShippingId;
	}

	public function setExternalShippingId($shippingId){
		$this->externalShippingId = $shippingId;
		return $this;
	}

	public function getExternalOrderId(){
		return $this->externalOrderId;
	}

	public function setExternalOrderId($orderId){
		$this->externalOrderId = $orderId;
		return $this;
	}

	public function setPreAuthorizationId($preAuthorizationId){
		$this->preAuthorizationId = $preAuthorizationId;
	}

	public function getPreAuthorizationId(){
		return $this->preAuthorizationId;
	}

	public function setFormData(array $formData){
		$this->formData = Customweb_PayEngine3_Util::filterFormFields($formData);
		$this->getPaymentCustomerContext()->updateMap(Customweb_PayEngine3_Util::filterPaymentMap($this->formData));
	}

	public function getFormData(){
		return $this->formData;
	}

	public function getFormDataByIndex($index){
		if (isset($this->formData[$index])) {
			return $this->formData[$index];
		}
		return null;
	}

	protected function buildNewCaptureObject($captureId, $amount, $status = NULL){
		return new Customweb_PayEngine3_Authorization_TransactionCapture($captureId, $amount, $status);
	}

	protected function buildNewCancelObject($cancelId, $status = NULL){
		return new Customweb_PayEngine3_Authorization_TransactionCancel($cancelId, $status);
	}

	protected function buildNewRefundObject($refundId, $amount, $status = NULL){
		return new Customweb_PayEngine3_Authorization_TransactionRefund($refundId, $amount, $status);
	}

	public function addAuthorizationParameters(array $parameters){
		$existing = $this->getAuthorizationParameters();
		if (!is_array($existing)) {
			$existing = array();
		}
		foreach ($parameters as $key => $value) {
			$existing[$key] = $value;
		}
		$this->setAuthorizationParameters($existing);
	}

	public function getSuccessUrl(){
		$baseUrl = $this->getTransactionContext()->getSuccessUrl();
		if ($this->isMoto()) {
			$context = $this->getTransactionContext();
			if ($context instanceof Customweb_Payment_Authorization_Moto_ITransactionContext) {
				$baseUrl = $context->getBackendSuccessUrl();
			}
		}
		return Customweb_Util_Url::appendParameters($baseUrl, $this->getTransactionContext()->getCustomParameters());
	}

	public function getFailedUrl(){
		$baseUrl = $this->getTransactionContext()->getFailedUrl();
		if ($this->isMoto()) {
			$context = $this->getTransactionContext();
			if ($context instanceof Customweb_Payment_Authorization_Moto_ITransactionContext) {
				$baseUrl = $context->getBackendFailedUrl();
			}
		}
		return Customweb_Util_Url::appendParameters($baseUrl, $this->getTransactionContext()->getCustomParameters());
	}

	private function isMoto(){
		return $this->getAuthorizationMethod() === Customweb_Payment_Authorization_Moto_IAdapter::AUTHORIZATION_METHOD_NAME;
	}
}
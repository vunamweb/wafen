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

require_once 'Customweb/Core/DateTime.php';
require_once 'Customweb/Util/Currency.php';
require_once 'Customweb/PayEngine3/Communication/AbstractTransactionRequestBuilder.php';
require_once 'Customweb/PayEngine3/Communication/BasketBuilder.php';
require_once 'Customweb/Payment/Authorization/Moto/IAdapter.php';
require_once 'Customweb/Util/Invoice.php';


/**
 *
 * @author Sebastian Bossert
 */
abstract class Customweb_PayEngine3_Communication_Order_AbstractRequestBuilder extends Customweb_PayEngine3_Communication_AbstractTransactionRequestBuilder {
	protected $formData;

	public function __construct(Customweb_DependencyInjection_IContainer $container, Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		parent::__construct($container, $transaction);
		$this->formData = $formData;
	}

	protected function getMethod(){
		return 'POST';
	}

	protected function getBasePayload(){
		$time = Customweb_Core_DateTime::_()->format('U') * 1000;
		$ip = null;
		try {
			$ip = $this->getContainer()->getHttpRequest()->getRemoteAddress();
		}
		catch (Exception $e) {
		}
		//@formatter:off
		$parameters =  array_merge(
				$this->getMandatoryParameter('merchantOrderId', $this->getPaymentMethod()->getOrderId($this->getTransaction())),
				$this->getOptionalParameter('description', $this->getPaymentMethod()->getOrderId($this->getTransaction())),
				$this->getMandatoryParameter('initialAmount', $this->getAmount()),
				$this->getMandatoryParameter('currency', $this->getTransaction()->getCurrencyCode()),
				$this->getMandatoryParameter('customer', $this->getTransaction()->getExternalCustomerId()),
				$this->getOptionalParameter('persona', $this->getTransaction()->getExternalPersonaId()),
				$this->getOptionalParameter('billingAddress', $this->getTransaction()->getExternalBillingId()),
				$this->getOptionalParameter('shippingAddress', $this->getTransaction()->getExternalShippingId()),
				$this->getOptionalParameter('ipAddress', $ip),
				$this->getMandatoryParameter('channel', $this->getChannel()),
				$this->getDeviceIdentificationParameter(),
				$this->getBasketParameter(),
				$this->getSourceParameter(),
				$this->getUrlParameters()
		);
		//@formatter:on
		$parameters = array_replace_recursive($parameters,
				$this->getPaymentMethod()->getAdditionalOrderPayload($this->getTransaction(), $this->formData));
		return $parameters;
	}

	private function getDeviceIdentificationParameter(){
		$formData = $this->getTransaction()->getFormData();
		if (isset($formData['payengine3-tracking'])) {
			return array(
				'deviceIdent' => array(
					'deviceIdentToken' => $formData['payengine3-tracking'] 
				) 
			);
		}
		return array();
	}

	private function getSourceParameter(){
		return array(
			'source' => 'OpenCart-1.0.161' 
		);
	}

	private function getBasketParameter(){
		if (!$this->getPaymentMethod()->useBasket()) {
			return array();
		}
		$builder = new Customweb_PayEngine3_Communication_BasketBuilder($this->getItems(), $this->getTransaction()->getCurrencyCode(),
				$this->getOrderContext()->getInvoiceItems());
		return $builder->build();
	}

	private function getUrlParameters(){
		return array(
			'async' => array_merge($this->getMandatoryParameter('successUrl', $this->getReturnUrl()),
					$this->getMandatoryParameter('failureUrl', $this->getReturnUrl()), $this->getMandatoryParameter('cancelUrl', $this->getReturnUrl())) 
		);
	}

	private function getReturnUrl(){
		return $this->getContainer()->createSecuredEndpointUrl('process', 'return', $this->getTransaction());
	}

	private function getAmount(){
		return intval(
				Customweb_Util_Currency::formatAmount(Customweb_Util_Invoice::getTotalAmountIncludingTax($this->getItems()),
						$this->getTransaction()->getCurrencyCode(), '', ''));
	}

	private function getItems(){
		return $this->getTransaction()->getTransactionContext()->getOrderContext()->getInvoiceItems();
	}

	private function getChannel(){
		if ($this->getTransaction()->getAuthorizationMethod() === Customweb_Payment_Authorization_Moto_IAdapter::AUTHORIZATION_METHOD_NAME) {
			return 'MOTO';
		}
		return 'ECOM';
	}
}
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

require_once 'Customweb/PayEngine3/Communication/AbstractTransactionRequestBuilder.php';



/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Communication_Customer_RequestBuilder extends Customweb_PayEngine3_Communication_AbstractTransactionRequestBuilder {
	
	private $formData;
	
	public function __construct(Customweb_DependencyInjection_IContainer $container, Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		parent::__construct($container, $transaction);
		$this->formData = $formData;
	}

	protected function getUrlPath(){
		return '/customers';
	}

	protected function getMethod(){
		return 'POST';
	}

	protected function getPayload(){
		// @formatter:off
		$parameters =  array_merge(
				$this->getMandatoryParameter('email', $this->getEmail())
// 				$this->getOptionalParameter('merchantCustomerId', $this->getCustomerId())
		);
		// @formatter:on
		$parameters = array_replace_recursive($parameters, $this->getPaymentMethod()->getAdditionalCustomerPayload($this->getTransaction(), $this->formData));
		return $parameters;
	}
	
	private function getEmail(){
		$email = $this->getOrderContext()->getCustomerEMailAddress();
		if (empty($email)) {
			$email = $this->getOrderContext()->getBillingAddress()->getEMailAddress();
			if (empty($email)) {
				$email = $this->getOrderContext()->getShippingAddress()->getEMailAddress();
			}
		}
		return $email;
	}
	
	private function getCustomerId() {
		$customerId = $this->getOrderContext()->getCustomerId();
		if(empty($customerId)) {
			$customerId = hash('SHA256', $this->getEmail());
		}else {
			$customerId = 'c_' . $customerId;
		}
		return $customerId;
	}
}
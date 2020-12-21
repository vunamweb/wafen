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

require_once 'Customweb/Util/Address.php';
require_once 'Customweb/Util/String.php';
require_once 'Customweb/PayEngine3/Communication/AbstractTransactionRequestBuilder.php';
require_once 'Customweb/PayEngine3/Util.php';


/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Communication_Customer_Address_RequestBuilder extends Customweb_PayEngine3_Communication_AbstractTransactionRequestBuilder {
	private $customerId;
	private $shipping;
	private $formData;

	public function __construct(Customweb_DependencyInjection_IContainer $container, Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData, $customerId, $isShipping){
		parent::__construct($container, $transaction);
		$this->formData = $formData;
		$this->customerId = $customerId;
		$this->shipping = $isShipping;
	}

	protected function getMethod(){
		return 'POST';
	}

	protected function getPayload(){
		// @formatter:off
		$splitted = Customweb_Util_Address::splitStreet($this->getAddress()->getStreet(), $this->getAddress()->getCountryIsoCode(), $this->getAddress()->getCountryIsoCode());
		$number = preg_replace('/[^\da-zA-Z+\-]/', '',$splitted['street-number']);
		if(empty($number)){
			$number = '-';
		}
		
		$parameters =  array_merge(
				$this->getMandatoryParameter('firstName', Customweb_PayEngine3_Util::cleanStringAlphaExtended($this->getAddress()->getFirstName(), 35)),
				$this->getMandatoryParameter('lastName', Customweb_PayEngine3_Util::cleanStringAlphaExtended($this->getAddress()->getLastName(), 35)), 
				$this->getOptionalParameter('mobile', Customweb_PayEngine3_Util::cleanPhoneNumber($this->getAddress()->getMobilePhoneNumber())),
				$this->getOptionalParameter('phone', Customweb_PayEngine3_Util::cleanPhoneNumber($this->getAddress()->getPhoneNumber())),
				$this->getMandatoryParameter('city', Customweb_PayEngine3_Util::cleanStringAlphaExtended($this->getAddress()->getCity(), 35)),
				$this->getMandatoryParameter('zip', Customweb_PayEngine3_Util::cleanStringAlphaNumericExtended($this->getAddress()->getPostCode(),10)),
				$this->getMandatoryParameter('street', Customweb_PayEngine3_Util::cleanStringAlphaExtended($splitted['street'], 35)),
				$this->getMandatoryParameter('houseNumber', Customweb_PayEngine3_Util::cleanStringAlphaNumericExtended($number, 35)),
				$this->getMandatoryParameter('country', $this->getAddress()->getCountryIsoCode()),
				$this->getOptionalParameter('title', Customweb_PayEngine3_Util::cleanStringAlphaExtended($this->getAddress()->getSalutation(), 35))
		);
		
		$state = $this->getAddress()->getState();
		if($state) {
			$state = $this->getAddress()->getCountryIsoCode() . '-' . $state; // Make ISO-3166-2
			$parameters['state'] = Customweb_Util_String::substrUtf8($state, 0, 35);
		}
		
		// @formatter:on
		if ($this->shipping) {
			$parameters = array_replace_recursive($parameters, $this->getPaymentMethod()->getAdditionalShippingPayload($this->getTransaction(), $this->formData));
		}
		else {
			$parameters = array_replace_recursive($parameters, $this->getPaymentMethod()->getAdditionalBillingPayload($this->getTransaction(), $this->formData));
		}
		return $parameters;
	}

	protected function getUrlPath(){
		return '/customers/' . $this->customerId . '/addresses';
	}

	private function getAddress(){
		if ($this->shipping) {
			return $this->getTransaction()->getTransactionContext()->getOrderContext()->getShippingAddress();
		}
		else {
			return $this->getTransaction()->getTransactionContext()->getOrderContext()->getBillingAddress();
		}
	}
	

}
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
require_once 'Customweb/PayEngine3/Util.php';



/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Communication_Customer_Persona_RequestBuilder extends Customweb_PayEngine3_Communication_AbstractTransactionRequestBuilder {
	
	private $customerId;
	private $formData;

	public function __construct(Customweb_DependencyInjection_IContainer $container, Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData, $customerId){
		parent::__construct($container, $transaction);
		$this->formData = $formData;
		$this->customerId = $customerId;
	}

	protected function getMethod(){
		return 'POST';
	}

	protected function getPayload(){
		// @formatter:off
		$parameters = array_merge(
				$this->getMandatoryParameter('firstName', Customweb_PayEngine3_Util::cleanStringAlphaExtended($this->getAddress()->getFirstName(), 35)),
				$this->getMandatoryParameter('lastName', Customweb_PayEngine3_Util::cleanStringAlphaExtended($this->getAddress()->getLastName(), 35)), 
				$this->getOptionalParameter('mobile', Customweb_PayEngine3_Util::cleanPhoneNumber($this->getAddress()->getMobilePhoneNumber())),
				$this->getOptionalParameter('phone', Customweb_PayEngine3_Util::cleanPhoneNumber($this->getAddress()->getPhoneNumber())),
				$this->getOptionalParameter('title', Customweb_PayEngine3_Util::cleanStringAlphaExtended($this->getAddress()->getSalutation(), 35))
		);
		// @formatter:on
		$parameters = array_replace_recursive($parameters, $this->getPaymentMethod()->getAdditionalPersonaPayload($this->getTransaction(),$this->formData));
		return $parameters;

	}

	private function getBirthdayParameter(){
		$birthday = $this->getAddress()->getDateOfBirth();
		if ($birthday instanceof DateTime) {
			$birthday->setTime(0,0,0); // ensure equal timestamp
			$birthday->setTimezone(new DateTimeZone('UTC'));
			return array(
				'birthday' => $birthday->format('U')*1000
			); 
		}
		return array();
	}

	private function getGenderParameter(){
		$gender = $this->getAddress()->getGender();
		if ($gender == 'male') {
			return array(
				'gender' => 'MALE' 
			);
		}
		else if ($gender == 'female') {
			return array(
				'gender' => 'FEMALE' 
			);
		}
		return array();
	}

	protected function getUrlPath(){
		return '/customers/' . $this->customerId . '/personas';
	}

	private function getAddress(){
		return $this->getTransaction()->getTransactionContext()->getOrderContext()->getBillingAddress();
	}
}
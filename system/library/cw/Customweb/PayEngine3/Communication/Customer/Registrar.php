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

require_once 'Customweb/Payment/Authorization/ErrorMessage.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/Payment/Exception/PaymentErrorException.php';
require_once 'Customweb/PayEngine3/Communication/AbstractRegistrar.php';
require_once 'Customweb/PayEngine3/Communication/Customer/RequestBuilder.php';


/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Communication_Customer_Registrar extends Customweb_PayEngine3_Communication_AbstractRegistrar {

	protected function getRequestBuilder(){
		return new Customweb_PayEngine3_Communication_Customer_RequestBuilder($this->getContainer(), $this->getTransaction(),
				$this->getFormData());
	}

	protected function extractId(array $json){
		if ($this->getContainer()->getPaymentMethodByTransaction($this->getTransaction())->isB2BSupported()) {
			$this->verifyCustomerType($json);
		}
		return $json['customerId'];
	}

	protected function verifyCustomerType(array $json){
		$expectedType = null;
		if ($this->getContainer()->getB2BAdapter()->isB2B($this->getTransaction()->getTransactionContext()->getOrderContext())) {
			$expectedType = 'organization';
		}
		if ($json['customerType'] !== $expectedType) {
			throw new Customweb_Payment_Exception_PaymentErrorException(
					new Customweb_Payment_Authorization_ErrorMessage(
							Customweb_I18n_Translation::__(
									'Your email address was already used with a different address type (private / business). Please use a different email.')));
		}
	}
}
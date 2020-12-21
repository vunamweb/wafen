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

require_once 'Customweb/PayEngine3/Communication/Order/AbstractRequestBuilder.php';


/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Communication_Order_ProcessRequestBuilder extends Customweb_PayEngine3_Communication_Order_AbstractRequestBuilder {

	protected function getPayload(){
		return array_merge(
				$this->getBasePayload(), 
				$this->getProductParameter(), 
				$this->getPaymentParameters()
		);
	}
	/**
	 * Do not use getMandatoryParameter due to empty array being invalid, but a valid parameter.
	 *
	 * @return array
	 */
	private function getProductParameter(){
		return array(
			'product' => $this->getTransaction()->getProductName() 
		);
	}

	protected function getUrlPath(){
		if ($this->getPaymentMethod()->isDeferredCapturingActive()) {
			return '/orders/preauth';
		}
		return '/orders/debit';
	}

	private function getPaymentParameters(){
		$paymentInstrumentId = $this->getTransaction()->getPaymentInstrumentId();
		if (isset($this->formData['paymentInstrumentId'])) {
			$paymentInstrumentId = $this->formData['paymentInstrumentId'];
		}
		if ($paymentInstrumentId !== null) {
			return array(
				'payment' => array(
					'paymentInstrumentId' => $paymentInstrumentId 
				) 
			);
		}
		return array();
	}
}
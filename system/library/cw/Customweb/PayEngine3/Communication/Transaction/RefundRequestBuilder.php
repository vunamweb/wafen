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

require_once 'Customweb/PayEngine3/Communication/Transaction/AbstractBackendRequestBuilder.php';


/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Communication_Transaction_RefundRequestBuilder extends Customweb_PayEngine3_Communication_Transaction_AbstractBackendRequestBuilder {
	private $captureItem;

	public function __construct(Customweb_DependencyInjection_IContainer $container, Customweb_PayEngine3_Authorization_Transaction $transaction, Customweb_PayEngine3_Authorization_TransactionCapture $captureItem, array $items){
		parent::__construct($container, $transaction, $items);
		$this->captureItem = $captureItem;
	}

	private function getCaptureItem(){
		return $this->captureItem;
	}

	protected function getUrlPath(){
		return '/orders/' . $this->getTransaction()->getExternalOrderId() . '/transactions/' . $this->getCaptureItem()->getExternalId() . '/refund';
	}

	protected function getDescription(){
		$refundCount = count($this->getTransaction()->getRefunds()) + 1;
		return $this->getPaymentMethod()->getOrderId($this->getTransaction()) . '_capture_' . $this->getCaptureItem()->getCaptureId() . '_refund_' .
				$refundCount;
	}
}
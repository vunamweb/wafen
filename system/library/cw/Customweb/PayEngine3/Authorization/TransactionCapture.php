<?php
/**
  * You are allowed to use this API in your web application.
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

require_once 'Customweb/Payment/Authorization/DefaultTransactionCapture.php';
require_once 'Customweb/Util/Invoice.php';



class Customweb_PayEngine3_Authorization_TransactionCapture extends Customweb_Payment_Authorization_DefaultTransactionCapture {

	private $refundedAmount = 0;
	private $externalId;
	private $refunds = array();
	
	public function setExternalId($externalId){
		$this->externalId = $externalId;
	}
	
	public function getExternalId(){
		return $this->externalId;
	}
	
	/**
	 * This method returns a list of refund ids linked with this capture.
	 *
	 * @return multitype:string
	 */
	public function getRefundIds() {
		return array_keys($this->refunds);
	}
	
	/**
	 * Adds a refund to this capture.
	 *
	 * @param Customweb_PayEngine3_Authorization_TransactionRefund $refund
	 * @return Customweb_PayEngine3_Authorization_TransactionCapture
	 */
	public function addRefund(Customweb_PayEngine3_Authorization_TransactionRefund $refund) {
		$this->refunds[$refund->getRefundId()] = $refund;
		return $this;
	}
	
	/**
	 * Returns a list of refund objects linked with this capture.
	 *
	 * @return Customweb_PayEngine3_Authorization_TransactionRefund[]
	 */
	public function getRefunds() {
		return $this->refunds;
	}
	
	/**
	 * Returns a list of line items of this capture, which can be refund. A line
	 * item can be refunded, when it is not already refunded. The amounts are
	 * reduced based on previous refunds. If a item is completly refunded, this
	 * method will not return it anymore.
	 *
	 * @return Customweb_Payment_Authorization_IInvoiceItem[]
	 */
	public function getRefundableItems() {
		$items = $this->getCaptureItems();
		foreach ($this->getRefunds() as $refund) {
			$items = Customweb_Util_Invoice::substractLineItems($items, $refund->getRefundItems());
		}
		
		return $items;
	}
	
}
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

interface PayEngine3Cw_Adapter_IAdapter {

	/**
	 * @return string
	 */
	public function getPaymentAdapterInterfaceName();
	
	/**
	 * @param Customweb_Payment_Authorization_IAdapter $interface
	 */
	public function setInterfaceAdapter(Customweb_Payment_Authorization_IAdapter $interface);

	/**
	 * @return Customweb_Payment_Authorization_IAdapter
	 */
	public function getInterfaceAdapter();

	/**
	 *
	 * @param PayEngine3Cw_Entity_Transaction $transaction
	 * @param Registry $registry
	 * @param PayEngine3Cw_Entity_Transaction $failedTransaction
	 * @return string Html for the checkout page
	 */
	public function getCheckoutPageHtml(PayEngine3Cw_PaymentMethod $paymentMethod, Customweb_Payment_Authorization_IOrderContext $orderContext, $registry, $failedTransaction);

}
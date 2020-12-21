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

require_once 'Customweb/Util/Currency.php';
require_once 'Customweb/PayEngine3/Communication/AbstractTransactionRequestBuilder.php';
require_once 'Customweb/PayEngine3/Communication/BasketBuilder.php';
require_once 'Customweb/Util/Invoice.php';


/**
 *
 * @author Sebastian Bossert
 */
abstract class Customweb_PayEngine3_Communication_Transaction_AbstractBackendRequestBuilder extends Customweb_PayEngine3_Communication_AbstractTransactionRequestBuilder {
	private $items;

	public function __construct(Customweb_DependencyInjection_IContainer $container, Customweb_PayEngine3_Authorization_Transaction $transaction, array $items){
		parent::__construct($container, $transaction);
		$this->items = $items;
	}

	abstract protected function getDescription();

	protected function getMethod(){
		return 'POST';
	}

	protected function getPayload(){
		//@formatter:off
		return array_merge(
				$this->getMandatoryParameter('initialAmount', $this->getAmount()),
				$this->getMandatoryParameter('currency', $this->getTransaction()->getCurrencyCode()),
				$this->getMandatoryParameter('description', $this->getDescription()),
				$this->getBasketParameter()
			);
		//@formatter:on
	}

	protected function getItems(){
		return $this->items;
	}

	protected function getBasketParameter(){
		if (!$this->getPaymentMethod()->useBasket()) {
			return array();
		}
		$builder = new Customweb_PayEngine3_Communication_BasketBuilder($this->getItems(), $this->getTransaction()->getCurrencyCode(),
				$this->getOrderContext()->getInvoiceItems());
		return $builder->build();
	}

	protected function getAmount(){
		return intval(
				Customweb_Util_Currency::formatAmount(Customweb_Util_Invoice::getTotalAmountIncludingTax($this->getItems()),
						$this->getTransaction()->getCurrencyCode(), '', ''));
	}
}
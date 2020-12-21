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
require_once 'Customweb/Payment/Authorization/DefaultInvoiceItem.php';
require_once 'Customweb/Payment/Authorization/IInvoiceItem.php';
require_once 'Customweb/PayEngine3/Util.php';
require_once 'Customweb/Core/Logger/Factory.php';
require_once 'Customweb/Util/Invoice.php';


/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Communication_BasketBuilder {
	private $items;
	private $currency;
	private $quantityModifiers;
	private $logger;

	public function __construct(array $items, $currency, array $allTransactionItems){
		$this->setItems($items, $allTransactionItems);
		$this->currency = $currency;
		$this->logger = Customweb_Core_Logger_Factory::getLogger(get_class());
		$this->logger->logDebug("Original Items", $items);
		$this->logger->logDebug("Cleaned Items", $this->items);
		$this->logger->logDebug("Quantity Modifiers", $this->quantityModifiers);
		$this->logger->logDebug("Currency", $currency);
	}

	public function build(){
		$basket = array();
		foreach ($this->getItems() as $item) {
			$priceInc = $item->getAmountIncludingTax();
			$priceExc = $item->getAmountExcludingTax();
			if ($item->getType() == Customweb_Payment_Authorization_IInvoiceItem::TYPE_DISCOUNT) {
				$priceInc *= -1;
				$priceExc *= -1;
			}
			$priceIncFormatted = $this->format($priceInc);
			$priceExcFormatted = $this->format($priceExc);
			
			$quantity = round($item->getQuantity() * $this->quantityModifiers[$item->getSku()]);
			
			if ($quantity) {
				$articleNumber = $basket[] = array(
					'name' => Customweb_PayEngine3_Util::cleanStringAlphaNumericExtended($item->getName(), 128),
					'articleNumber' => $item->getSku(),
					'totalPrice' => $priceExcFormatted,
					'totalPriceWithTax' => $priceIncFormatted,
					'unitPrice' => $this->format($priceExcFormatted / $quantity / 100),
					'unitPriceWithTax' => $this->format($priceIncFormatted / $quantity / 100),
					'quantity' => $quantity,
					'tax' => round($item->getTaxRate()) 
				);
			}
		}
		$this->logger->logDebug("Built basket", $basket);
		return array(
			'basket' => $basket 
		);
	}

	/**
	 * First cleans the SKUs according to PayEngine rules, then ensures uniqueness again.
	 * Guarantees identical SKU generation by generating the clean sku based on all transaction items, not only the relevant ones.
	 * Also sets quantity modifiers, as these require all cleaned items.
	 * 
	 * @param array $items
	 * @param array $allTransactionItems
	 */
	private function setItems(array $items, array $allTransactionItems){
		$allCleaned = Customweb_Util_Invoice::ensureUniqueSku($this->cleanItemSkus($allTransactionItems));
		$this->items = $this->getCleanMapping($items, $allCleaned);
		$this->quantityModifiers = Customweb_PayEngine3_Util::getItemQuantityModifiers($this->items, $allCleaned);
	}

	private function cleanItemSkus(array $items){
		$cleaned = array();
		foreach ($items as $item) {
			// purposefully cut sku short of maximum by a couple of digits, to allow increased change of result being valid.
			/* @var $item Customweb_Payment_Authorization_IInvoiceItem */
			$cleaned[] = new Customweb_Payment_Authorization_DefaultInvoiceItem(
					Customweb_PayEngine3_Util::cleanStringAlphaNumericExtended($item->getSku(), 240), $item->getName(), $item->getTaxRate(),
					$item->getAmountIncludingTax(), $item->getQuantity(), $item->getType(), $item->getSku(), $item->isShippingRequired());
		}
		return $cleaned;
	}

	private function getCleanMapping(array $items, array $allItems){
		$cleaned = array();
		foreach ($items as $item) {
			/* @var $item Customweb_Payment_Authorization_IInvoiceItem */
			foreach ($allItems as $cleanItem) {
				if ($item->getSku() === $cleanItem->getOriginalSku()) {
					$cleaned[] = new Customweb_Payment_Authorization_DefaultInvoiceItem(str_replace("_", "-", $cleanItem->getSku()),
							$item->getName(), $item->getTaxRate(), $item->getAmountIncludingTax(), $item->getQuantity(), $item->getType(),
							$item->getSku(), $item->isShippingRequired());
				}
			}
		}
		return $cleaned;
	}

	private function useQuantity(){
		return true;
	}

	/**
	 * 
	 * @param string|integer|double $amount
	 * @return number
	 */
	private function format($amount){
		return intval(Customweb_Util_Currency::formatAmount($amount, $this->currency, '', ''));
	}

	/**
	 * 
	 * @return Customweb_Payment_Authorization_IInvoiceItem[]
	 */
	private function getItems(){
		return $this->items;
	}
}
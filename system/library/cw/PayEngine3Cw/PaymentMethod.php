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


require_once 'Customweb/Payment/Authorization/IPaymentMethod.php';

require_once 'PayEngine3Cw/Util.php';
require_once 'PayEngine3Cw/Entity/Transaction.php';
require_once 'PayEngine3Cw/PaymentMethod.php';
require_once 'PayEngine3Cw/TransactionContext.php';
require_once 'PayEngine3Cw/PaymentMethodWrapper.php';
require_once 'PayEngine3Cw/Store.php';
require_once 'PayEngine3Cw/Language.php';
require_once 'PayEngine3Cw/DefaultPaymentMethodDefinition.php';
require_once 'PayEngine3Cw/SettingApi.php';
require_once 'PayEngine3Cw/OrderContext.php';


final class PayEngine3Cw_PaymentMethod implements Customweb_Payment_Authorization_IPaymentMethod{

	/**
	 * @var PayEngine3Cw_IPaymentMethodDefinition
	 */
	private $paymentMethodDefinitions;

	/**
	 * @var PayEngine3Cw_SettingApi
	 */
	private $settingsApi;

	private static $completePaymentMethodDefinitions = array(
		'creditcard' => array(
			'machineName' => 'CreditCard',
 			'frontendName' => 'Credit / Debit Card',
 			'backendName' => 'Concardis PayEngine 3.0: Credit / Debit Card',
 		),
 		'paypal' => array(
			'machineName' => 'PayPal',
 			'frontendName' => 'PayPal',
 			'backendName' => 'Concardis PayEngine 3.0: PayPal',
 		),
 		'paydirekt' => array(
			'machineName' => 'Paydirekt',
 			'frontendName' => 'paydirekt',
 			'backendName' => 'Concardis PayEngine 3.0: paydirekt',
 		),
 		'sofortueberweisung' => array(
			'machineName' => 'Sofortueberweisung',
 			'frontendName' => 'SOFORT',
 			'backendName' => 'Concardis PayEngine 3.0: SOFORT',
 		),
 		'ratepaydirectdebits' => array(
			'machineName' => 'RatePayDirectDebits',
 			'frontendName' => 'RatePay Direct Debits',
 			'backendName' => 'Concardis PayEngine 3.0: RatePay Direct Debits',
 		),
 		'ratepayopeninvoice' => array(
			'machineName' => 'RatePayOpenInvoice',
 			'frontendName' => 'RatePay Open Invoice',
 			'backendName' => 'Concardis PayEngine 3.0: RatePay Open Invoice',
 		),
 		'ratepayinstallments' => array(
			'machineName' => 'RatePayInstallments',
 			'frontendName' => 'RatePay Installments',
 			'backendName' => 'Concardis PayEngine 3.0: RatePay Installments',
 		),
 		'ideal' => array(
			'machineName' => 'IDeal',
 			'frontendName' => 'iDEAL',
 			'backendName' => 'Concardis PayEngine 3.0: iDEAL',
 		),
 		'alipay' => array(
			'machineName' => 'Alipay',
 			'frontendName' => 'Alipay',
 			'backendName' => 'Concardis PayEngine 3.0: Alipay',
 		),
 		'bcmc' => array(
			'machineName' => 'Bcmc',
 			'frontendName' => 'Bancontact',
 			'backendName' => 'Concardis PayEngine 3.0: Bancontact',
 		),
 		'wechatpay' => array(
			'machineName' => 'WeChatPay',
 			'frontendName' => 'WeChat Pay',
 			'backendName' => 'Concardis PayEngine 3.0: WeChat Pay',
 		),
 		'giropay' => array(
			'machineName' => 'Giropay',
 			'frontendName' => 'giropay',
 			'backendName' => 'Concardis PayEngine 3.0: giropay',
 		),
 		'eps' => array(
			'machineName' => 'Eps',
 			'frontendName' => 'EPS',
 			'backendName' => 'Concardis PayEngine 3.0: EPS',
 		),
 		'postfinancecard' => array(
			'machineName' => 'PostFinanceCard',
 			'frontendName' => 'PostFinance Card',
 			'backendName' => 'Concardis PayEngine 3.0: PostFinance Card',
 		),
 	);

	public function __construct(PayEngine3Cw_IPaymentMethodDefinition $defintions) {
		$this->paymentMethodDefinitions = $defintions;
		$this->settingsApi = new PayEngine3Cw_SettingApi('payengine3cw_' . $this->paymentMethodDefinitions->getMachineName());
	}

	public static function getPaymentMethod($paymentMethodMachineName) {
		$paymentMethodMachineName = strtolower($paymentMethodMachineName);

		if (isset(self::$completePaymentMethodDefinitions[$paymentMethodMachineName])) {
			$def = self::$completePaymentMethodDefinitions[$paymentMethodMachineName];
			return new PayEngine3Cw_PaymentMethod(new PayEngine3Cw_DefaultPaymentMethodDefinition($def['machineName'], $def['backendName'], $def['frontendName']));
		}
		else {
			throw new Exception("No payment method found with name '" . $paymentMethodMachineName . "'.");
		}
	}

	/**
	 * @return PayEngine3Cw_SettingApi
	 */
	public function getSettingsApi() {
		return $this->settingsApi;
	}

	/**
	 * (non-PHPdoc)
	 * @see Customweb_Payment_Authorization_IPaymentMethod::getPaymentMethodName()
	 */
	public function getPaymentMethodName() {
		return strtolower($this->paymentMethodDefinitions->getMachineName());
	}

	public function getPaymentMethodDisplayName() {
		$title = $this->getSettingsApi()->getValue('title');
		$langId = PayEngine3Cw_Language::getCurrentLanguageId();
		if (!empty($title) && isset($title[$langId]) && !empty($title[$langId])) {
			return $title[$langId];
		}
		else {
			return $this->paymentMethodDefinitions->getFrontendName();
		}
	}

	public function getPaymentMethodConfigurationValue($key, $languageCode = null) {

		if ($languageCode === null) {
			return $this->getSettingsApi()->getValue($key);
		}
		else {
			$languageId = null;
			$languageCode = (string)$languageCode;
			foreach (PayEngine3Cw_Util::getLanguages() as $language) {
				if ($language['code'] == $languageCode) {
					$languageId = $language['language_id'];
					break;
				}
			}

			if ($languageId === null) {
				throw new Exception("Could not find language with language code '" . $languageCode . "'.");
			}

			return $this->getSettingsApi()->getValue($key, null, $languageId);
		}
	}

	public function existsPaymentMethodConfigurationValue($key, $languageCode = null) {
		return $this->getSettingsApi()->isSettingPresent($key);
	}

	public function getBackendPaymentMethodName() {
		return $this->paymentMethodDefinitions->getBackendName();
	}

	/**
	 * @param Customweb_Payment_Authorization_IOrderContext $context
	 * @return PayEngine3Cw_Adapter_IAdapter
	 */
	public function getPaymentAdapterByOrderContext(Customweb_Payment_Authorization_IOrderContext $context) {
		$paymentAdapter = PayEngine3Cw_Util::getAuthorizationAdapterFactory()->getAuthorizationAdapterByContext($context);
		return PayEngine3Cw_Util::getShopAdapterByPaymentAdapter($paymentAdapter);

	}

	/**
	 * @param PayEngine3Cw_Entity_Transaction $transaction
	 * @return PayEngine3Cw_Adapter_IAdapter
	 */
	public function getPaymentAdapterByTransaction(PayEngine3Cw_Entity_Transaction $transaction) {
		$paymentAdapter = PayEngine3Cw_Util::getAuthorizationAdapterFactory()->getAuthorizationAdapterByName($transaction->getAuthorizationType());
		return PayEngine3Cw_Util::getShopAdapterByPaymentAdapter($paymentAdapter);
	}


	/**
	 * @return PayEngine3Cw_Entity_Transaction
	 */
	public function newTransaction(PayEngine3Cw_OrderContext $orderContext, $aliasTransactionId = null, $failedTransactionObject = null) {
		$transaction = new PayEngine3Cw_Entity_Transaction();

		$orderInfo = $orderContext->getOrderInfo();
		$transaction->setOrderId($orderInfo['order_id'])->setCustomerId($orderInfo['customer_id']);
		$transaction->setStoreId(PayEngine3Cw_Store::getStoreId());
		PayEngine3Cw_Util::getEntityManager()->persist($transaction);

		$transactionContext = new PayEngine3Cw_TransactionContext($transaction, $orderContext, $aliasTransactionId);
		$transactionObject = $this->getPaymentAdapterByOrderContext($orderContext)->getInterfaceAdapter()->createTransaction($transactionContext, $failedTransactionObject);
		
		unset($_SESSION['payengine3cw_checkout_id'][$orderContext->getPaymentMethod()->getPaymentMethodName()]);
		
		$transaction->setTransactionObject($transactionObject);
		PayEngine3Cw_Util::getEntityManager()->persist($transaction);

		return $transaction;
	}

	public function newOrderContext($orderInfo, $registry) {
		$order_totals = PayEngine3Cw_Util::getOrderTotals($registry);
		return new PayEngine3Cw_OrderContext(new PayEngine3Cw_PaymentMethodWrapper($this), $orderInfo, $order_totals);
	}
}
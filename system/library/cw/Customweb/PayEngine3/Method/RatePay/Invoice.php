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

require_once 'Customweb/Form/Validator/Checked.php';
require_once 'Customweb/Payment/Authorization/ErrorMessage.php';
require_once 'Customweb/PayEngine3/Communication/Simple.php';
require_once 'Customweb/Form/HiddenElement.php';
require_once 'Customweb/PayEngine3/Method/Default.php';
require_once 'Customweb/Payment/Exception/PaymentErrorException.php';
require_once 'Customweb/PayEngine3/Communication/Device/RatepayIdentifier.php';
require_once 'Customweb/Form/Element.php';
require_once 'Customweb/Form/Control/HiddenInput.php';
require_once 'Customweb/Util/Address.php';
require_once 'Customweb/Form/Control/SingleCheckbox.php';
require_once 'Customweb/Form/ElementFactory.php';
require_once 'Customweb/Form/Control/Select.php';
require_once 'Customweb/Form/Control/TextInput.php';
require_once 'Customweb/Form/WideElement.php';
require_once 'Customweb/PayEngine3/Util.php';
require_once 'Customweb/Payment/Util.php';
require_once 'Customweb/I18n/LocalizableException.php';
require_once 'Customweb/Core/DateTime.php';
require_once 'Customweb/Form/Validator/NotEmpty.php';
require_once 'Customweb/I18n/Translation.php';


/**
 *
 * @author Sebastian Bossert
 * @Method(paymentMethods={'RatePayOpenInvoice'})
 */
class Customweb_PayEngine3_Method_RatePay_Invoice extends Customweb_PayEngine3_Method_Default {
	const SPACE_METHOD_AVAILABILITY = 'ratepay_availability';
	const DISABLE_HOURS = 24;
	
	public function isB2BSupported() {
		return true;
	}
	
	public function processServerAuthorization(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		$result = parent::processServerAuthorization($transaction, $formData);
		if ($transaction->isAuthorizationFailed()) {
			$this->disableMethod($transaction->getTransactionContext()->getOrderContext());
		}
		return $result;
	}

	public function useBasket(){
		return true;
	}

	public function getOrderId(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$applied = Customweb_Payment_Util::applyOrderSchemaImproved($this->getContainer()->getConfiguration()->getOrderIdSchema(),
				$transaction->getExternalTransactionId(), 30);
		return $applied;
	}
	
	public function useDeviceId(Customweb_Payment_Authorization_IOrderContext $orderContext) {
		return true; // ignore settings TODO remove setting.
	}

	public function getVisibleFormFields(Customweb_Payment_Authorization_IOrderContext $orderContext, $aliasTransaction, $failedTransaction, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentCustomerContext){
		$this->getRatepayTrackingId($orderContext->getCheckoutId(), $paymentCustomerContext); // ensure exists in javascript callback
		$fields = parent::getVisibleFormFields($orderContext, $aliasTransaction, $failedTransaction, $paymentCustomerContext);
		$map = $paymentCustomerContext->getMap();
		$defaultValues = array();
		
		$gender = $orderContext->getBillingAddress()->getGender();
		$dob = $orderContext->getBillingAddress()->getDateOfBirth();
		$phone = $orderContext->getBillingAddress()->getPhoneNumber();
		if (empty($phone)) {
			$phone = $orderContext->getBillingAddress()->getMobilePhoneNumber();
		}
		
		$defaultValues = array(
			'payengine3-y' => null,
			'payengine3-m' => null,
			'payengine3-d' => null,
			'payengine3-gender' => "none",
			'payengine3-phone' => Customweb_PayEngine3_Util::cleanPhoneNumber($phone) 
		);
		if ($dob instanceof DateTime) {
			$defaultValues['payengine3-y'] = $dob->format('Y');
			$defaultValues['payengine3-m'] = $dob->format('m');
			$defaultValues['payengine3-d'] = $dob->format('d');
		}
		if (!empty($gender) && $gender != 'company') {
			$defaultValues['payengine3-gender'] = $gender;
		}
		$defaultValues = array_merge($defaultValues, $map);
		
		if ($gender == null || $gender == 'company') {
			$genderControl = new Customweb_Form_Control_Select('payengine3-gender',
					array(
						"none" => Customweb_I18n_Translation::__("Please Select..."),
						"male" => Customweb_I18n_Translation::__("Male"),
						"female" => Customweb_I18n_Translation::__("Female") 
					), $defaultValues['payengine3-gender']);
			$genderControl->addValidator(
					new Customweb_Form_Validator_NotEmpty($genderControl, Customweb_I18n_Translation::__("Please select your gender.")));
			$fields[] = new Customweb_Form_Element(Customweb_I18n_Translation::__("Gender"), $genderControl);
		}
		
		if ($dob == null) {
			$fields[] = Customweb_Form_ElementFactory::getDateOfBirthElement('payengine3-y', 'payengine3-m', 'payengine3-d',
					$defaultValues['payengine3-y'], $defaultValues['payengine3-m'], $defaultValues['payengine3-d']);
		}
		
		if ($phone == null) {
			$controlNumber = new Customweb_Form_Control_TextInput('payengine3-phone', $defaultValues['payengine3-phone']);
			$controlNumber->addValidator(
					new Customweb_Form_Validator_NotEmpty($controlNumber, Customweb_I18n_Translation::__("Please enter your phone number.")));
			$fields[] = $phoneElement = new Customweb_Form_Element(Customweb_I18n_Translation::__('Phone Number'), $controlNumber,
					Customweb_I18n_Translation::__('Please enter here your phone number.'));
		}
		
		$controlTracking = new Customweb_Form_Control_HiddenInput('payengine3-ratepay-tracking',
				$this->getRatepayTrackingId($orderContext->getCheckoutId(), $paymentCustomerContext));
		$fields[] = new Customweb_Form_HiddenElement($controlTracking);
		
		if ($this->getContainer()->getB2BAdapter()->isB2B($orderContext)) {
			$fields = array_merge($fields, $this->getContainer()->getB2BAdapter()->getVisibleFormFields($orderContext, $paymentCustomerContext));
		}
		
		$fields[] = $this->getAgreementElement($orderContext);
		
		return $fields;
	}

	protected function getTrackingJsLoadedCallback(Customweb_Payment_Authorization_IOrderContext $orderContext, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext){
		if (!$this->hasRatepayTrackingId($orderContext->getCheckoutId(), $paymentContext)) {
			return "";
		}
		$deviceId = $this->getRatepayTrackingId($orderContext->getCheckoutId(), $paymentContext);
		$deviceSId = $this->getRatepaySid($orderContext->getCheckoutId(), $paymentContext);
		return "PayEngine.appendDeviceIdent('$deviceId', '$deviceSId', 'Checkout');";
	}

	public function validate(Customweb_Payment_Authorization_IOrderContext $orderContext, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext, array $formData){
		parent::validate($orderContext, $paymentContext, $formData);
		$phone = $this->extractPhoneNumber($orderContext, $paymentContext, $formData);
		$dateOfBirth = $this->extratDateOfBirth($orderContext, $paymentContext, $formData);
		$gender = $this->extractGender($orderContext, $paymentContext, $formData);
		if (!isset($formData['payengine3-ratepay-tracking'])) {
			throw new Exception("Missing tracking ID.");
		}
		if (!isset($formData['payengine3-consent']) || $formData['payengine3-consent'] != 'accepted') {
			throw new Exception(Customweb_I18n_Translation::__("You have to agree to the RatePay agreement."));
		}
		$this->checkAddressesEqual($orderContext);
	}

	public function preValidate(Customweb_Payment_Authorization_IOrderContext $orderContext, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext){
		parent::preValidate($orderContext, $paymentContext);
		if (!$this->isCustomerTypeSupported($orderContext)) {
			throw new Exception(Customweb_I18n_Translation::__("Payment method is not available due to customer type restrictions."));
		}
		if (!$this->isMethodAvailable($orderContext)) {
			throw new Exception(Customweb_I18n_Translation::__("Payment method is currently not available to due previous decline."));
		}
	}

	protected function getAgreementElement(Customweb_Payment_Authorization_IOrderContext $orderContext){
		$textToAgree = Customweb_I18n_Translation::__(
				"I agree to the <a href='@url' target='_blank'>Terms and Conditions, as well as the Privacy Agreement of RatePay</a>.",
				array(
					'@url' => $this->getAgreementLink(strtolower($orderContext->getBillingAddress()->getCountryIsoCode()),
							strtolower($orderContext->getLanguage()->getIso2LetterCode())) 
				));
		$checkbox = new Customweb_Form_Control_SingleCheckbox("payengine3-consent", "accepted", $textToAgree);
		$checkbox->addValidator(
				new Customweb_Form_Validator_Checked($checkbox, Customweb_I18n_Translation::__("You have to agree to the RatePay agreement.")));
		return new Customweb_Form_WideElement($checkbox);
	}

	protected function getAgreementLink($country, $language){
		if ($country == 'nl') {
			return 'https://www.ratepay.com/aanvullende-voorwaarden-en-privacybeleid-nl/';
		}
		switch ($language) {
			case 'de':
			case 'fr':
				return 'https://www.ratepay.com/zusaetzliche-geschaeftsbedingungen-und-datenschutzhinweis-dach/';
			default:
				return 'https://www.ratepay.com/en/additional-general-terms-and-conditions-and-data-protection-notice-dach/';
		}
	}

	private function extractGender(Customweb_Payment_Authorization_IOrderContext $orderContext, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext, array $formData){
		$update = $paymentContext->getMap();
		$gender = $orderContext->getBillingAddress()->getGender();
		if ($gender == null || $gender == 'company') {
			if (isset($formData['payengine3-gender'])) {
				$gender = trim($formData['payengine3-gender']);
				$update['payengine3-gender'] = $gender;
			}
			if ($gender != 'male' && $gender != 'female') {
				throw new Exception(Customweb_I18n_Translation::__("Please select your gender."));
			}
			$paymentContext->updateMap($update);
		}
		return $gender;
	}

	private function extractPhoneNumber(Customweb_Payment_Authorization_IOrderContext $orderContext, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext, array $formData){
		$update = $paymentContext->getMap();
		$phone = $orderContext->getBillingAddress()->getPhoneNumber();
		if (isset($formData['payengine3-phone'])) {
			$phone = trim($formData['payengine3-phone']);
			$update['payengine3-phone'] = $phone;
		}
		$phone = Customweb_PayEngine3_Util::cleanPhoneNumber($phone);
		
		if (empty($phone)) {
			throw new Exception(Customweb_I18n_Translation::__("Please enter a phone number."));
		}
		$paymentContext->updateMap($update);
		return $phone;
	}

	private function extratDateOfBirth(Customweb_Payment_Authorization_IOrderContext $orderContext, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext, array $formData){
		$update = $paymentContext->getMap();
		$dateOfBirth = $orderContext->getBillingAddress()->getDateOfBirth();
		if ($dateOfBirth == null) {
			if (!isset($formData['payengine3-y']) || !isset($formData['payengine3-m']) || !isset($formData['payengine3-d'])) {
				throw new Customweb_Payment_Exception_PaymentErrorException(
						new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("Please enter a valid day of birth."),
								Customweb_I18n_Translation::__("Customer did not enter a date of birth.")));
			}
			$year = trim($formData['payengine3-y']);
			$month = trim($formData['payengine3-m']);
			$day = trim($formData['payengine3-d']);
			$dateOfBirth = new Customweb_Core_DateTime();
			$dateOfBirth->setDate(intval($year), intval($month), intval($day));
			$dateOfBirth->setTime(0, 0, 0);
			$update['payengine3-y'] = $year;
			$update['payengine3-m'] = $month;
			$update['payengine3-d'] = $day;
			
			if (!($dateOfBirth instanceof DateTime)) {
				throw new Customweb_I18n_LocalizableException(Customweb_I18n_Translation::__("Please enter a valid day of birth."));
			}
			$paymentContext->updateMap($update);
		}
		$dateOfBirth->setTime(0, 0, 0); // ensure equal timestamps
		return $dateOfBirth;
	}

	public function getAdditionalOrderPayload(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		$additional = parent::getAdditionalOrderPayload($transaction, $formData);
		if (!isset($formData['payengine3-ratepay-tracking'])) {
			throw new Exception("Missing tracking ID.");
		}
		if (!isset($formData['payengine3-consent']) || $formData['payengine3-consent'] != 'accepted') {
			throw new Exception(Customweb_I18n_Translation::__("You have to agree to the RatePay agreement."));
		}
		if (!isset($additional['payment'])) {
			$additional['payment'] = array();
		}
		$additional['payment']['riskIdentId'] = $formData['payengine3-ratepay-tracking'];
		$time = (int) Customweb_Core_DateTime::_()->format('U') * 1000;
		$additional['terms'] = $time;
		$additional['privacy'] = $time;
		return $additional;
	}

	public function getAdditionalCustomerPayload(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		if ($this->getContainer()->getB2BAdapter()->isB2B($transaction->getTransactionContext()->getOrderContext())) {
			return $this->getContainer()->getB2BAdapter()->getPayload($transaction);
		}
		return array();
	}

	public function getAdditionalPersonaPayload(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		$orderContext = $transaction->getTransactionContext()->getOrderContext();
		$paymentContext = $transaction->getTransactionContext()->getPaymentCustomerContext();
		$phone = $this->extractPhoneNumber($orderContext, $paymentContext, $formData);
		$dateOfBirth = $this->extratDateOfBirth($orderContext, $paymentContext, $formData);
		$gender = $this->extractGender($orderContext, $paymentContext, $formData);
		return array(
			'phone' => $phone,
			'birthday' => $dateOfBirth->format('U') * 1000,
			'gender' => strtoupper($gender) 
		);
	}

	/**
	 * Returns addtional Payload data for the billing address registration
	 * @param array $formData
	 * @return array
	 * @throws Customweb_Payment_Exception_PaymentErrorException
	 */
	public function getAdditionalBillingPayload(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		$this->checkAddressesEqual($transaction->getTransactionContext()->getOrderContext());
		return array(
			'phone' => $this->extractPhoneNumber($transaction->getTransactionContext()->getOrderContext(),
					$transaction->getTransactionContext()->getPaymentCustomerContext(), $formData) 
		);
	}

	/**
	 * Returns addtional Payload data for the shipping address registration
	 * @param array $formData
	 * @return array
	 * @throws Customweb_Payment_Exception_PaymentErrorException
	 */
	public function getAdditionalShippingPayload(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		return array(
			'phone' => $this->extractPhoneNumber($transaction->getTransactionContext()->getOrderContext(),
					$transaction->getTransactionContext()->getPaymentCustomerContext(), $formData) 
		);
	}
	
	protected function getDeviceTokenKey($checkoutId) {
		return $checkoutId . '_' . $this->getProductName() . '_ratepay_device_token';
	}
	
	protected function getDeviceSidKey($checkoutId) {
		return $checkoutId . '_' . $this->getProductName() . '_ratepay_device_sid';
	}

	public function hasRatepayTrackingId($checkoutId, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext){
		$map = $paymentContext->getMap();
		return isset($map[$this->getDeviceTokenKey($checkoutId)]);
	}

	public function setRatepayTrackingId($token, $sid, $checkoutId, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext){
		$paymentContext->updateMap(array(
			$this->getDeviceTokenKey($checkoutId) => $token,
			$this->getDeviceSidKey($checkoutId) => $sid 
		));
	}

	/**
	 * Returns ratepay sid. Always call AFTER getRatepayTrackingId()
	 * 
	 * @param string $checkoutId
	 * @param Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext
	 * @return string
	 */
	public function getRatepaySid($checkoutId, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext){
		$map = $paymentContext->getMap();
		return $map[$this->getDeviceSidKey($checkoutId)];
	}
	
	/**
	 * Returns ratepay device token from map
	 *
	 * @param string $checkoutId
	 * @param Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext
	 * @return string
	 */
	public function getRatepayDeviceToken($checkoutId, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext){
		$map = $paymentContext->getMap();
		return $map[$this->getDeviceTokenKey($checkoutId)];
	}

	/**
	 * Returns ratepay device token.
	 * 
	 * @param string $checkoutId
	 * @param Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext
	 * @return mixed
	 */
	public function getRatepayTrackingId($checkoutId, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext){
		if (!$this->hasRatepayTrackingId($checkoutId, $paymentContext)) {
			$processor = new Customweb_PayEngine3_Communication_Simple($this->getContainer(),
					new Customweb_PayEngine3_Communication_Device_RatepayIdentifier($this->getContainer(), $this->getProductName()));
			$json = $processor->execute();
			$this->setRatepayTrackingId($json['deviceIdentToken'], $json['deviceIdentSId'], $checkoutId, $paymentContext);
		}
		return $this->getRatepayDeviceToken($checkoutId, $paymentContext);
	}

	protected function checkAddressesEqual(Customweb_Payment_Authorization_IOrderContext $orderContext){
		if ($this->getPaymentMethodConfigurationValue('address_equal') == 'equal') {
			if (!Customweb_Util_Address::compareAddresses($orderContext->getBillingAddress(), $orderContext->getShippingAddress())) {
				throw new Exception(Customweb_I18n_Translation::__("Your billing and shipping addresses must be the same when using RatePay."));
			}
		}
	}

	protected function isMethodAvailable(Customweb_Payment_Authorization_IOrderContext $orderContext){
		$availability = $this->getContainer()->getStorage()->read(self::SPACE_METHOD_AVAILABILITY, $this->getDisableIdentifier($orderContext));
		if ($availability instanceof Customweb_Core_DateTime) {
			return $availability->getTimestamp() <= Customweb_Core_DateTime::_()->getTimestamp();
		}
		return $availability === null;
	}

	protected function disableMethod(Customweb_Payment_Authorization_IOrderContext $orderContext){
		$this->getContainer()->getStorage()->write(self::SPACE_METHOD_AVAILABILITY, $this->getDisableIdentifier($orderContext),
				Customweb_Core_DateTime::_()->addHours(self::DISABLE_HOURS));
	}

	protected function getDisableIdentifier(Customweb_Payment_Authorization_IOrderContext $orderContext){
		$identifier = $orderContext->getCustomerId();
		if (empty($identifier)) {
			$identifier = $this->getContainer()->getHttpRequest()->getRemoteAddress();
		}
		$identifier .= $this->getContainer()->getConfiguration()->isLiveMode() ? '_live' : '_test';
		$identifier .= '_' . $this->getProductName();
		return $identifier;
	}

	protected function isCustomerTypeSupported(Customweb_Payment_Authorization_IOrderContext $orderContext){
		$country = $orderContext->getBillingAddress()->getCountryIsoCode();
		$parameters = $this->getPaymentMethodParameters();
		$key = 'b2c';
		if ($this->getContainer()->getB2BAdapter()->isB2B($orderContext)) {
			$key = 'b2b';
		}
		if (isset($parameters[$key])) {
			$countries = explode(',', $parameters[$key]);
			return in_array($country, $countries);
		}
		return false;
	}
}
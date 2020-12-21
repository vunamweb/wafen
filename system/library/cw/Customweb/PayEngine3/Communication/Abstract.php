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
require_once 'Customweb/Core/Http/Client/Factory.php';
require_once 'Customweb/PayEngine3/Adapter.php';
require_once 'Customweb/Core/Logger/Factory.php';


/**
 *
 * @author Sebastian Bossert
 */
abstract class Customweb_PayEngine3_Communication_Abstract extends Customweb_PayEngine3_Adapter {
	/**
	 * HTTP Connection timeout, in seconds.
	 * 
	 * @var integer
	 */
	const CONNECTION_TIMEOUT = 40;

	public function __construct(Customweb_DependencyInjection_IContainer $container){
		parent::__construct($container);
	}

	/**
	 * Get request builder for register function.
	 *
	 * @return Customweb_PayEngine3_Communication_AbstractTransactionRequestBuilder
	 */
	protected abstract function getRequestBuilder();

	/**
	 * Sends the given request, Checks response for errors and throws an exception.
	 *
	 * @param Customweb_Core_Http_IRequest $request
	 * @return Customweb_Core_Http_IResponse
	 */
	protected function processRequest(Customweb_Core_Http_IRequest $request){
		$response = Customweb_Core_Http_Client_Factory::createClient()->setConnectionTimeout(self::CONNECTION_TIMEOUT)->send($request);
		$responseData = $this->processBody($response);
		
		if (!$this->isSuccessStatus($response)) {
			$this->processError($responseData);
		}
		return $response;
	}

	/**
	 * Verifies that the body contains valid JSON, returns it as array.
	 *
	 * @param Customweb_Core_Http_IResponse $response
	 * @return array
	 */
	protected function processBody(Customweb_Core_Http_IResponse $response){
		$json = json_decode($response->getBody(), true);
		if ($json === false) {
			Customweb_Core_Logger_Factory::getLogger(get_class($this))->logDebug('JSON could not be decoded.', $response->getBody());
			throw new Customweb_Payment_Exception_PaymentErrorException(
					new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__('A technical error occured.'),
							Customweb_I18n_Translation::__('JSON could not be decoded.')));
		}
		return $json;
	}

	protected function processError(array $responseData){
		$errorText = "A technical error occured.";
		$accountError = false;
		if(isset($responseData['message'])){
			$errorText = $responseData['message'];
		}
		
		if (isset($responseData['elements'])) {
			foreach ($responseData['elements'] as $element) {
				if($element['code'] == 505 || $element['code'] == 504){
					$accountError = true;
				}
				$errorText .= ' ' . $element['code'] . ': ' . $element['message'];
			}
		}
		if (isset($responseData['errors'])) {
			foreach ($responseData['errors'] as $element) {
				if($element['code'] == 505 || $element['code'] == 504){
					$accountError = true;
				}
				$errorText .= ' ' . $element['code'] . ': ' . $element['message'];
			}
		}
		$errorText = trim($errorText);
		if($accountError){
			//if it is a configuration error we also show it in the frontend
			Customweb_Core_Logger_Factory::getLogger(get_class($this))->logError($errorText, $responseData);
			throw new Customweb_Payment_Exception_PaymentErrorException(
					new Customweb_Payment_Authorization_ErrorMessage($errorText));
		}
		Customweb_Core_Logger_Factory::getLogger(get_class($this))->logDebug($errorText, $responseData);
		throw new Customweb_Payment_Exception_PaymentErrorException(
				new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__('A technical error occured.'), $errorText));
	}

	protected function isSuccessStatus(Customweb_Core_Http_IResponse $response){
		$code = $response->getStatusCode();
		return $code == 200 || $code == 201;
	}
}
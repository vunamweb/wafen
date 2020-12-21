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

require_once 'Customweb/PayEngine3/Container.php';
require_once 'Customweb/Payment/Endpoint/Controller/Abstract.php';
require_once 'Customweb/Payment/Authorization/ErrorMessage.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/Payment/Authorization/Ajax/IAdapter.php';
require_once 'Customweb/PayEngine3/Endpoint/Process.php';
require_once 'Customweb/Core/Http/Response.php';


/**
 *
 * @author Sebastian Bossert
 * @Controller("process")
 */
class Customweb_PayEngine3_Endpoint_Process extends Customweb_Payment_Endpoint_Controller_Abstract {
	const HASH_PARAMETER = 'securityHash';
	private $container;

	/**
	 * @Action("alias")
	 *
	 * @param Customweb_PayEngine3_Authorization_Transaction $transaction
	 * @param Customweb_Core_Http_IRequest $request1
	 * @return Customweb_Core_Http_Response
	 */
	public function alias(Customweb_PayEngine3_Authorization_Transaction $transaction, Customweb_Core_Http_IRequest $request){
		$parameters = $request->getParameters();
		if (!isset($parameters[Customweb_PayEngine3_Endpoint_Process::HASH_PARAMETER])) {
			throw new Exception("Request could not be verified.");
		}
		$transaction->checkSecuritySignature('processalias', $parameters[Customweb_PayEngine3_Endpoint_Process::HASH_PARAMETER]);
		try {
			$this->getContainer()->getAuthorizationHandler()->registerAndExecuteOrder($transaction, $transaction->getFormData());
			$this->getContainer()->getAuthorizationHandler()->authorizeTransaction($transaction, $transaction->getFormData());
			if ($transaction->isAuthorized()) {
				return Customweb_Core_Http_Response::redirect($transaction->getSuccessUrl());
			}
		}
		catch (Customweb_Payment_Exception_PaymentErrorException $exc) {
			$transaction->setAuthorizationFailed($exc->getErrorMessage());
		}
		catch (Exception $exc) {
			$transaction->setAuthorizationFailed(
					new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("A technical error occured."),
							Customweb_I18n_Translation::__("A technical error occured.") . ' ' . $exc->getMessage()));
		}
		return Customweb_Core_Http_Response::redirect($transaction->getFailedUrl());
	}

	/**
	 * @Action("redirect")
	 *
	 * @param Customweb_PayEngine3_Authorization_Transaction $transaction
	 * @param Customweb_Core_Http_IRequest $request1
	 * @return Customweb_Core_Http_Response
	 */
	public function doRedirect(Customweb_PayEngine3_Authorization_Transaction $transaction, Customweb_Core_Http_IRequest $request){
		$parameters = $request->getParameters();
		if (!isset($parameters[Customweb_PayEngine3_Endpoint_Process::HASH_PARAMETER])) {
			throw new Exception("Request could not be verified.");
		}
		$transaction->checkSecuritySignature('processredirect', $parameters[Customweb_PayEngine3_Endpoint_Process::HASH_PARAMETER]);
		try {
			$transaction->setFormData(array_merge($transaction->getFormData(), $parameters));
			$url = $this->getContainer()->getPaymentMethodByTransaction($transaction)->generateRedirectUrl($transaction, $transaction->getFormData());
			return Customweb_Core_Http_Response::redirect($url);
		}
		catch (Customweb_Payment_Exception_PaymentErrorException $exc) {
			$transaction->setAuthorizationFailed($exc->getErrorMessage());
		}
		catch (Exception $exc) {
			$transaction->setAuthorizationFailed(
					new Customweb_Payment_Authorization_ErrorMessage(Customweb_I18n_Translation::__("A technical error occured."),
							Customweb_I18n_Translation::__("A technical error occured.") . ' ' . $exc->getMessage()));
		}
		return Customweb_Core_Http_Response::redirect($transaction->getFailedUrl());
	}

	/**
	 * @Action("return")
	 * @param Customweb_Core_Http_IRequest $request
	 */
	public function handleReturn(Customweb_Core_Http_IRequest $request, Customweb_PayEngine3_Authorization_Transaction $transaction){
		$parameters = $request->getParameters();
		if (!isset($parameters[Customweb_PayEngine3_Endpoint_Process::HASH_PARAMETER])) {
			throw new Exception("Request could not be verified.");
		}
		$transaction->checkSecuritySignature('processreturn', $parameters[Customweb_PayEngine3_Endpoint_Process::HASH_PARAMETER]);
		try {
			$transaction->setFormData(array_merge($transaction->getFormData(), $parameters));
			if (!$transaction->isAuthorizationFailed() && !$transaction->isAuthorized()) {
				if ($transaction->getExternalOrderId() === null) {
					$redirect = $this->getContainer()->getAuthorizationHandler()->registerAndExecuteOrder($transaction, $parameters);
					if ($redirect) {
						return Customweb_Core_Http_Response::redirect($redirect);
					}
				}
				
				$this->getContainer()->getAuthorizationHandler()->authorizeTransaction($transaction, $parameters);
			}
		}
		catch (Exception $e) {
			$transaction->setAuthorizationFailed($e->getMessage());
		}
		if ($transaction->isAuthorizationFailed()) {
			return Customweb_Core_Http_Response::redirect($transaction->getFailedUrl());
		}
		if ($transaction->isAuthorized()) {
			return Customweb_Core_Http_Response::redirect($transaction->getSuccessUrl());
		}
		return Customweb_Core_Http_Response::redirect($this->getContainer()->createSecuredEndpointUrl('waiting', 'index', $transaction));
	}

	/**
	 * @Action("fail")
	 * @param Customweb_Core_Http_IRequest $request
	 * @param Customweb_PayEngine3_Authorization_Transaction $transaction
	 * @throws Exception
	 * @return Customweb_Core_Http_Response
	 */
	public function fail(Customweb_Core_Http_IRequest $request, Customweb_PayEngine3_Authorization_Transaction $transaction){
		$parameters = $request->getParameters();
		if (!isset($parameters[Customweb_PayEngine3_Endpoint_Process::HASH_PARAMETER])) {
			throw new Exception("Request could not be verified.");
		}
		$transaction->checkSecuritySignature('processfail', $parameters[Customweb_PayEngine3_Endpoint_Process::HASH_PARAMETER]);
		$message = $parameters['message'];
		if (!empty($parameters['messages'])) {
			$message .= " " . $parameters['messages'];
		}
		$transaction->setAuthorizationFailed($message);
		$transaction->setAuthorizationParameters($parameters);
		return Customweb_Core_Http_Response::redirect($transaction->getFailedUrl());
	}

	private function isCreditCardAjax(Customweb_PayEngine3_Authorization_Transaction $transaction){
		return $transaction->getAuthorizationMethod() == Customweb_Payment_Authorization_Ajax_IAdapter::AUTHORIZATION_METHOD_NAME &&
				 $transaction->getPaymentMethod()->getPaymentMethodName() == 'creditcard';
	}

	/**
	 *
	 * @return Customweb_PayEngine3_Container
	 */
	protected function getContainer(){
		if ($this->container == null) {
			$container = parent::getContainer();
			if (!$container instanceof Customweb_PayEngine3_Container) {
				$container = new Customweb_PayEngine3_Container($container);
			}
			$this->container = $container;
		}
		return $this->container;
	}
}
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

require_once 'Customweb/PayEngine3/Communication/Abstract.php';


/**
 * Abstract class for registering requests.
 * Is used to process data which is mapped to an ID by PayEngine.
 *
 * @author Sebastian Bossert
 */
abstract class Customweb_PayEngine3_Communication_AbstractRegistrar extends Customweb_PayEngine3_Communication_Abstract {
	private $transaction;
	private $formData;

	public function __construct(Customweb_DependencyInjection_IContainer $container, Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		parent::__construct($container);
		$this->transaction = $transaction;
		$this->formData = $formData;
	}

	/**
	 * Extract ID which should be saved locally from the given json.
	 *
	 * @param array $json
	 * @return string
	 */
	protected abstract function extractId(array $json);

	protected function getTransaction(){
		return $this->transaction;
	}

	protected function getFormData(){
		return $this->formData;
	}

	public function register(){
		$builder = $this->getRequestBuilder();
		$request = $builder->buildRequest();
		$id = $this->getFromContext($request);

		if ($id === null) {
			$response = $this->processRequest($request);
			$json = $this->processBody($response);
			$id = $this->extractId($json);
			$this->saveToContext($request, $id);
		}

		return $id;
	}

	private function getCustomerContextKey(Customweb_Core_Http_IRequest $request){
		return md5($request->getUrl() . '_' . $request->getMethod() . $request->getBody());
	}

	private function saveToContext(Customweb_Core_Http_IRequest $request, $id){
		$this->getTransaction()->getPaymentCustomerContext()->updateMap(array(
			$this->getCustomerContextKey($request) => $id
		));
	}

	private function getFromContext(Customweb_Core_Http_IRequest $request){
		$key = $this->getCustomerContextKey($request);
		$map = $this->getTransaction()->getPaymentCustomerContext()->getMap();
		if (isset($map[$key])) {
			return $map[$key];
		}
		return null;
	}
}
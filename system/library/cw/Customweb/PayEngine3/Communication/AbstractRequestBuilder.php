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

require_once 'Customweb/PayEngine3/IRequestBuilder.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/Core/Http/Authorization/Basic.php';
require_once 'Customweb/PayEngine3/Adapter.php';
require_once 'Customweb/Core/Http/Request.php';



/**
 *
 * @author Sebastian Bossert
 */
abstract class Customweb_PayEngine3_Communication_AbstractRequestBuilder extends Customweb_PayEngine3_Adapter implements Customweb_PayEngine3_IRequestBuilder{
	
	public function __construct(Customweb_DependencyInjection_IContainer $container){
		parent::__construct($container);
	}
	
	public function getUrl(){
		return rtrim($this->getContainer()->getConfiguration()->getApiUrl(), "/ ") .'/v1'. $this->getUrlPath();
	}

	protected abstract function getMethod();

	protected abstract function getPayload();

	protected abstract function getUrlPath();

	protected function getOptionalParameter($name, $value){
		if (!empty($value)) {
			return array(
				$name => $value 
			);
		}
		return array();
	}

	protected function getMandatoryParameter($name, $value){
		if (empty($value)) {
			throw new Exception(Customweb_I18n_Translation::__("Value for '@name' must be set.", array(
				'@name' => $name 
			)));
		}
		return array(
			$name => $value 
		);
	}

	/**
	 * Builds the full request.
	 * Should not usually be overwritten, instead the abstract functions should be implemented.
	 *
	 * @return Customweb_Core_Http_IRequest
	 */
	public function buildRequest(){
		$request = new Customweb_Core_Http_Request();
		$request->setUrl($this->getUrl());
		$request->setAuthorization($this->getAuthorization());
		$request->setMethod($this->getMethod());
		if($this->getMethod() != 'GET'){
			$this->setBody($request);
		}
		return $request;
	}
	
	protected function setBody(Customweb_Core_Http_IRequest $request) {
		$request->setBody(json_encode($this->getPayload()));
		$request->setContentType('application/json');
	}

	/**
	 * Creates the merchant http authorization.
	 *
	 * @return Customweb_Core_Http_Authorization_Basic
	 */
	protected function getAuthorization(){
		$authorization = new Customweb_Core_Http_Authorization_Basic();
		$authorization->setUsername($this->getContainer()->getConfiguration()->getMerchantId());
		$authorization->setPassword($this->getContainer()->getConfiguration()->getMerchantPassword());
		return $authorization;
	}
}
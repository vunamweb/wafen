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

require_once 'Customweb/Core/Http/Authorization/Bearer.php';
require_once 'Customweb/PayEngine3/Communication/AbstractRequestBuilder.php';
require_once 'Customweb/Core/Http/Request.php';


/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Communication_Device_RatepayIdentifier extends Customweb_PayEngine3_Communication_AbstractRequestBuilder {
	private $product;
	
	public function __construct(Customweb_DependencyInjection_IContainer $container, $product) {
		parent::__construct($container);
		$this->product = $product;
	}
	
	
	public function buildRequest(){
		$request = parent::buildRequest();
		/* @var $request Customweb_Core_Http_Request */
// 		$request->removeHeadersWithKey(Customweb_Core_Http_Request::HEADER_KEY_AUTHORIZATION);
		return $request;
	}
	
	protected function getAuthorization(){
		return new Customweb_Core_Http_Authorization_Bearer($this->getContainer()->getConfiguration()->getMerchantId());
	}
	
	protected function setBody(Customweb_Core_Http_IRequest $request) {
		$request->setContentType('application/json');
	}
	
	protected function getPayload(){
		return array();
	}
	
	public function getUrl(){
		return rtrim($this->getContainer()->getConfiguration()->getFrontendUrl(), "/ ") . $this->getUrlPath();
	}
	
	protected function getUrlPath(){
		return "/widget/ratepay/device-ident/create/" . $this->product;
	}

	protected function getMethod(){
		return "POST";
	}
}
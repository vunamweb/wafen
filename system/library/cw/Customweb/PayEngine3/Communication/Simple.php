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
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Communication_Simple extends Customweb_PayEngine3_Communication_Abstract {
	
	
	private $requestBuilder;
	
	public function __construct(Customweb_DependencyInjection_IContainer $container, Customweb_PayEngine3_IRequestBuilder $requestBuilder){
		parent::__construct($container);
		$this->requestBuilder =$requestBuilder;
	}	
	
	public function execute(){
		$builder = $this->getRequestBuilder();
		$response = $this->processRequest($builder->buildRequest());
		$json = $this->processBody($response);
		return $json;
	}
	
	protected function getRequestBuilder(){
		return 	$this->requestBuilder;
	}
		
}
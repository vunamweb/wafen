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

require_once 'Customweb/PayEngine3/Communication/AbstractRegistrar.php';
require_once 'Customweb/PayEngine3/Communication/Customer/Persona/RequestBuilder.php';



/**
 *
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Communication_Customer_Persona_Registrar extends Customweb_PayEngine3_Communication_AbstractRegistrar {

	private $customerId;

	public function __construct(Customweb_DependencyInjection_IContainer $container,  Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData, $customerId){
		parent::__construct($container, $transaction, $formData);
		$this->customerId = $customerId;
	}

	protected function getRequestBuilder(){
		return new Customweb_PayEngine3_Communication_Customer_Persona_RequestBuilder($this->getContainer(), $this->getTransaction(), $this->getFormData(), $this->customerId);
	}

	protected function extractId(array $json){
		return $json['personaId'];
	}
}
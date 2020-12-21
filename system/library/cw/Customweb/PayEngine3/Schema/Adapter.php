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

require_once 'Customweb/PayEngine3/Adapter.php';
require_once 'Customweb/Payment/Util.php';



/**
 *
 * @author Sebastian Bossert
 * @Bean
 */
class Customweb_PayEngine3_Schema_Adapter extends Customweb_PayEngine3_Adapter {

	public function getOrderId(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$applied = Customweb_Payment_Util::applyOrderSchemaImproved($this->getContainer()->getConfiguration()->getOrderIdSchema(), 
				$transaction->getExternalTransactionId(), 30);
                $applied = str_replace('_', '-', $applied);
		return $applied;
	}
}
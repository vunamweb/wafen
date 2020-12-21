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

require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/PayEngine3/Method/Default.php';
require_once 'Customweb/Payment/Util.php';


/**
 *
 * @author Sebastian Bossert
 * @Method(paymentMethods={'sofortueberweisung'})
 */
class Customweb_PayEngine3_Method_Sofort extends Customweb_PayEngine3_Method_Default {

	public function getOrderId(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$applied = Customweb_Payment_Util::applyOrderSchemaImproved($this->getContainer()->getConfiguration()->getOrderIdSchema(),
				$transaction->getExternalTransactionId(), 255);
		$applied = str_replace("_", "-", $applied);
		$applied = preg_replace("/[^0-9a-zA-Z +,\-\.]/", "", $applied);
		return $applied;
	}
	
	
	public function getWaitingText(Customweb_Core_Language $language) {
		return Customweb_I18n_Translation::__('The payment is being processed. Please be patient. The page will be automatically reloaded once the payment is complete.')->toString();
	}
}

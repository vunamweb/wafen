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

require_once 'Customweb/Core/DateTime.php';
require_once 'Customweb/Payment/Update/IAdapter.php';
require_once 'Customweb/PayEngine3/Adapter.php';
require_once 'Customweb/Payment/Authorization/DefaultTransactionHistoryItem.php';


/**
 * @Bean
 * @author Sebastian Bossert
 */
class Customweb_PayEngine3_Update_Adapter extends Customweb_PayEngine3_Adapter implements Customweb_Payment_Update_IAdapter {

	public function updateTransaction(Customweb_Payment_Authorization_ITransaction $transaction){
		/* @var Customweb_PayEngine3_Authorization_transaction $transaction */
		try {
			if ($transaction->isAuthorized()) {
				$this->getContainer()->getAuthorizationHandler()->updateTransaction($transaction);
			}
			else {
				$this->getContainer()->getAuthorizationHandler()->authorizeTransaction($transaction);
			}
		}
		catch (Exception $e) {
			$transaction->addHistoryItem(new Customweb_Payment_Authorization_DefaultTransactionHistoryItem($e->getMessage(), 'update'));
			$transaction->setUpdateExecutionDate(Customweb_Core_DateTime::_()->addHours(6));
		}
	}
}
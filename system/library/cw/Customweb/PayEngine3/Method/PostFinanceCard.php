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

require_once 'Customweb/Payment/Authorization/ITransactionCapture.php';
require_once 'Customweb/Mobile/Detect.php';
require_once 'Customweb/PayEngine3/Method/Default.php';


/**
 *
 * @author Sebastian Bossert
 * @Method(paymentMethods={'postfinancecard'})
 */
class Customweb_PayEngine3_Method_PostFinanceCard extends Customweb_PayEngine3_Method_Default {

	public function getAdditionalOrderPayload(Customweb_PayEngine3_Authorization_Transaction $transaction, array $formData){
		$additional = parent::getAdditionalOrderPayload($transaction, $formData);
		$detect = new Customweb_Mobile_Detect($this->getContainer()->getHttpRequest());
		$additional['payment']['displayLanguage'] = $transaction->getTransactionContext()->getOrderContext()->getLanguage()->getIso2LetterCode();
		$additional['payment']['displayMobileScreen'] = $detect->isMobileDevice() || $detect->isTabletDevice();
		return $additional;
	}
	
	public function capture(Customweb_PayEngine3_Authorization_Transaction $transaction, array $items, $close){
		parent::capture($transaction, $items, $close);
		$captures = $transaction->getCaptures();
		if(count($captures) === 1) {
			$capture = end($captures);
			if($capture->getStatus() === Customweb_Payment_Authorization_ITransactionCapture::STATUS_PENDING) {
				$transaction->setAuthorizationUncertain();
			}
		}
	}
	
	public function isDeferredCapturingActive() {
		return true;
	}
	
	public function isCaptureAfterPreauth() {
		return !parent::isDeferredCapturingActive();
	}
}

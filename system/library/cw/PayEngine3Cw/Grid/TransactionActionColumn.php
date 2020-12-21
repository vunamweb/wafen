<?php 
/**
  * You are allowed to use this API in your web application.
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


require_once 'Customweb/Grid/Column.php';

require_once 'PayEngine3Cw/Language.php';
require_once 'PayEngine3Cw/Util.php';


class PayEngine3Cw_Grid_TransactionActionColumn extends Customweb_Grid_Column {

	
	
	public function isFilterable() {
		return false;
	}
	
	public function isSortable() {
		return false;
	}
	
	public function getContent($rowData) {
		
		$url = PayEngine3Cw_Util::getRegistry()->get('url');
		$session = PayEngine3Cw_Util::getRegistry()->get('session');
		$href = $url->link('payengine3cw/transaction/view', 'token=' . $session->data['token'] . '&transaction_id=' . $rowData['transactionId'] , 'SSL');
		return '<a href="'. $href . '" data-toggle="tooltip" title="' . PayEngine3Cw_Language::_('View') . '" class="btn btn-primary"><i class="fa fa-eye"></i></a>';
	}
	
}
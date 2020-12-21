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

require_once 'PayEngine3Cw/Adapter/AbstractAdapter.php';

/**
 * @author Thomas Hunziker
 * @Bean 
 */
class PayEngine3Cw_Adapter_AjaxAdapter extends PayEngine3Cw_Adapter_AbstractAdapter {
	
	/**
	 * @var PayEngine3Cw_Entity_Transaction
	 */
	private $transaction = null;
	private $visibleFormFields = array();
	private $ajaxScriptUrl = null;
	private $javaScriptCallbackFunction = null;

	public function getPaymentAdapterInterfaceName() {
		return 'Customweb_Payment_Authorization_Ajax_IAdapter';
	}
	
	/**
	 * @return Customweb_Payment_Authorization_Ajax_IAdapter
	 */
	public function getInterfaceAdapter() {
		return parent::getInterfaceAdapter();
	}
	
	protected function preparePaymentFormPane() {
		$this->transaction = $this->createNewTransaction();
		$this->visibleFormFields = $this->getInterfaceAdapter()->getVisibleFormFields(
			$this->getOrderContext(),
			$this->getAliasTransactionObject(),
			$this->getFailedTransactionObject(),
			$this->transaction->getTransactionObject()->getPaymentCustomerContext()
		);
		$this->ajaxScriptUrl = $this->getInterfaceAdapter()->getAjaxFileUrl($this->transaction->getTransactionObject());
		$this->javaScriptCallbackFunction = $this->getInterfaceAdapter()->getJavaScriptCallbackFunction($this->transaction->getTransactionObject());
		PayEngine3Cw_Util::getEntityManager()->persist($this->transaction);
	}
	
	protected function getPaymentFormPane() {
	
		$this->preparePaymentFormPane();
	
		$output = '<div id="payengine3cw-checkout-form-pane">';
		
		$output .= '<script src="' . $this->ajaxScriptUrl . '"></script>';
		
		$output .= '<script type="text/javascript">';
		$output .= "\n var payengine3cw_ajax_submit_callback = " . $this->javaScriptCallbackFunction . ";\n";
		$output .= '</script>';
		
		$output .= '<form id="payengine3cw-confirmation-ajax-authorization-form" class="payengine3cw-confirmation-form  form-horizontal">';
	
		$visibleFormFields = $this->getVisibleFormFields();
		if ($visibleFormFields !== null && count($visibleFormFields) > 0) {
			$renderer = new PayEngine3Cw_Form_FrontendRenderer();
			$renderer->setCssClassPrefix('payengine3cw-');
			$output .= $renderer->renderElements($visibleFormFields);
		}
	
		$output .= '</form>';
		
		$output .= $this->getOrderConfirmationButton();
	
		$output .= '</div>';
	
		return $output;
	}
	
	protected function getVisibleFormFields() {
		return $this->visibleFormFields;
	}
		
}
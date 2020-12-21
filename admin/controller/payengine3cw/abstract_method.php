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

require_once DIR_SYSTEM . '/library/cw/PayEngine3Cw/init.php';


require_once 'PayEngine3Cw/Language.php';
require_once 'PayEngine3Cw/Util.php';
require_once 'PayEngine3Cw/IPaymentMethodDefinition.php';
require_once 'PayEngine3Cw/Entity/Transaction.php';
require_once 'PayEngine3Cw/PaymentMethod.php';
require_once 'PayEngine3Cw/AbstractController.php';


abstract class ControllerPaymentPayEngine3CwAbstract extends PayEngine3Cw_AbstractController implements PayEngine3Cw_IPaymentMethodDefinition
{
	protected function getModuleBasePath() {
		return 'payment/payengine3cw';
	}
	
	protected function getModuleParentPath() {
		return 'extension/payment';
	}
	
	
	public function index() {
		$data = array();
		$this->load->model('payengine3cw/setting');
		$paymentMethod = new PayEngine3Cw_PaymentMethod($this);

		// Store the configuration
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_payengine3cw_setting->saveSettings($paymentMethod->getSettingsApi(), $this->request->post);
			$data['success'] = PayEngine3Cw_Language::_("Save was successful.");
		}

		$this->document->addStyle('view/stylesheet/payengine3cw.css');
		$this->document->addScript('view/javascript/payengine3cw.js');


		$heading = PayEngine3Cw_Language::_("Configurations for !method (Concardis PayEngine 3.0)", array('!method' => $paymentMethod->getPaymentMethodDisplayName()));
		$this->document->setTitle($heading);

		
		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => PayEngine3Cw_Language::_('Modules'),
			'href'      => $this->url->link($this->getModuleParentPath(), 'type=payment&token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
			'text'      => $heading,
			'href'      => $this->url->link($this->getModuleBasePath() . $this->code, 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);


		$data['more_link'] = $this->url->link($this->getModuleBasePath() . '/form_overview', 'token=' . $this->session->data['token'], 'SSL');
		$data['heading_title'] = $heading;
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');


		$data['action'] = $this->url->link($this->getModuleBasePath() . '_' . strtolower($paymentMethod->getPaymentMethodName()), 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link($this->getModuleParentPath(), 'type=payment&token=' . $this->session->data['token'], 'SSL');

		$data['tabs'] = $this->model_payengine3cw_setting->renderStoreTabs($this->url->link($this->getModuleBasePath() . '_'  . strtolower($paymentMethod->getPaymentMethodName()), 'token=' . $this->session->data['token'], 'SSL'));
		$data['form'] = $this->model_payengine3cw_setting->render($paymentMethod->getSettingsApi());
		$data['text_edit'] = $heading;

		if (version_compare(VERSION, '2.0.0.0') >= 0) {
			$this->document->addScript('view/javascript/bootstrap-tab.min.js');
		}
		
		$this->response->setOutput($this->renderView('payengine3cw/settings.tpl', $data, array(
			'common/header',
			'common/footer',
		)));
	}

	public function install() {
		PayEngine3Cw_Util::migrate();
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/payengine3cw')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function orderAction() {
		$orderId = $this->request->get['order_id'];

		$transactions = PayEngine3Cw_Entity_Transaction::getTransactionsByOrderId($orderId);

		$data = array();
		$data['transactions'] = $transactions;
		$this->response->setOutput($this->renderView('payengine3cw/order_form.tpl', $data));
	}

}
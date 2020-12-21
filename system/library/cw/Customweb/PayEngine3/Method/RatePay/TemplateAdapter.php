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

require_once 'Customweb/Mvc/Template/RenderContext.php';
require_once 'Customweb/Util/Currency.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/Mvc/Template/SecurityPolicy.php';
require_once 'Customweb/Mvc/Layout/RenderContext.php';
require_once 'Customweb/PayEngine3/Adapter.php';
require_once 'Customweb/Core/Http/Response.php';


/**
 *
 * @author Sebastian Bossert
 *
 */
class Customweb_PayEngine3_Method_RatePay_TemplateAdapter extends Customweb_PayEngine3_Adapter {
	const BOOTSTRAP_CDN = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css";

	/**
	 * Customweb_Mvc_Template_RenderContext
	 *
	 * @param array $reqParameters
	 * @return Customweb_Mvc_Template_RenderContext
	 */
	private function prepareTemplateContext(Customweb_Payment_Authorization_IOrderContext $orderContext, $rateId, $rateTypeId, $ibanId, $bicId, $mandateId){
		$assetResolver = $this->getContainer()->getBean('Customweb_Asset_IResolver');
		/* @var $assetResolver Customweb_Asset_IResolver */
		$templateContext = new Customweb_Mvc_Template_RenderContext();
		
		$securityPolicy = new Customweb_Mvc_Template_SecurityPolicy();
		$templateContext->setSecurityPolicy($securityPolicy);
		
		$templateContext->addVariable('calculate_text', Customweb_I18n_Translation::__('Calculate rate'));
		$templateContext->addVariable('calculated_rates_text', Customweb_I18n_Translation::__('Personally calculated rates'));
		$templateContext->addVariable('warning_conditions',
				(string) Customweb_I18n_Translation::__(
						'The desired rate corresponds to the given conditions.<br/>The installment calculation may derivate from the installment plan.'));
		$templateContext->addVariable('show_rates_text', Customweb_I18n_Translation::__('Show rate calculations'));
		$templateContext->addVariable('hide_rates_text', Customweb_I18n_Translation::__('Hide rate calculations'));
		
		$templateContext->addVariable('total_purchase_amount_title', Customweb_I18n_Translation::__('Purchase amount'));
		$templateContext->addVariable('total_purchase_amount_description',
				Customweb_I18n_Translation::__('Sum of all cart items, the purchase amount.'));
		$templateContext->addVariable('contract_fee_title', Customweb_I18n_Translation::__('Signing fee'));
		$templateContext->addVariable('contract_fee_description',
				Customweb_I18n_Translation::__('Fee which applies to all installment plans, applied once per order.'));
		$templateContext->addVariable('annual_rate_title', Customweb_I18n_Translation::__('Effective annual rate'));
		$templateContext->addVariable('annual_rate_description', Customweb_I18n_Translation::__('Total cost of the credit as annual percentage.'));
		$templateContext->addVariable('monthly_debit_interest_title', Customweb_I18n_Translation::__('Debit interest rate p.a. (bound)')); // Sollzinssatz p.a. (gebunden)
		$templateContext->addVariable('monthly_debit_interest_description',
				Customweb_I18n_Translation::__('Periodic percentage applied to the loan taken.'));
		$templateContext->addVariable('interest_amount_title', Customweb_I18n_Translation::__('Interest amount')); // Sollzinssatz p.a. (gebunden)
		$templateContext->addVariable('interest_amount_description',
				Customweb_I18n_Translation::__('Concrete amount of money resulting from the interest.'));
		
		$templateContext->addVariable('monthly_rate_title', Customweb_I18n_Translation::__('1.-{n-1}. monthly rate each'));
		$templateContext->addVariable('monthly_rate_description', Customweb_I18n_Translation::__('Rate due each month.'));
		$templateContext->addVariable('last_rate_title', Customweb_I18n_Translation::__('{n}. monthly rate'));
		$templateContext->addVariable('last_rate_description', Customweb_I18n_Translation::__('The rate due in the last month.'));
		$templateContext->addVariable('all_monthly_rate_title', Customweb_I18n_Translation::__('{n} monthly rates each'));
		$templateContext->addVariable('total_amount_title', Customweb_I18n_Translation::__('Total'));
		$templateContext->addVariable('total_amount_description',
				Customweb_I18n_Translation::__('The total including the initial order, signing fee and interest.'));
		
		$templateContext->addVariable('icon_shrink', $this->getContainer()->getAssetResolver()->resolveAssetUrl('icon_shrink.png'));
		$templateContext->addVariable('icon_enlarge', $this->getContainer()->getAssetResolver()->resolveAssetUrl('icon_enlarge.png'));
		
		$templateContext->addVariable('loading_text', Customweb_I18n_Translation::__('Loading...'));
		$templateContext->addVariable('error_connection',
				Customweb_I18n_Translation::__('There was an error with your connection, please try again later.'));
		$templateContext->addVariable('choice_text', Customweb_I18n_Translation::__('Please choose between the two options'));
		$templateContext->addVariable('runtime_text', Customweb_I18n_Translation::__('Duration'));
		$templateContext->addVariable('monthly_text', Customweb_I18n_Translation::__('Monthly rate'));
		$templateContext->addVariable('amount_text', Customweb_I18n_Translation::__('Order amount'));
		$templateContext->addVariable('interest_amount_text', Customweb_I18n_Translation::__('Interest amount'));
		$templateContext->addVariable('service_charge_text', Customweb_I18n_Translation::__('Service charge'));
		$templateContext->addVariable('interest_text', Customweb_I18n_Translation::__('Interest rate'));
		$templateContext->addVariable('annual_percentage_text', Customweb_I18n_Translation::__('Annual percentage rate'));
		$templateContext->addVariable('monthly_debit_interest_text', Customweb_I18n_Translation::__('Monthly debit interest'));
		$templateContext->addVariable('total_text', Customweb_I18n_Translation::__('Total amount'));
		$templateContext->addVariable('last_rate_text', Customweb_I18n_Translation::__('Last rate'));
		$templateContext->addVariable('maxtime_error', Customweb_I18n_Translation::__('The maximum run time in months is: '));
		$templateContext->addVariable('mintime_error', Customweb_I18n_Translation::__('The minimum run time in months is: '));
		$templateContext->addVariable('minrate_error', Customweb_I18n_Translation::__('The minimum rate per month is: '));
		$templateContext->addVariable('rate_required_error', Customweb_I18n_Translation::__('Please enter a valid rate.'));
		$templateContext->addVariable('month_required_error', Customweb_I18n_Translation::__('Please enter a valid run time.'));
		$templateContext->addVariable('currency_symbol', $this->getCurrencySymbol($orderContext->getCurrencyCode()));
		$templateContext->addVariable('calculate_rate_text', Customweb_I18n_Translation::__("Calculate rates"));
		
		$templateContext->addVariable('publishable_key', $this->getContainer()->getConfiguration()->getMerchantId());
		
		$templateContext->addVariable('initial_amount',
				Customweb_Util_Currency::formatAmount($orderContext->getOrderAmountInDecimals(), $orderContext->getCurrencyCode(), ''));
		
		$templateContext->addVariable('label_debit', Customweb_I18n_Translation::__("Debit"));
		$templateContext->addVariable('label_invoice', Customweb_I18n_Translation::__("Transfer"));
		$templateContext->addVariable('label_iban', Customweb_I18n_Translation::__("IBAN"));
		$templateContext->addVariable('label_bic', Customweb_I18n_Translation::__("BIC (Optional)"));
		$templateContext->addVariable('text_mandate', $this->getMandateText());
		$templateContext->addVariable('subtext_mandate', $this->getMandateSubtext());
		$templateContext->addVariable('instruction_mandate', $this->getMandateInstruction());
		
		// control ids for transmission
		$templateContext->addVariable('rate_type_control_id', $rateTypeId);
		$templateContext->addVariable('iban_control_id', $ibanId);
		$templateContext->addVariable('bic_control_id', $bicId);
		$templateContext->addVariable('mandate_control_id', $mandateId);
		$templateContext->addVariable('rate_result_control_id', $rateId);
		
		// additional assets
		$templateContext->addVariable('cssUrl', $assetResolver->resolveAssetUrl('ratepay_calculator.css')->toString());
		$templateContext->addVariable('calculatorJs', $assetResolver->resolveAssetUrl('ratepay_calculator.js')->toString());
		$templateContext->addVariable('ratepayJs', $this->getContainer()->getConfiguration()->getBaseJavascriptUrl());
		
		$templateContext->setTemplate('ratepay_calculator');
		
		return $templateContext;
	}

	private function getMandateText(){
		return Customweb_I18n_Translation::__(
				"Ich ermächtige die Wirecard Bank AG von meinem Konto mittels Lastschrift einzuziehen.
Zugleich weise ich mein Kreditinstitut an, die von der Wirecard Bank AG auf mein Konto
gezogenen Lastschriften einzulösen.
<br/>Hinweis:<br/> Ich kann innerhalb von acht Wochen, beginnend mit dem Belastungsdatum, die
Erstattung des belasteten Betrages verlangen.
Es gelten dabei die mit dem Kreditinstitut vereinbarten Bedingungen")->toString();
		// TODO english text once available
	}

	private function getMandateInstruction() {
		return Customweb_I18n_Translation::__("Please enter your Bank account for the automatic monthly debit on the 2. of the calender month. If this day falls on a sunday or holiday, the debit is processed on the next workday.");
	}
	
	private function getMandateSubtext(){
		$company = Customweb_I18n_Translation::__("Wirecard Bank AG, Einsteinring 35, 85609 Aschheim")->toString();
		$creditor = Customweb_I18n_Translation::__("@title: @content",
				array(
					'@title' => Customweb_I18n_Translation::__("Creditor ID")->toString(),
					'@content' => Customweb_I18n_Translation::__("DE49ZZZ00000002773")->toString() 
				))->toString();
		$reference = Customweb_I18n_Translation::__("@title: @content",
				array(
					'@title' => Customweb_I18n_Translation::__("Mandate Reference")->toString(),
					'@content' => Customweb_I18n_Translation::__("The mandate reference will be transmitted after order completion.")->toString() 
				))->toString();
		return Customweb_I18n_Translation::__("@company<br/>@creditor<br/><br/>@reference",
				array(
					'@company' => $company,
					'@creditor' => $creditor,
					'@reference' => $reference 
				));
	}

	private function getCurrencySymbol($currencyCode){
		switch ($currencyCode) {
			case 'EUR':
				return '€';
			case 'USD':
				return '$';
			case 'AUD':
				return '$';
			case 'GBP':
				return '£';
			case 'JPY':
				return '¥';
			default:
				return $currencyCode;
		}
	}

	private function prepareLayoutContext(Customweb_Payment_Authorization_IOrderContext $orderContext){
		$assetResolver = $this->getContainer()->getBean('Customweb_Asset_IResolver');
		/* @var $assetResolver Customweb_Asset_IResolver */
		$templateRenderer = $this->getContainer()->getBean('Customweb_Mvc_Template_IRenderer');
		/* @var $templateRenderer Customweb_Mvc_Template_IRenderer */
		$templateContext = $this->prepareTemplateContext($orderContext);
		
		$layoutContext = new Customweb_Mvc_Layout_RenderContext();
		
		$layoutContext->addCssFile($assetResolver->resolveAssetUrl('ratepay_calculator.css')->toString());
		
		$layoutContext->addJavascriptFile($assetResolver->resolveAssetUrl('ratepay_calculator.js')->toString());
		$layoutContext->addJavascriptFile($this->getContainer()->getConfiguration()->getBaseJavascriptUrl());
		$layoutContext->setTitle(Customweb_I18n_Translation::__("Ratepay instalment calculator"));
		$layoutContext->setMainContent($templateRenderer->render($templateContext));
		
		return $layoutContext;
	}

	public function renderHtml(Customweb_Payment_Authorization_IOrderContext $orderContext, $rateId, $rateTypeId, $ibanId, $bicId, $mandateId){
		$templateRenderer = $this->getContainer()->getBean('Customweb_Mvc_Template_IRenderer');
		/* @var $templateRenderer Customweb_Mvc_Template_IRenderer */
		$templateContext = $this->prepareTemplateContext($orderContext, $rateId, $rateTypeId, $ibanId, $bicId, $mandateId);
		
		return $templateRenderer->render($templateContext);
	}

	public function render(Customweb_Payment_Authorization_IOrderContext $orderContext){
		$layoutRenderer = $this->getContainer()->getBean('Customweb_Mvc_Layout_IRenderer');
		/* @var $layoutRenderer Customweb_Mvc_Layout_IRenderer */
		$context = $this->prepareLayoutContext($orderContext);
		return Customweb_Core_Http_Response::_($layoutRenderer->render($context));
	}
}
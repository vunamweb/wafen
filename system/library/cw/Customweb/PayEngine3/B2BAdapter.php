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

require_once 'Customweb/Form/Element.php';
require_once 'Customweb/Form/Validator/NotEmpty.php';
require_once 'Customweb/I18n/Translation.php';
require_once 'Customweb/Form/Control/Select.php';
require_once 'Customweb/Form/Control/TextInput.php';
require_once 'Customweb/PayEngine3/Adapter.php';


/**
 * @author Sebastian Bossert
 * @Bean
 */
class Customweb_PayEngine3_B2BAdapter extends Customweb_PayEngine3_Adapter {
	private $companyTypes;
	const CUSTOMER_TYPE = 'M';

	public function isB2B(Customweb_Payment_Authorization_IOrderContext $orderContext){
		$company = $orderContext->getBillingAddress()->getCompanyName();
		return !empty($company) || $orderContext->getBillingAddress()->getGender() == 'company';
	}

	public function getPayload(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$parameters = array(
			'customerType' => 'organization',
			'companyName' => $this->getCompanyName($transaction)
		);
		$type = $this->getOrganizationEntityType($transaction);
		if ($type) {
			$parameters['organizationEntityType'] = $type;
		}
		$vatId = $this->getOrganizationVatId($transaction);
		if ($vatId) {
			$parameters['organizationVatId'] = $vatId;
		}
		$regId = $this->getOrganizationRegistrationId($transaction);
		if ($regId) {
			$parameters['organizationRegistrationId'] = $regId;
		}
		return $parameters;
	}

	public function getVisibleFormFields(Customweb_Payment_Authorization_IOrderContext $orderContext, Customweb_Payment_Authorization_IPaymentCustomerContext $paymentContext){
		$fields = array();
		$previous = $paymentContext->getMap();
		$value = $orderContext->getBillingAddress()->getCompanyName();
		if (empty($value)) {
			$fields[] = $this->getTextControl('payengine3-company-name', Customweb_I18n_Translation::__("Company Name"), $previous);
		}
		$value = $orderContext->getBillingAddress()->getCommercialRegisterNumber();
		if (empty($value)) {
			$fields[] = $this->getTextControl('payengine3-organization-registration-id',
					Customweb_I18n_Translation::__("Organization Registration ID"), $previous, false);
		}
		$value = $orderContext->getBillingAddress()->getSalesTaxNumber();
		if (empty($value)) {
			$fields[] = $this->getTextControl('payengine3-organization-vat-id', Customweb_I18n_Translation::__("VAT ID"), $previous, false);
		}

		$fields[] = $this->getCompanyTypeField($orderContext, $previous);
		return $fields;
	}

	private function getCompanyTypeField(Customweb_Payment_Authorization_IOrderContext $orderContext, array $previous){
		$default = '';
		if (isset($previous['payengine3-organization-entity-type'])) {
			$default = $previous['payengine3-organization-entity-type'];
		}
		$options = $this->getCompanyTypesForCountry($orderContext->getBillingAddress()->getCountryIsoCode());
		$control = new Customweb_Form_Control_Select('payengine3-organization-entity-type', $options, $default);
		$control->setRequired(false);
		$element = new Customweb_Form_Element(Customweb_I18n_Translation::__("Organization Entity Type"), $control);
		$element->setRequired(false);
		return $element;
	}

	public function getOrganizationVatId(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$value = $transaction->getTransactionContext()->getOrderContext()->getBillingAddress()->getSalesTaxNumber();
		if (empty($value)) {
			$value = $transaction->getFormDataByIndex('payengine3-organization-vat-id');
		}
		return $value;
	}

	public function getOrganizationRegistrationId(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$value = $transaction->getTransactionContext()->getOrderContext()->getBillingAddress()->getCommercialRegisterNumber();
		if (empty($value)) {
			$value = $transaction->getFormDataByIndex('payengine3-organization-registration-id');
		}
		return $value;
	}

	public function getOrganizationEntityType(Customweb_PayEngine3_Authorization_Transaction $transaction){
		return $transaction->getFormDataByIndex('payengine3-organization-entity-type');
	}

	public function getCompanyName(Customweb_PayEngine3_Authorization_Transaction $transaction){
		$value = $transaction->getTransactionContext()->getOrderContext()->getBillingAddress()->getCompanyName();
		if (empty($value)) {
			$value = $transaction->getFormDataByIndex('payengine3-company-name');
		}
		return $value;
	}

	// 	public function getOrganizationRegistrationRegister() { }
	private function getTextControl($name, $label, array $previous, $required = true){
		$default = '';
		if (isset($previous[$name])) {
			$default = $previous[$name];
		}
		$control = new Customweb_Form_Control_TextInput($name, $default);
		if ($required) {
			$control->addValidator(
					new Customweb_Form_Validator_NotEmpty($control,
							Customweb_I18n_Translation::__("Please enter a value for '@label'.", array(
								'@label' => $label
							))));
		}
		$control->setRequired($required);
		$element = new Customweb_Form_Element($label, $control);
		$element->setRequired($required);
		return $element;
	}

	private function getCompanyTypesForCountry($country){
		$types = array(
			'' => Customweb_I18n_Translation::__(' - ')
		);
		foreach ($this->getCompanyTypes() as $companyType) {
			if (in_array($country, $companyType['countries'])) {
				$types[$companyType['code']] = $companyType['name'];
			}
		}
		return $types;
	}

	private function getCompanyTypes(){
		if ($this->companyTypes === null) {
			$this->companyTypes = array(
				array(
					'code' => 'AG',
					'name' => Customweb_I18n_Translation::__("Aktiengesellschaft"),
					'countries' => array(
						'AT',
						'CH',
						'DE'
					)
				),
				array(
					'code' => 'AOR',
					'name' => Customweb_I18n_Translation::__("Anstalt öffentlichen Rechts"),
					'countries' => array(
						'DE'
					)
				),
				array(
					'code' => 'EG',
					'name' => Customweb_I18n_Translation::__("Eingetragene Genossenschaft"),
					'countries' => array(
						'DE'
					)
				),
				array(
					'code' => 'EINFACHE-GESELLSCHAFT',
					'name' => Customweb_I18n_Translation::__("Einfache Gesellschaft"),
					'countries' => array(
						'CH'
					)
				),
				array(
					'code' => 'AOR',
					'name' => Customweb_I18n_Translation::__("Anstalt öffentlichen Rechts"),
					'countries' => array(
						'DE'
					)
				),
				array(
					'code' => 'CH_EINZELUNTERNEHMER',
					'name' => Customweb_I18n_Translation::__("Einzelunternehmen"),
					'countries' => array(
						'CH'
					)
				),
				array(
					'code' => 'EINZELUNTERNEHMER',
					'name' => Customweb_I18n_Translation::__("Einzelunternehmen"),
					'countries' => array(
						'AT',
						'DE'
					)
				),
				array(
					'code' => 'EK',
					'name' => Customweb_I18n_Translation::__("Eingetragener Kaufmann"),
					'countries' => array(
						'DE'
					)
				),
				array(
					'code' => 'GBR',
					'name' => Customweb_I18n_Translation::__("Gesellschaft bürgerlichen Rechts"),
					'countries' => array(
						'AT',
						'DE'
					)
				),
				array(
					'code' => 'GGMBH',
					'name' => Customweb_I18n_Translation::__("Gemeinnützige Gesellschaft mit beschränkter Haftung"),
					'countries' => array(
						'DE'
					)
				),
				array(
					'code' => 'GMBH',
					'name' => Customweb_I18n_Translation::__("Gesellschaft mit beschränkter Haftung"),
					'countries' => array(
						'AT',
						'CH',
						'DE'
					)
				),
				array(
					'code' => 'GMBH-CO-KG',
					'name' => Customweb_I18n_Translation::__("Gesellschaft mit beschränkter Haftung & Compagnie Kommanditgesellschaft"),
					'countries' => array(
						'AT',
						'DE'
					)
				),
				array(
					'code' => 'GMBH-I-GR',
					'name' => Customweb_I18n_Translation::__("Gesellschaft mit beschränkter Haftung in Gründung"),
					'countries' => array(
						'DE'
					)
				),
				array(
					'code' => 'KEG',
					'name' => Customweb_I18n_Translation::__("Kommanditerwerbsgesellschaft"),
					'countries' => array(
						'AT'
					)
				),
				array(
					'code' => 'KG',
					'name' => Customweb_I18n_Translation::__("Kommanditgesellschaft"),
					'countries' => array(
						'AT',
						'CH',
						'DE'
					)
				),
				array(
					'code' => 'KOLLEKTIVGESELLSCHAFT',
					'name' => Customweb_I18n_Translation::__("Kollektivgesellschaft"),
					'countries' => array(
						'CH'
					)
				),
				array(
					'code' => 'KOR',
					'name' => Customweb_I18n_Translation::__("Körperschaft öffentlichen Rechts"),
					'countries' => array(
						'DE'
					)
				),
				array(
					'code' => 'OEG',
					'name' => Customweb_I18n_Translation::__("Offene Erwerbsgesellschaft"),
					'countries' => array(
						'AT'
					)
				),
				array(
					'code' => 'OG',
					'name' => Customweb_I18n_Translation::__("Offene Gesellschaft"),
					'countries' => array(
						'AT'
					)
				),
				array(
					'code' => 'OHG',
					'name' => Customweb_I18n_Translation::__("Offene Handelsgesellschaft"),
					'countries' => array(
						'AT',
						'DE'
					)
				),
				array(
					'code' => 'OTHER',
					'name' => Customweb_I18n_Translation::__("Alle anderen Gesellschaftsformen"),
					'countries' => array(
						'AT',
						'BE',
						'HR',
						'BG',
						'CY',
						'CZ',
						'DK',
						'EE',
						'FI',
						'FR',
						'DE',
						'GR',
						'HU',
						'IE',
						'IT',
						'LV',
						'LT',
						'LU',
						'MT',
						'NL',
						'PL',
						'PT',
						'RO',
						'SK',
						'SI',
						'ES',
						'SE',
						'GB'
					)
				),
				array(
					'code' => 'PARTNERSCHAFT',
					'name' => Customweb_I18n_Translation::__("Partnerschaft"),
					'countries' => array(
						'DE'
					)
				),
				array(
					'code' => 'SC',
					'name' => Customweb_I18n_Translation::__("Europäische Genossenschaft"),
					'countries' => array(
						'AT',
						'BE',
						'HR',
						'BG',
						'CY',
						'CZ',
						'DK',
						'EE',
						'FI',
						'FR',
						'DE',
						'GR',
						'HU',
						'IE',
						'IT',
						'LV',
						'LT',
						'LU',
						'MT',
						'NL',
						'PL',
						'PT',
						'RO',
						'SK',
						'SI',
						'ES',
						'SE',
						'GB'
					)
				),
				array(
					'code' => 'SE',
					'name' => Customweb_I18n_Translation::__("Europäische Gesellschaft"),
					'countries' => array(
						'AT',
						'BE',
						'HR',
						'BG',
						'CY',
						'CZ',
						'DK',
						'EE',
						'FI',
						'FR',
						'DE',
						'GR',
						'HU',
						'IE',
						'IT',
						'LV',
						'LT',
						'LU',
						'MT',
						'NL',
						'PL',
						'PT',
						'RO',
						'SK',
						'SI',
						'ES',
						'SE',
						'GB'
					)
				),
				array(
					'code' => 'STIFTUNG',
					'name' => Customweb_I18n_Translation::__("Stiftung"),
					'countries' => array(
						'DE'
					)
				),
				array(
					'code' => 'UG',
					'name' => Customweb_I18n_Translation::__("Unternehmergesellschaft"),
					'countries' => array(
						'DE'
					)
				),
				array(
					'code' => 'UG-I-GR',
					'name' => Customweb_I18n_Translation::__("Unternehmergesellschaft in Gründung"),
					'countries' => array(
						'DE'
					)
				)
			);
		}
		return $this->companyTypes;
	}
}

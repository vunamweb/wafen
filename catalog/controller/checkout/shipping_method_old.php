<?php
class ControllerCheckoutShippingMethod extends Controller {
	public function index() {
		$this->load->language('checkout/checkout');

		if (isset($this->session->data['shipping_address'])) {
			// Shipping Methods
			$method_data = array();
            //get total order
            $products = $this->cart->getProducts();
            $total_check=0;
    		foreach ($products as $product) {
    			$product_total = 0;
                 
    			foreach ($products as $product_2) {
    				if ($product_2['product_id'] == $product['product_id']) {
    					$product_total += $product_2['quantity'];
                        $total_check += $product_2['quantity']*$product_2['price'];
                        
    				}
    			}
                 
    			if ($product['minimum'] > $product_total) {
    				$this->response->redirect($this->url->link('checkout/cart'));
    			}
    		}
            //end
            //print_r($this->session->data['payment_address']['country']);
			$this->load->model('extension/extension');

			$results = $this->model_extension_extension->getExtensions('shipping');
            //print_r($results);
			foreach ($results as $result) {
				//if is germany
                if($this->session->data['payment_address']['country']=='Germany')
                {
                    if($total_check>100)
                    {
                        if($result['extension_id']==34)
                        {
                            if ($this->config->get($result['code'] . '_status')) {
                					$this->load->model('extension/shipping/' . $result['code']);
                
                					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);
                
                					if ($quote) {
                						$method_data[$result['code']] = array(
                							'title'      => $quote['title'],
                							'quote'      => $quote['quote'],
                							'sort_order' => $quote['sort_order'],
                							'error'      => $quote['error']
                						);
                					}
				            }
                        }
                    }
                    else
                    {
                        if($result['extension_id']!=34)
                        {
                            if ($this->config->get($result['code'] . '_status')) {
                					$this->load->model('extension/shipping/' . $result['code']);
                
                					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);
                
                					if ($quote) {
                						$method_data[$result['code']] = array(
                							'title'      => $quote['title'],
                							'quote'      => $quote['quote'],
                							'sort_order' => $quote['sort_order'],
                							'error'      => $quote['error']
                						);
                					}
				            }
                        }
                    }
                }
                else
                {
                    if($total_check>200)
                    {
                        if($result['extension_id']==34)
                        {
                            if ($this->config->get($result['code'] . '_status')) {
                					$this->load->model('extension/shipping/' . $result['code']);
                
                					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);
                
                					if ($quote) {
                						$method_data[$result['code']] = array(
                							'title'      => $quote['title'],
                							'quote'      => $quote['quote'],
                							'sort_order' => $quote['sort_order'],
                							'error'      => $quote['error']
                						);
                					}
				            }
                        }
                    }
                    else
                    {
                        if($result['extension_id']!=34)
                        {
                            if ($this->config->get($result['code'] . '_status')) {
                					$this->load->model('extension/shipping/' . $result['code']);
                
                					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);
                
                					if ($quote) {
                						$method_data[$result['code']] = array(
                							'title'      => $quote['title'],
                							'quote'      => $quote['quote'],
                							'sort_order' => $quote['sort_order'],
                							'error'      => $quote['error']
                						);
                					}
				            }
                        }
                    }
                }
                
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);
            //print_r($method_data);
			$method_data['weight']['title']='';
            if(isset($method_data['weight']['quote']['weight_4']['title']))
              $method_data['weight']['quote']['weight_4']['title']='Deutschland';
            if(isset($method_data['weight']['quote']['weight_3']['title']))
              $method_data['weight']['quote']['weight_3']['title']='Out Deutschland';
            //$method_data['weight']['quote']['weight_5']['title']='Deutschland';
			$this->session->data['shipping_methods'] = $method_data;
		}

		$data['text_shipping_method'] = $this->language->get('text_shipping_method');
		$data['text_comments'] = $this->language->get('text_comments');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['button_continue'] = $this->language->get('button_continue');

		if (empty($this->session->data['shipping_methods'])) {
			$data['error_warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['shipping_methods'])) {
			$data['shipping_methods'] = $this->session->data['shipping_methods'];
		} else {
			$data['shipping_methods'] = array();
		}

		if (isset($this->session->data['shipping_method']['code'])) {
			$data['code'] = $this->session->data['shipping_method']['code'];
		} else {
			$data['code'] = '';
		}

		if (isset($this->session->data['comment'])) {
			$data['comment'] = $this->session->data['comment'];
		} else {
			$data['comment'] = '';
		}

		$this->response->setOutput($this->load->view('checkout/shipping_method', $data));
	}

	public function save() {
		$this->load->language('checkout/checkout');

		$json = array();

		// Validate if shipping is required. If not the customer should not have reached this page.
		if (!$this->cart->hasShipping()) {
			$json['redirect'] = $this->url->link('checkout/checkout', '', true);
		}

		// Validate if shipping address has been set.
		if (!isset($this->session->data['shipping_address'])) {
			$json['redirect'] = $this->url->link('checkout/checkout', '', true);
		}

		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');
		}

		// Validate minimum quantity requirements.
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$json['redirect'] = $this->url->link('checkout/cart');

				break;
			}
		}

		if (!isset($this->request->post['shipping_method'])) {
			$json['error']['warning'] = $this->language->get('error_shipping');
		} else {
			$shipping = explode('.', $this->request->post['shipping_method']);

			if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
				$json['error']['warning'] = $this->language->get('error_shipping');
			}
		}

		if (!$json) {
			$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];

			$this->session->data['comment'] = strip_tags($this->request->post['comment']);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
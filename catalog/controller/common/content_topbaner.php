<?php
class ControllerCommonContentTopbaner extends Controller {
	public function index() {
		$this->load->model('design/layout');

		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}

		$layout_id = 0;

		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$this->load->model('catalog/category');

			$path = explode('_', (string)$this->request->get['path']);

			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
		}

		if ($route == 'product/product' && isset($this->request->get['product_id'])) {
			$this->load->model('catalog/product');

			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}

		if ($route == 'information/information' && isset($this->request->get['information_id'])) {
			$this->load->model('catalog/information');

			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}

		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}

		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}

		$this->load->model('extension/module');

		$data['modules'] = array();

		$modules = $this->model_design_layout->getLayoutModules($layout_id, 'content_topban');
        //print_r($modules);//die();
        $count=0;
		foreach ($modules as $module) {
			$part = explode('.', $module['code']);
            //print_r($part);die();

			if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
				$module_data = $this->load->controller('extension/module/' . $part[0]);

				if ($module_data) {
					$data['modules'][] = $module_data;
				}
			}

			if (isset($part[1])) {
				$setting_info = $this->model_extension_module->getModule($part[1]);
                //print_r($setting_info['module_description'][2]['title']);//die();

				if ($setting_info && $setting_info['status']) {
					$output = $this->load->controller('extension/module/' . $part[0], $setting_info);
                    
					if ($output) {
						$data['modules'][$count]['description'] = $output;
                        $data['modules'][$count]['title'] = explode(';',$setting_info['module_description'][$this->config->get('config_language_id')]['title']);
                        $count++;
                        //$data['title_banner'][]=$setting_info['module_description'][1]['[title'];
					}
				}
			}
		}
        //print_r($data['modules']);die();
		return $this->load->view('common/content_topbaner', $data);
	}
}

<?php
class ControllerCommonSearch extends Controller {
	public function index() {

            	$this->load->language('product/search');
                $data['text_view_all_results'] = $this->language->get('text_view_all_results');
                $data['text_empty'] = $this->language->get('text_empty');
                $data['live_search_ajax_status'] = $this->config->get('live_search_ajax_status');
                $data['live_search_show_image'] = $this->config->get('live_search_show_image');
                $data['live_search_show_price'] = $this->config->get('live_search_show_price');
                $data['live_search_show_description'] = $this->config->get('live_search_show_description');
                $data['live_search_href'] = $this->url->link('product/search', 'search=');
            
		$this->load->language('common/search');

		$data['text_search'] = $this->language->get('text_search');

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}

		return $this->load->view('common/search', $data);
	}
}
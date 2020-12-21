<?php
class Url {
	private $url;
	private $ssl;
	private $rewrite = array();

	public function __construct($url, $ssl = '') {
		$this->url = $url;
		$this->ssl = $ssl;
	}
	
	public function addRewrite($rewrite) {
		$this->rewrite[] = $rewrite;
	}

	public function link($route, $args = '', $secure = false) {
		if ($this->ssl && $secure) {
			$url = $this->ssl . 'index.php?route=' . $route;
		} else {
			$url = $this->url . 'index.php?route=' . $route;
		}
		
		if ($args) {
			if (is_array($args)) {
				$url .= '&amp;' . http_build_query($args);
			} else {
				$url .= str_replace('&', '&amp;', '&' . ltrim($args, '&'));
			}
		}
		
		foreach ($this->rewrite as $rewrite) {
			$url = $rewrite->rewrite($url);
		}
		$url = str_replace('index.php?route=common/home', '', $url); 
        $url = str_replace('index.php?route=account/register', 'register', $url); 
        $url = str_replace('index.php?route=account/login', 'login', $url); 
        $url = str_replace('index.php?route=checkout/cart', 'cart', $url);
        $url = str_replace('index.php?route=checkout/checkout', 'checkout', $url);
		return $url; 
	}
}
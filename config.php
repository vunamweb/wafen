<?php
 function shutdown_cw_error_reporting() {
	$last_error = error_get_last();
	if ($last_error != NULL) {
		echo $last_error['message'] . ' on line ' . $last_error['line'] . ' in file ' . $last_error['file'];
	}
}

//register_shutdown_function('shutdown_cw_error_reporting');

// HTTP
define('HTTP_SERVER', 'http://localhost/wafen/');

// HTTPS
define('HTTPS_SERVER', 'http://localhost/wafen/');

// DIR
define('DIR_APPLICATION', 'C:/xampp_7/htdocs/wafen/catalog/');
define('DIR_SYSTEM', 'C:/xampp_7/htdocs/wafen/system/');
define('DIR_IMAGE', 'C:/xampp_7/htdocs/wafen/image/');
define('DIR_LANGUAGE', 'C:/xampp_7/htdocs/wafen/catalog/language/');
define('DIR_TEMPLATE', 'C:/xampp_7/htdocs/wafen/catalog/view/theme/');
define('DIR_CONFIG', 'C:/xampp_7/htdocs/wafen/system/config/');
define('DIR_CACHE', 'C:/xampp_7/htdocs/wafen/system/storage/cache/');
define('DIR_DOWNLOAD', 'C:/xampp_7/htdocs/wafen/system/storage/download/');
define('DIR_LOGS', 'C:/xampp_7/htdocs/wafen/system/storage/logs/');
define('DIR_MODIFICATION', 'C:/xampp_7/htdocs/wafen/system/storage/modification/');
define('DIR_UPLOAD', 'C:/xampp_7/htdocs/wafen/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'wafen');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');

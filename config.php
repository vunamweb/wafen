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
define('DIR_APPLICATION', '/Applications/XAMPP/xamppfiles/htdocs/wafen/catalog/');
define('DIR_SYSTEM', '/Applications/XAMPP/xamppfiles/htdocs/wafen/system/');
define('DIR_IMAGE', '/Applications/XAMPP/xamppfiles/htdocs/wafen/image/');
define('DIR_LANGUAGE', '/Applications/XAMPP/xamppfiles/htdocs/wafen/catalog/language/');
define('DIR_TEMPLATE', '/Applications/XAMPP/xamppfiles/htdocs/wafen/catalog/view/theme/');
define('DIR_CONFIG', '/Applications/XAMPP/xamppfiles/htdocs/wafen/system/config/');
define('DIR_CACHE', '/Applications/XAMPP/xamppfiles/htdocs/wafen/system/storage/cache/');
define('DIR_DOWNLOAD', '/Applications/XAMPP/xamppfiles/htdocs/wafen/system/storage/download/');
define('DIR_LOGS', '/Applications/XAMPP/xamppfiles/htdocs/wafen/system/storage/logs/');
define('DIR_MODIFICATION', '/Applications/XAMPP/xamppfiles/htdocs/wafen/system/storage/modification/');
define('DIR_UPLOAD', '/Applications/XAMPP/xamppfiles/htdocs/wafen/system/storage/upload/');
define('ADDITIONAL_SHIP', 50);

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'wafen');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');

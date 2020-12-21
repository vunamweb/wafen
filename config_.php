<?php
 function shutdown_cw_error_reporting() {
	$last_error = error_get_last();
	if ($last_error != NULL) {
		echo $last_error['message'] . ' on line ' . $last_error['line'] . ' in file ' . $last_error['file'];
	}
}

//register_shutdown_function('shutdown_cw_error_reporting');

// HTTP
define('HTTP_SERVER', 'https://www.temp20.waffen-bock.de/');

// HTTPS
define('HTTPS_SERVER', 'https://www.temp20.waffen-bock.de/');

// DIR
define('DIR_APPLICATION', '/kunden/475670_63667/waffen-bock.de/catalog/');
define('DIR_SYSTEM', '/kunden/475670_63667/waffen-bock.de/system/');
define('DIR_IMAGE', '/kunden/475670_63667/waffen-bock.de/image/');
define('DIR_LANGUAGE', '/kunden/475670_63667/waffen-bock.de/catalog/language/');
define('DIR_TEMPLATE', '/kunden/475670_63667/waffen-bock.de/catalog/view/theme/');
define('DIR_CONFIG', '/kunden/475670_63667/waffen-bock.de/system/config/');
define('DIR_CACHE', '/kunden/475670_63667/waffen-bock.de/system/storage/cache/');
define('DIR_DOWNLOAD', '/kunden/475670_63667/waffen-bock.de/system/storage/download/');
define('DIR_LOGS', '/kunden/475670_63667/waffen-bock.de/system/storage/logs/');
define('DIR_MODIFICATION', '/kunden/475670_63667/waffen-bock.de/system/storage/modification/');
define('DIR_UPLOAD', '/kunden/475670_63667/waffen-bock.de/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'mysql5.waffen-bock.de');
define('DB_USERNAME', 'db475670_30');
define('DB_PASSWORD', '10WaBo!20');
define('DB_DATABASE', 'db475670_30');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');

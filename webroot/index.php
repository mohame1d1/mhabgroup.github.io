<?php

 require_once ('loader.php');

 /*
==== WE ARE CHECKING IF YOUR VERSION HIGHER OR EQUAL TO 7.0.0.================//
== YOU CAN REMOVE THIS IF YOU ARE CONFIDENT THAT YOUR PHP VERSION IS SUFFICIENT.
*/
if (!version_compare(PHP_VERSION, '7.0.0', '>=')) {
    exit('Your PHP version must be equal or higher than 7.0.0 to use our script. Please ask your hosting company to update it.');
}

/*
=============== WE ARE CHECKING IF CURL EXTENTION IS ENABLED ================//
== YOU CAN REMOVE THIS IF YOU ARE CONFIDENT THAT YOUR PHP VERSION IS SUFFICIENT.
*/
if (!_is_curl_installed()) {
  exit ("cURL is NOT installed you need it to use our script, Please ask your hosting company to include it.");
    
}

/*
=============== WE ARE CHECKING IF OpenSSL EXTENTION IS ENABLED ==============//
== YOU CAN REMOVE THIS IF YOU ARE CONFIDENT THAT YOUR PHP VERSION IS SUFFICIENT.
*/
if (!extension_loaded('openssl')) {
 exit("OpenSSL is NOT installed, Please ask your hosting company to include it.");
}

 //testimonial
 $fun->do_testimonial('limit');
 //statistics
 $fun->do_home_statistics();

 show('Home/home');

?>
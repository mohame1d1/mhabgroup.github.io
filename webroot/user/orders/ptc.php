<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('PTC_ADS');
 $fun->do_orders();

 show('User/Orders/ptc');
?>
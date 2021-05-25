<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('ADVERTISING_DASHBOARD');
 $fun->do_advertiser_state();

 show('User/Orders/index');
?>
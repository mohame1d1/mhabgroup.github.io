<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Add Adcode');
 
 $fun->do_addcode();

 show('Admin/Ads/adcode');

?>
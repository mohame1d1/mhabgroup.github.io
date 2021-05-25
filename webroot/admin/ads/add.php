<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Add AD');
 
 $fun->do_addads();

 show('Admin/Ads/add');

?>
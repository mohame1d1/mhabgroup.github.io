<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('Edit AD #'.$_GET['id']);

 $fun->do_updata('ads');

 $fun->do_upads();
 
 show('Admin/Ads/edit');

?>
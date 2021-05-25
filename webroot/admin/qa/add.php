<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Add QA');

 $fun->do_addqa();

 show('Admin/Qa/add');

?>
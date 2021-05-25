<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Add Shortlinks');

 $fun->do_addshort();

 show('Admin/Shortlinks/add');

?>
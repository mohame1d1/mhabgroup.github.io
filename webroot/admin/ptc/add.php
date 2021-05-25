<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Add PTC');

 $fun->do_addptc();

 show('Admin/Ptc/add');

?>
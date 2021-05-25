<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('QA');

 $fun->do_qa();

 $fun->do_activate('qa','qa/index');

 $fun->do_deactivate('qa','qa/index');

 $fun->do_delete('qa','qa/index');

 show('Admin/Qa/index');

?>
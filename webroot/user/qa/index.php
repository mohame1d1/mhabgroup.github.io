<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('QA');
 $fun->do_qalist();
 
 show('User/Qa/index');
?>
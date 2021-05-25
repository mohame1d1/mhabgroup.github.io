<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('SHORTLINKS');
 $fun->do_shortlinks();
 $fun->do_shortverify();
 
 show('User/Shortlinks/index');
?>
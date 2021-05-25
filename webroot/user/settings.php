<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('SETTINGS');
 $fun->do_setuser('personal');
 
 show('User/Settings/index');
?>
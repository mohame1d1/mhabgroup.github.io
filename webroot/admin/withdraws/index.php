<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('Withdraws');

 $fun->do_withdraws();

 show('Admin/Withdraws/index');
 
?>
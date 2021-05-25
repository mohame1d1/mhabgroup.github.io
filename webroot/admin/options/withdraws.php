<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Withdrawals options');
 $fun->do_upwithdraw();

 show('Admin/Options/withdraws');
 
?>
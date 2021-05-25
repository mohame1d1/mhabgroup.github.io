<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('LATEST_WITHDRAWALS');
 $fun->do_withdraws();

 show('User/Info/withdrawals');
 
?>
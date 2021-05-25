<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('WITHDRAWALS_HISTORY');
 $fun->do_withdraws(true);

 show('User/Withdraw/withdraws');
 
?>
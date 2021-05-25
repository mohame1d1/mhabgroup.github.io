<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('WITHDRAW');
 $fun->do_withdraw();

 show('User/Withdraw/index');
 
?>
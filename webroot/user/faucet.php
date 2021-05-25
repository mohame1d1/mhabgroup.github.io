<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('FAUCET');
 $fun->do_fctverify();
 $fun->do_fctclaim();

 show('User/Faucet/index');
?>
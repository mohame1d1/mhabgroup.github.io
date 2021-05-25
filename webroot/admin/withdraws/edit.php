<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('Withdraw '.$_GET['id']);

 $fun->do_updata('withdraws');

 $fun->do_upwithdraws();
 
 show('Admin/Withdraws/edit');
 
?>
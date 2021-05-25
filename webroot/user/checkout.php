<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('CHECKOUT');
 $fun->do_checkout();

 show('User/Invoices/checkout');
?>
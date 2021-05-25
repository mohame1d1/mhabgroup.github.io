<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('ORDER_PTC');
 $fun->do_ptcorder();
   
 show('User/Ptc/order');
?>
<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('PTC');
 $fun->do_ptclist();
 $fun->do_ptcverify();
 
 show('User/Ptc/index');
?>
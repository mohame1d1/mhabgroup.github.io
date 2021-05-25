<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Edit Shortlink');

 $fun->do_updata('shortlinks');
 
 $fun->do_upshort();

 show('Admin/Shortlinks/edit');

?>
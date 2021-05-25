<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Claims');

 $fun->do_qaclaims();

 $fun->do_activate('claims','qa/claims');

 $fun->do_deactivate('claims','qa/claims');

 $fun->do_delete('claims','qa/claims');

show('Admin/Qa/claims');

?>
<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Claims');

 $fun->do_ptclaims();

 $fun->do_activate('claims','ptc/claims');

 $fun->do_deactivate('claims','ptc/claims');

 $fun->do_delete('claims','ptc/claims');

show('Admin/Ptc/claims');

?>
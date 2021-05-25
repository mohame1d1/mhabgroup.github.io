<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Claims');

 $fun->do_shortclaims();

 $fun->do_activate('claims','shortlinks/claims');

 $fun->do_deactivate('claims','shortlinks/claims');

 $fun->do_delete('claims','shortlinks/claims');

show('Admin/Shortlinks/claims');

?>
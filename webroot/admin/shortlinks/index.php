<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Shortlinks');

 $fun->do_shorts();

 $fun->do_activate('shortlinks','shortlinks/index');

 $fun->do_deactivate('shortlinks','shortlinks/index');

 $fun->do_delete('shortlinks','shortlinks/index');

show('Admin/Shortlinks/index');

?>
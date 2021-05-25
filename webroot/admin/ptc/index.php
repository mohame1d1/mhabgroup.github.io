<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('PTC');

 $fun->do_ptcs();

 $fun->do_activate('ptc','ptc/index');

 $fun->do_deactivate('ptc','ptc/index');

 $fun->do_delete('ptc','ptc/index');

show('Admin/Ptc/index');

?>
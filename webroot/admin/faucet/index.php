<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Faucet claims');

 $fun->do_fclaims();

 $fun->do_activate('claims','faucet/index');

 $fun->do_deactivate('claims','faucet/index');

 $fun->do_delete('claims','faucet/index');

 show('Admin/Faucet/claims');

?>
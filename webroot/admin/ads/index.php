<?php

 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');

 $fun->do_winfo('Ads');

 $fun->do_ads(true);

 $fun->do_activate('ads','ads/index');

 $fun->do_deactivate('ads','ads/index');

 $fun->do_delete('ads','ads/index');

show('Admin/Ads/index');

?>
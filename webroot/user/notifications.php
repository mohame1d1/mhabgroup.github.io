<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');
 
 $fun->do_winfo('NOTIFICATIONS');
 $fun->do_notifications(true);

 show('User/Notifications/index');
?>
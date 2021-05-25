<?php

 require_once (dirname(dirname(__FILE__)).'/loader.php');
 
 $fun->do_winfo('SMTP_GMAIL_SETUP');

 show('Pages/Help/smtp-gmail-setup');

?>
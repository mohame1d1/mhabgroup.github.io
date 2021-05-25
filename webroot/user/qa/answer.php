<?php
 
 require_once (dirname(dirname(dirname(__FILE__))).'/functions.php');
 
 $fun->do_winfo('ANSWER_QUESTION');
 $fun->do_qaclaim();
 
 show('User/Qa/answer');
?>
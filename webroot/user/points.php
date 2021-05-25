<?php
 
 require_once (dirname(dirname(__FILE__)).'/functions.php');

 $fun->do_winfo('POINTS_REWARDS');
 $fun->do_points_rewards();
 
 show('User/Settings/points');
?>
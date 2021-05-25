<?php

 /*
 |--------------------------------------------------------------------------
 | smartyModel
 |--------------------------------------------------------------------------
 |
 | Smarty tags can be found here.
 |
 */
 
 class smartyModel{
  
 public function users($id){
 
 global $smarty;
 switch ($id):
 case '0':
 case NULL:
   define('islogged',false);
   $smarty->assign('notlogged', true);
   $smarty->assign('logged',false);
   $smarty->assign('uid',$id);
   break;
 default:
  define('islogged',true);
  $smarty->assign('logged', true);
  $smarty->assign('notlogged',false);
  $smarty->assign('uid',$id);
  break;
 endswitch;
 }
 public function sign_option(){
     
 global $smarty,$query,$info,$uid,$HOST,$user;

 $smarty->assign('HOST',$HOST);
 $smarty->assign('AST',$HOST.AST); 
 $smarty->assign('THM',$HOST.THM); 
 $smarty->assign('ADM',$HOST.ADM); 
 $smarty->assign('USR',$HOST.USR); 
 $smarty->assign('THEME',Theme);
 $smarty->assign('date',Year);
 $smarty->assign('WWW_ROOT',WWW_ROOT);
 $smarty->assign('TMP',WWW_ROOT . 'template' . DS . Theme);
 $smarty->assign('name',do_config(0));
 $smarty->assign('site_description',do_config(8));
 $smarty->assign('site_title',do_config(9));
 $smarty->assign('APPversion',$info->version);
 $smarty->assign('keywords',do_config(29));
 $smarty->assign('sumbole',do_config(16));

 if (isset($uid)):
  $user = $query->addquery('select','members','*','i', $uid,'id=?');
  $smarty->assign('role',$user->role);
 endif;
 
 }
 public function sign_user_fun(){
   global $smarty,$query,$uid,$HOST;
 
   if(isset($uid)){
    $user = $query->addquery('select','members','*','i', $uid,'id=?');
  
    $smarty->assign('username',$user->username);
    $smarty->assign('email',$user->email);
    $smarty->assign('balance',$user->balance);
    $smarty->assign('referral_earnings',$user->referral_earnings);
    $smarty->assign('country',$user->country);
    $smarty->assign('uid',$user->id);
   }
 
 }

 }

$smart = new smartyModel;
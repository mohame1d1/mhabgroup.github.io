<?php

 /*
 |--------------------------------------------------------------------------
 | functionModel
 |--------------------------------------------------------------------------
 |
 | Almost all functions used can be found here.
 |
 */
 
 class functionModel{

  var $balance = "0.00000000"; // default balance
  var $interval = "24 HOUR"; // default interval
  var $host = HOST; // URL
  var $pfx = PFX; // DB perfix
  var $allowed =  ["jpeg" => "image/jpeg", "png" => "image/png", "jpg" => "image/jpg"]; // allowed extension
  var $imglink; // image link
  var $maxsize = 5 * 1024 * 1024; // max size

 public function do_install(){
   //redirect to installer
  if(!endsWith(ACCESS, INSTALL_FILE) && !endsWith(ACCESS, LICENSE_FILE) && !endsWith(ACCESS, DATABASE_FILE) && !endsWith(ACCESS, BUILD_FILE) && !endsWith(ACCESS, ADMIN_FILE)):

   header('location: installer/index');
   
  endif;

 }
 public function do_update_notice(){
 global $smarty,$info;
  if(isset(app_version()['error'])) {
   $smarty->assign('app_version',false);
  } else {
    if(app_version()['version'] > $info->version){

    $smarty->assign('app_version',true);
    $smarty->assign('msg_version','<div class="alert alert-danger">A new version <b>['.app_version()['version'].']</b> has been released click <a href="'.$this->host.'admin/updates/index?v='.app_version()['version'] .'"><b>here</b></a> to update it!</div>');
    } else {
     $smarty->assign('app_version',false);
    }
  }
 }
 public function do_complete_update(){
 global $query,$dateForm;

  if ($this->do_post($this->do_arrp('complete','csrf'),'*','complete')){
    //database query
    $query->addquery('insert','config','header,value','ss',['enable_proxy','2']);
    $query->addquery('insert','config','header,value','ss',['deposit_processor','coinbase']);
    $query->addquery('insert','dmethods','methods,status,created','sis',['coinbase',1,$dateForm]);
    $query->normal("ALTER TABLE mf_banlist ADD status enum('1', '2') NOT NULL DEFAULT '2';");
    echo '<center><h3>Update Completed! Redirecting you in 3 sec....</h3></center>';
    header('refresh:3;url='.$this->host.'admin/dashboard');
    exit;
  }

 }
 public function do_user($u){

 global $query;
 
  $user = $query->addquery('select','members','*','i', $u,'id=?');
  return $user;
 }
 public function btc_to_satoshi($a){
   return str_replace('.0','',($a)*(pow(10, 8)));
 }
 public function satoshi_to_btc($a){
   return number_format(($a)*(pow(10, -8)), 8, '.', '');
 }
 public function do_lang($l){
  require_once(LOCALE.$l.DS.'labels.php');
  require_once(LOCALE.$l.DS.'messages.php');
  require_once(LOCALE.$l.DS.'meta.php');
 }
 public function do_host(){

 global $sr,$HOST,$info;

 if(DB_ERR && $info->install == 'on'):
  errorAndDie('Missing Database Parameter');
 endif;

 if (empty(trim(HOST))):
  $HOST = $sr->site_url();
 else:
  $HOST = HOST;
 endif;
 
 }
 public function ago($datetime, $full = false) {
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';
}
 public function limit_text($text, $limit) {
   //short text
      if (str_word_count($text, 0) > $limit) {
          $words = str_word_count($text, 2);
          $pos = array_keys($words);
          $text = substr($text, 0, $pos[$limit]) . '...';
      }
      return $text;
    }
 public function do_redirect($t){
 global $smarty;

 $smarty->assign('timer',$t);
 $smarty->assign('url',parse_url(base64_decode($_GET['id']), PHP_URL_HOST));
 header('Refresh: '.$t.'; URL='. base64_decode($_GET['id']));
 
 }
 public function do_404(){
 
 global $smarty;
 require_once (WWW_ROOT.'pages/404.php');
 exit;
 
}
 public function do_required($n){

    if( empty(trim($_POST[$n]))):
       session_acv('req_'.$n,'re_'.$n);
       quick();
    endif;
}
 public function do_arrp($n,$arr){
 
 if(isset($_POST[$n])):
 
  $arr = explode(',',$arr);
  $array = array();
 
  for($i=0; $i < count($arr); $i++):
   $build =  $_POST[$arr[$i]];
   array_push($array, $build);
  endfor;
  
    return $array;
    
 endif;
 
}
 public function do_countip($id,$tp){
 global $today,$query,$user;

  $interval = "24 HOUR";// default interval 
  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."claims as claims WHERE user_id='$user->id' AND details='$id' AND type='$tp' AND time > NOW() - INTERVAL ".$interval." AND status='1'");
  $data = $data->fetch_assoc();
  return number_format($data['count(id)']);
}
 public function do_answered($id){
 global $query,$user;

  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."claims as claims WHERE user_id='$user->id' AND details='$id' AND type='qa' AND status='1'");
  $data = $data->fetch_assoc();
  return number_format($data['count(id)']);
}
 public function do_fctverify($r=false){

 global $query,$smarty,$user;
 $interval_f = do_config(35);
 $interval = "5 MINUTE"; // default interval if the custom interval is messed up
 $interval_value = intval(substr($interval_f,0,-1));
 $interval_function = strtoupper(substr($interval_f,-1));
 if ($interval_value >= 0 && ($interval_function == "H" || $interval_function == "M" || $interval_function == "D")){
	 $interval = $interval_value." ";
	 switch ($interval_function)
	 {
	  case "M":
	   $interval .= "MINUTE";
	   break;
	  case "H":
	   $interval .= "HOUR";
	   break;
	  case "D":
	   $interval .= "DAY";
	   break;
	 }
 }
 
  $data = $query->normal("SELECT id,time FROM ".$this->pfx."claims WHERE user_id='$user->id' AND type='faucet' AND status='1' AND time > NOW() - INTERVAL ".$interval." ORDER BY id DESC LIMIT 1");
  $data = $data->fetch_assoc();
 
 if(!$r):
    if($data['id']):
      $smarty->assign('timer',strtolower($interval).'s');
      $smarty->assign('claimed',true);
    else:
      $smarty->assign('claimed',false);
    endif;
 elseif($data['id']):
     return true;
 else:
     return false;
 endif;
 }
 public function do_fctclaim(){

 global $query,$smarty,$dateForm,$user,$date;

   $smarty->assign('fc_earned',$this->btc_to_satoshi(do_config(31)));

 /* faucet claim */

 if ($this->do_post($this->do_arrp('claim','csrf'),'*','claim')){

    require_once('proxyfModel.php');
    $pf = new proxy_filter();
	if ($pf->check()) {
        session_acv('claim','do_error');
        redirect(['controller' => 'user','action' => 'faucet']);
	}
    if($this->do_fctverify(true)) {
              session_acv('claim','do_error');
              redirect(['controller' => 'user','action' => 'faucet']);
    }
    
    
        if(reCaptcha(do_config(5)) == true){
         /* check if there inactive claim */
           $claims = $query->normal("SELECT id,verify_key FROM ".$this->pfx."claims WHERE user_id='$user->id' AND type='faucet' AND status='2' LIMIT 1;");
           $data = $claims->fetch_assoc();
          
          /* set details */
           if(!$data) {
            $query->addquery('insert','claims','user_id,verify_key,amount,created,time','issss',[$user->id,$this->genToken(9),do_config(31),$dateForm,$date]);
            $query->addquery('update','members','balance=balance+?,points=points+?','ssi',[do_config(31),do_config(54),$user->id],'id=?');
            if(!empty($user->parent_id)):
            $query->addquery('update','members','balance=balance+?,referral_earnings=referral_earnings+?','ssi',[get_percentage(do_config(31)),get_percentage(do_config(31)),$user->parent_id],'id=?');
            endif;
            session_acv('claim','verified');
            redirect(['controller' => 'user','action' => 'faucet']);
           }else{
            $query->addquery('update','claims','time=?,status=?','sii',[$date,1,$data['id']],'id=?');
            $query->addquery('update','members','balance=balance+?','si',[do_config(31),$user->id],'id=?');
            if(!empty($user->parent_id)):
            $query->addquery('update','members','balance=balance+?,referral_earnings=referral_earnings+?','ssi',[get_percentage(do_config(31)),get_percentage(do_config(31)),$user->parent_id],'id=?');
            endif;
            session_acv('claim','verified');
            redirect(['controller' => 'user','action' => 'faucet']);
           }
            
        }elseif(reCaptcha(do_config(5)) == false){
            session_acv('claim','captcha');
            redirect(['controller' => 'user','action' => 'faucet']);
        }else{
            session_acv('claim','do_error');
            redirect(['controller' => 'user','action' => 'faucet']);
        }

 }else{
  alerts('claim','verified');
  alerts('claim','captcha');
  alerts('claim','do_error');
  alerts('claim','do_reason');
 }

}     
 public function do_shortclaim(){
     
   global $query,$user,$dateForm,$date;

   $id = $_GET['id'];
   $data = $query->addquery('select','shortlinks','*','i', $id,'id=?');
   $claims = $query->addquery('select','claims','*','ii', "$id,1",'details=?,status=?');
   if (!$data) {
      //Wrong Shortlink
        session_acv('claim','do_error');
        redirect(['controller' => 'user','action' => 'faucet']);
   }
  
   if ($this->do_countip($id,'shortlink') >= $data->count_ip) {
      //already completed
        session_acv('claim','do_error');
        redirect(['controller' => 'user','action' => 'faucet']);
   }
    require_once('proxyfModel.php');
    $pf = new proxy_filter();
	if ($pf->check()) {
        session_acv('claim','do_error');
        redirect(['controller' => 'user','action' => 'faucet']);
	}
   /* check if there inactive claim */
   $claimsck = $query->normal("SELECT id,verify_key FROM ".$this->pfx."claims WHERE user_id='$user->id' AND type='shortlink' AND details='$id' AND status='2' LIMIT 1;");
   $claimsck = $claimsck->fetch_assoc();

   if(!$claimsck) {
    $key = $this->genToken(9);
    $url_returned_encode = urlencode($this->host.USR.'shortlinks/index?id='.$key);
   } else{
    $url_returned_encode = urlencode($this->host.USR.'shortlinks/index?id='.$claimsck['verify_key']);
   }
   $api_url = $data->url;
   $api_url.= 'api?api='.$data->api.'&url='.$url_returned_encode.'&alias='.$this->genToken(9).'&expiry='.(time()+10800);
   
   $ch = curl_init();
   if ($ch === false) {
      // curl not enabled
        session_acv('claim','do_error');
        redirect(['controller' => 'user','action' => 'faucet']);
    }
   // get the shortlink
   curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 7);
   curl_setopt($ch, CURLOPT_TIMEOUT, 7);
   curl_setopt($ch, CURLOPT_URL, $api_url);
   curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
   curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
   curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
   curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
   $short_response = @curl_exec($ch);
   curl_close($ch);
 
   // not compatible with http: api - retry with https:
   if (empty($short_response)) {
       $http_pos=stripos($api_url, 'http://');
       if (($http_pos!==false) && ($http_pos==0))  {
            if ($ch = curl_init()) {
                curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 7);
                curl_setopt($ch, CURLOPT_TIMEOUT, 7);
                curl_setopt($ch, CURLOPT_URL, 'https://'.substr($api_url, 7));
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
                curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
                $short_response = @curl_exec($ch);
                curl_close($ch);
            }
        }
   }

   $result = @json_decode($short_response, true);
  if ((!empty($result['status'])) && ($result['status']=='success')) {
     // valid shortlink - go
     if(!$claimsck) {
      $_SESSION["shortlink"]["credit"] = $data->credit;
      $query->addquery('insert','claims','user_id,verify_key,details,type,amount,status,created,time','issssiss',[$user->id,$key,$id,'shortlink',$data->credit,2,$dateForm,$date]);
     }else{
      $_SESSION["shortlink"]["credit"] = $data->credit;
      $query->addquery('update','claims','amount=?,time=?','ssi',[$data->credit,$date,$claimsck['id']],'id=?');
     }
       redirect(['controller' => 'redirect','action' => base64_encode($result['shortenedUrl']).DS]);
    } else {
          //bad shortlink
          echo 'Error: bad shortlink.';
          exit;
    }
 }
 public function do_shortverify(){
     
 global $query,$user;
 if(isset($_GET['id']) && !empty($_GET['id'])):
   
    require_once('proxyfModel.php');
    $pf = new proxy_filter();
	if ($pf->check()) {
        session_acv('shortlink','error');
        redirect(['controller' => 'user','action' => 'shortlinks/index']);
   }
   $credit = $_SESSION["shortlink"]["credit"];
   $data = $query->addquery('update','claims','status=?','is',[1,$_GET['id']],'verify_key=?');
   if($data):
      $query->addquery('update','members','balance=balance+?,points=points+?','ssi',[$credit,do_config(55),$user->id],'id=?');
      if(!empty($user->parent_id)):
      $query->addquery('update','members','balance=balance+?,referral_earnings=referral_earnings+?','ssi',[get_percentage($credit),get_percentage($credit),$user->parent_id],'id=?');
      endif;
      session_acv('shortlink','verified');
      redirect(['controller' => 'user', 'action' => 'shortlinks/index']);
   else:
      session_acv('shortlink','error');
      redirect(['controller' => 'user', 'action' => 'shortlinks/index']);
   endif;
 endif;
   alerts('shortlink','verified');
   alerts('shortlink','error');
   
 }
 public function do_shortlinks(){

  global $query,$smarty;
  $result = pages(21,0);
  $data = $query->limit('shortlinks','*','position','asc',$result['start'].','.$result['perpage'],'i','1','status=?');
  $with = array();
  while($res=$data->fetch_assoc()):
  $arr=array('id'=>$res['id'],'name'=>$res['name'],'description'=>$res['description'],'count_ip'=>$res['count_ip'],'credit'=>$this->btc_to_satoshi($res['credit']),'ver_ip'=>$this->do_countip($res['id'],'shortlink'));
  array_push($with,$arr);
  endwhile;
  $smarty->assign('shortlinks',$with);
  $smarty->assign('st_earned',$this->btc_to_satoshi($_SESSION["shortlink"]["credit"]));
  paging($result['screen']+1,ceil($query->num_rows('shortlinks','*','i','1','status=?')/$result['perpage'])+1,'?p=');

 }
 public function do_ptclaim(){
     
   global $query,$user,$smarty,$dateForm,$date;

   $id = $_GET['id'];
   $data = $query->addquery('select','offers','*','i', $id,'id=?');
   if (!$data) {
      //Wrong PTC
      echo 'Error: Wrong PTC offer';
      exit;
   }
   if ($this->do_countip($id,'ptc') > 0) {
      //already completed
      echo 'Error: PTC already completed!';
      exit;
   }
   if ($data->type != 'ptc') {
      //already completed
      echo 'Error: Non PTC offer';
      exit;
   }
    require_once('proxyfModel.php');
    $pf = new proxy_filter();
	if ($pf->check()) {
        session_acv('claim','do_error');
        redirect(['controller' => 'user','action' => 'faucet']);
	}
   /* check if there inactive claim */
   $claimsck = $query->normal("SELECT id,verify_key FROM ".$this->pfx."claims WHERE user_id='$user->id' AND type='ptc' AND details='$id' AND status='2' LIMIT 1;");
   $claimsck = $claimsck->fetch_assoc();
          
   /* set details */
   if(!$claimsck) {
    $key = $this->genToken(9);
    $query->addquery('insert','claims','user_id,verify_key,details,type,amount,status,created,time','issssiss',[$user->id,$key,$id,'ptc',do_config(33),2,$dateForm,$date]);
    $smarty->assign('verify',$key);
   }else{
    $query->addquery('update','claims','time=?','si',[$date,$claimsck['id']],'id=?');
    $smarty->assign('verify',$claimsck['verify_key']);
   }
   
   $smarty->assign('ptcurl',$data->url);
   $smarty->assign('ptcname',$data->name);
   $smarty->assign('timer',$data->timer);
  
 }
 public function do_ptclist(){
 
  global $query,$smarty;
  $result = pages(21,0);
  $data = $query->limit('offers','*','id','desc',$result['start'].','.$result['perpage'],'si','ptc,1','type=?,status=?');
  $with = array();
  while($res=$data->fetch_assoc()):
  $arr=array('id'=>$res['id'],'name'=>$res['name'],'timer'=>$res['timer'],'description'=>$res['details'],'url'=>parse_url($res['url'], PHP_URL_HOST),'ver_ip'=>$this->do_countip($res['id'],'ptc'));
  array_push($with,$arr);
  endwhile;
  $smarty->assign('ptclist',$with);
  $smarty->assign('ptc_earn',$this->btc_to_satoshi(do_config(33)));
  paging($result['screen']+1,ceil($query->num_rows('offers','*','si','ptc,1','type=?,status=?')/$result['perpage'])+1,'?p=');

 }
 public function do_ptcverify(){
     
 global $query,$user;
 if(isset($_GET['id']) && !empty(trim($_GET['id']))):
   
    require_once('proxyfModel.php');
    $pf = new proxy_filter();
	if ($pf->check()) {
        session_acv('ptc','error');
        redirect(['controller' => 'user','action' => 'ptc/index']);
    }
    $claim = $query->addquery('select','claims','details','s', $_GET['id'],'verify_key=?');
    $data = $query->addquery('update','claims','status=?','is',[1,$_GET['id']],'verify_key=?');
    if($data):
      $query->addquery('update','members','balance=balance+?,points=points+?','ssi',[do_config(33),do_config(56),$user->id],'id=?');
      $query->addquery('update','offers','current_clicks=current_clicks+?','si',[1,$claim->details],'id=?');
      $offer = $query->addquery('select','offers','clicks,current_clicks','s', $claim->details,'id=?');
      if($offer->clicks == $offer->current_clicks):
      $query->addquery('update','offers','status=?','ii', [3,$claim->details],'id=?');
      endif;
      if(!empty($user->parent_id)):
      $query->addquery('update','members','balance=balance+?,referral_earnings=referral_earnings+?','ssi',[get_percentage(do_config(33)),get_percentage(do_config(33)),$user->parent_id],'id=?');
      endif;
      session_acv('ptc','verified');
      redirect(['controller' => 'user', 'action' => 'ptc/index']);
   else:
      session_acv('ptc','error');
      redirect(['controller' => 'user', 'action' => 'ptc/index']);
   endif;
 endif;
   alerts('ptc','verified');
   alerts('ptc','error');
   
 }
 public function do_ptcorder(){
 
  global $query,$smarty,$user,$dateForm;
  $smarty->assign('ptc_min',do_config(36));
  $smarty->assign('ptc_price',do_config(37));

  if ($this->do_post($this->do_arrp('order','title','description','url','visitors','timer'),'*','order')){
          $amount = number_format(check_request('visitors') * do_config(37),8,".",".");
       
         if(check_request('visitors') < do_config(36)):
            session_acv('order','do_error');
            redirect(['controller' => 'user','action' => 'ptc/order']);
          endif;
          if($user->advertising_balance < $amount):
            session_acv('order','small');
            redirect(['controller' => 'user','action' => 'ptc/order']);
          endif;
          
          $data = $query->addquery('insert','offers','user_id,name,details,url,clicks,timer,amount,status,created','issssssss',[$user->id,check_request('title'),check_request('description'),check_request('url'),check_request('visitors'),check_request('timer'),$amount,'1',$dateForm]);
          if($data){
             $query->addquery('update','members','advertising_balance=advertising_balance-?,spent=spent+?,purchased=purchased+?','sssi',[$amount,$amount,1,$user->id],'id=?');
             redirect(['controller' => 'user','action' => 'orders/ptc']);
          }else{
             session_acv('order','do_error');
             redirect(['controller' => 'user','action' => 'ptc/order']);
          }

  }else{
   alerts('order','required');
   alerts('order','do_error');
   alerts('order','small');
  }
 }
 public function do_ptcheckout(){
 
  global $smarty,$query,$user,$dateForm;
  $data = $query->addquery('select','offers','*','i',$_GET['id'],'id=?');
  if($data){
    $coinpayments = $query->addquery('select','dmethods','*','s','coinpayments','methods=?');
	require(CPM.'coinpayments.inc.php');
	$cps = new CoinPaymentsAPI();
	$cps->Setup($coinpayments->public_key, $coinpayments->secret_key);
	$result = $cps->GetCallbackAddress($data->method, $this->host.'user/ipn_handler');
	if ($result['error'] == 'ok') {
      $invoice = $query->addquery('select','invoice','address','i',$data->id,'order_id=?');
      $smarty->assign('amount',$data->amount);
      $smarty->assign('method','USD');
      $smarty->assign('address',$result['result']['address']);
      $smarty->assign('qrcode',qrcode_('280x280',cryptoname_($data->method),$result['result']['address']));
	  if(!$invoice) {
       $id = $query->addquery('insert','invoice','user_id,order_id,amount,method,address,status,created','iisssss',[$user->id,$data->id,$data->amount,$data->method,$result['result']['address'],'2',$dateForm]);
       if($id) {
         $smarty->assign('message','');
	   } else {
         $smarty->assign('message','Error: Something Wrong!');
	   }
	  }else {
         $smarty->assign('message','');
	  }
	} else {
         $smarty->assign('address','');
         $smarty->assign('method','');
         $smarty->assign('message','Error: '.$result['error']);
    }
  }else{
    echo 'Error: not found';
    exit;
  }
  
 }
 public function do_qalist(){
  
  global $query,$smarty;
  $result = pages(21,0);
  $data = $query->limit('offers','*','id','desc',$result['start'].','.$result['perpage'],'si','qa,1','type=?,status=?');
  $with = array();
  while($res=$data->fetch_assoc()):
  $arr=array('id'=>$res['id'],'name'=>$this->limit_text($res['name'],6),'tooltip'=>$res['name'],'category'=>$res['category'],'type'=>$res['method'],'ver_ip'=>$this->do_answered($res['id']));
  array_push($with,$arr);
  endwhile;
  $smarty->assign('qalist',$with);
  $smarty->assign('qa_earn',$this->btc_to_satoshi(do_config(34)));
  alerts('claim','verified');
  alerts('claim','error');
  paging($result['screen']+1,ceil($query->num_rows('offers','*','si','qa,1','type=?,status=?')/$result['perpage'])+1,'?p=');

 }
 public function do_qa(){
  
  global $query,$smarty,$result;
  $data = $query->limit('offers','*','id','desc',$result['start'].','.$result['perpage'],'s','qa','type=?');
  $with = array();
  while($res=$data->fetch_assoc()):
  $arr=array('id'=>$res['id'],'name'=>$this->limit_text($res['name'],6),'tooltip'=>$res['name'],'category'=>$res['category'],'ver_ip'=>$this->do_answered($res['id']),'answer'=>$res['url'],'status'=>$res['status'],'created'=>$res['created']);
  array_push($with,$arr);
  endwhile;
  $smarty->assign('qalist',$with);
  
  paging($result['screen']+1,ceil($query->num_rows('offers','*','s','qa','type=?')/$result['perpage'])+1,'?p=');

  alerts('claim','updated');
  alerts('claim','added');
 }
 public function do_qaclaims(){
 global $smarty,$query,$result;
 
 $data = $query->limit('claims','*','id','desc',$result['start'].','.$result['perpage'],'s','qa','type=?');

 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'verify_key'=>$res['verify_key'],'provider'=>$res['details'],'amount'=>$res['amount'],'status'=>$res['status'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;
  $smarty->assign('claims',$with);

 paging($result['screen']+1,ceil($query->num_rows('claims','*','s','qa','type=?')/$result['perpage'])+1,'?p=');

 }
 public function do_qaclaim(){
  
   global $query,$user,$smarty,$dateForm,$date;

   $id = $_GET['id'];
   $key = $id.$this->genToken(9);
   $data = $query->addquery('select','offers','*','i', $id,'id=?');
   $claim = $query->addquery('select','claims','*','iii', "$user->id,$id,1",'user_id=?,details=?,status=?');
   
   if (!$data) {
      //Wrong QA
      echo 'Error: Wrong QA offer';
      exit;
   }
   if ($claim) {
      //already completed
      echo 'Error: QA already completed!';
      exit;
   }
   if ($data->type != 'qa') {
      //already completed
      echo 'Error: Non QA offer';
      exit;
   }
   
   $arr = explode(',',$data->details);
   $array = array();
   
   for ($i = 0; $i < count($arr); $i++) {
    $answers = $arr[$i];
    $answers = '<div class="radio" style="font-weight: bold;text-transform: capitalize;">
                  <input type="radio" name="answer" id="radio1" value="'.$arr[$i].'" checked="">
                  <label for="radio1">'.$arr[$i].'</label>
                </div>';

    array_push($array, $answers);
   }
   
   $smarty->assign('qa_id',$id);
   $smarty->assign('answers',implode(',',$array));
   $smarty->assign('question',$data->name);
   $smarty->assign('number',count(explode(',',$data->details)));
   $smarty->assign('type',$data->method);

 if ($this->do_post($this->do_arrp('claim','answer'),'*','claim')){

    require_once('proxyfModel.php');
    $pf = new proxy_filter();
	if ($pf->check()) {
        session_acv('claim','do_error');
        redirect(['controller' => 'user','action' => 'qa/answer/'.$id.DS]);
	}

        if(reCaptcha(do_config(5)) == true){
            if(trim($data->url) == trim(check_request('answer'))) {
               $query->addquery('insert','claims','user_id,verify_key,details,type,amount,status,created,time','issssiss',[$user->id,$key,$id,'qa',do_config(34),1,$dateForm,$date]);
               $query->addquery('update','members','balance=balance+?','si',[do_config(34),$user->id],'id=?');
            if(!empty($user->parent_id)):
            $query->addquery('update','members','balance=balance+?,referral_earnings=referral_earnings+?','ssi',[get_percentage(do_config(34)),get_percentage(do_config(34)),$user->parent_id],'id=?');
            endif;
            session_acv('claim','verified');
            } else {
               $query->addquery('insert','claims','user_id,verify_key,details,type,amount,status,created,time','issssiss',[$user->id,$key,$id,'qa',$this->balance,1,$dateForm,$date]);
            session_acv('claim','error');
            }
            redirect(['controller' => 'user','action' => 'qa/index']);
        }elseif(reCaptcha(do_config(5)) == false){
            session_acv('claim','captcha');
            redirect(['controller' => 'user','action' => 'qa/answer/'.$id.DS]);
        }else{
            session_acv('claim','do_error');
            redirect(['controller' => 'user','action' => 'qa/answer/'.$id.DS]);
        }
 }else{
  alerts('claim','captcha');
  alerts('claim','do_error');
  alerts('claim','required');
 }
   
 }
 public function do_points_rewards(){
 
  global $smarty,$query,$user,$dateForm;
  $smarty->assign('points',$user->points);
  $smarty->assign('amount',$this->satoshi_to_btc($user->points));
  $smarty->assign('converted_points',number_format($user->converted_points, 8, '.', ''));

  if ($this->do_post($this->do_arrp('convert','csrf'),'*','convert')){
     if($user->points < do_config(59)):
        session_acv('convert','small');
        redirect(['controller' => 'user','action' => 'points']);
     endif;
          
          $amount = $this->satoshi_to_btc($user->points);
          $data = $query->addquery('update','members','balance=balance+?,points=?,converted_points=converted_points+?','sssi',[$amount,'0',$amount,$user->id],'id=?');
          if($data){
             session_acv('convert','complete');
             redirect(['controller' => 'user','action' => 'points']);
          }else{
             session_acv('convert','do_error');
             redirect(['controller' => 'user','action' => 'points']);
          }

  }else{
   alerts('convert','complete');
   alerts('convert','small');
   alerts('convert','required');
   alerts('convert','do_error');
  }
 }
 public function do_deposit(){


  global $smarty,$query,$user,$dateForm;
  $smarty->assign('advertising_balance',$user->advertising_balance);
  $smarty->assign('purchased',$user->purchased);
  $smarty->assign('spent',$user->spent);
  
  if(isset($_SESSION['checkout']['msg'])) {
    $smarty->assign('checkout_msg',$_SESSION['checkout']['msg']);
  }
  if ($this->do_post($this->do_arrp('deposit','amount'),'*','deposit')){
     if(check_request('amount') < do_config(58)):
        session_acv('deposit','small');
        redirect(['controller' => 'user','action' => 'deposit']);
     endif;
          $id = $query->addquery('insert','invoice','user_id,amount,method,status,created','issis',[$user->id,check_request('amount'),do_config(16),'2',$dateForm]);
          if($id){
          require(MODELS.'checkoutModel.php');
	      $ckt = new checkouts();
	     
	      switch(do_config(61)){
	          case 'coinbase':
                  $ckt->coinbase('Deposit #'.$id,$id,check_request('amount'),do_config(16));
	              break;
	          case 'coinpayments':
                  $ckt->coinpayments('Deposit #'.$id,$id,check_request('amount'),do_config(16));
	              break;
	      }
          }else{
             session_acv('deposit','do_error');
             redirect(['controller' => 'user','action' => 'deposit']);
          }

  }else{
   alerts('checkout','error');
   alerts('deposit','small');
   alerts('deposit','required');
   alerts('deposit','do_error');
  }
}  
 public function do_withdraw(){

  global $smarty,$query,$user,$dateForm;
  $smarty->assign('withdraw_address',$user->withdraw_address);
  //withdrawn
  $data = $query->addquery('select','withdraws','sum(amount) as withdrawn','ii',"$user->id,3",'user_id=?,status=?');
  $smarty->assign('withdrawn',number_format($data->withdrawn, 8, '.', ''));
  //pending
  $data = $query->addquery('select','withdraws','sum(amount) as pending','ii',"$user->id,2",'user_id=?,status=?');
  $smarty->assign('pending',number_format($data->pending, 8, '.', ''));
  
  if ($this->do_post($this->do_arrp('withdraw','csrf'),'*','withdraw')){
     if($user->balance < do_config(2)):
        session_acv('withdraw','small');
        redirect(['controller' => 'user','action' => 'withdraw']);
     endif;
     if( empty(trim($user->withdraw_address))):
        session_acv('withdraw','do_error');
        redirect(['controller' => 'user','action' => 'withdraw']);
     endif;
          $data = $query->addquery('insert','withdraws','user_id,method,processor,address,fee,amount,created','issssss',[$user->id,do_config(16),$this->do_processor(do_config(6)),$user->withdraw_address,do_config(15),$user->balance,$dateForm]);
          $data = $query->addquery('update','members','balance=balance-?,referral_earnings=?','ssi',[$user->balance,'0',$user->id],'id=?');
          //$data = $query->addquery('insert','notifications','user_id,title,type,created','isss',[$user->id,'Withdraw request of '.$user->balance.do_config(16),'withdraw',$dateForm]);
          if($data){
             session_acv('withdraw','complete');
             redirect(['controller' => 'user','action' => 'withdraws']);
          }else{
             session_acv('withdraw','do_error');
             redirect(['controller' => 'user','action' => 'withdraw']);
          }

  }else{
   alerts('withdraw','small');
   alerts('withdraw','required');
   alerts('withdraw','do_error');
  }
 }
 public function do_processor($i){
     switch($i):
         case 'fhb':
             return 'FaucetHub';
             break;
         case 'all':
             return 'External';
             break;
     endswitch;
 }
 public function do_advertiser_state(){
 
  global $smarty,$user;
  $smarty->assign('advertising_balance',$user->advertising_balance);
  $smarty->assign('purchased',$user->purchased);
  $smarty->assign('spent',$user->spent);
  
 }
 public function do_checkout(){
 
  global $smarty,$query,$user,$dateForm;
  $data = $query->addquery('select','invoice','*','i',$_GET['id'],'id=?');
  if($data->status == '1') {
     redirect(['controller' => 'user','action' => 'invoices']);
  }
  
  $smarty->assign('total',$data->total);
  $smarty->assign('address',$data->address);
  $smarty->assign('qrcode',$data->qrcode);
  $smarty->assign('status',$data->status_text);
  $smarty->assign('confirm_needed',$data->confirm_needed);
  $smarty->assign('checkout_id',$_GET['id']);
  $secondsWait = 10;
  header("Refresh:$secondsWait");
 }
 public function do_contact(){

 global $user,$query,$dateForm;
 
 if ($this->do_post($this->do_arrp('contact','email,subject,message'),'*','contact')):

    /* Message Owner */
    $this->do_maildata('msg_owner');
    $mail = mailer(['from'=>do_config(48),'to'=>do_config(12),'subject'=>'New Message from '.$user->username,'msg'=>fetch('Admin/Mailer/index')]);
    /* Message Sender */
    $this->do_maildata('msg_sender');
    $mail = mailer(['from'=>do_config(48),'to'=>check_request('email',false,'email'),'subject'=>'We recieve your message','msg'=>fetch('Admin/Mailer/index')]);
    
    if($mail == 2):
      session_acv('contact','do_error');
    else:
    $query->addquery('insert','notifications','user_id,title,type,created','isss',[$user->id,'Your message has been sent','support',$dateForm]);
      session_acv('contact','sent');
    endif;
      redirect(['controller' => 'user','action' => 'support']);
 else:
  alerts('contact','sent');
  alerts('contact','do_error');
  alerts('contact','required');
 endif;

}
 public function do_checkcrd($am){

 global $smarty,$query;
 
 $data = $query->addquery('select','credits','*','s',$am,'amount=?');
 
   if(!$data):
    
         redirect(['controller' => 'admin', 'action' => 'deposit']);

   else:
    
         return $data->amount;
         
   endif;
    
 }
 public function do_maildata($r,$n=false,$m=false){
 
 global $smarty;

 switch($r):
     
  case 'msg_owner':
   $smarty->assign('m_role',$r);
   $smarty->assign('m_name','Admin');
   $smarty->assign('m_fname',check_request('name'));
   $smarty->assign('m_msg',$_POST['message']);
  break;
  case 'msg_sender':
   $smarty->assign('m_role',$r);
   $smarty->assign('m_name',check_request('name'));
   $smarty->assign('m_msg',$_POST['message']);
  break;
  case 'activate':
   $smarty->assign('m_role',$r);
   $smarty->assign('m_name',$n);
   $smarty->assign('m_msg',$m);
  break;
  case 'recover':
   $smarty->assign('m_role',$r);
   $smarty->assign('m_name',$n);
   $smarty->assign('m_msg',$m);
  break;
  case 'gpass':
   $smarty->assign('m_role',$r);
   $smarty->assign('m_name',$n);
   $smarty->assign('m_msg',$m);
  break;
 endswitch;
 
}
 public function do_updata($r){
 
 global $smarty,$query;
  
  if($r == 'ptc' || $r == 'qa'):
   $data = $query->addquery('select','offers','*','i',$_GET['id'],'id=?');
  else:
   $data = $query->addquery('select',$r,'*','i',$_GET['id'],'id=?');
  endif;
  
   $smarty->assign('r_id',$data->id);

 switch($r):
     
  case 'members':
     
   $smarty->assign('r_username',$data->username);
   $smarty->assign('r_role',$data->role);
   $smarty->assign('r_status',$data->status);
   $smarty->assign('r_email',$data->email);
   $smarty->assign('r_balance',$data->balance);
   $smarty->assign('r_referral_earnings',$data->referral_earnings);
   $smarty->assign('r_withdraw_address',$data->withdraw_address);

   /* view user */
   
   $smarty->assign('r_login_ip',$data->login_ip);
   $smarty->assign('r_register_ip',$data->register_ip);
   $smarty->assign('r_created',$data->created);
   $smarty->assign('r_country',$data->country);

  break;
  case 'ads':
     
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_size',$data->size);
   $smarty->assign('r_code',base64_decode($data->code));
   $smarty->assign('r_status',$data->status);
  break;
  case 'testimonials':
     
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_content',$data->content);
   $smarty->assign('r_job',$data->job);
  break;
  case 'announcements':
     
   $smarty->assign('r_title',$data->title);
   $smarty->assign('r_content',$data->content);
  break;
  case 'pages':
     
   $smarty->assign('r_title',$data->title);
   $smarty->assign('r_content',$data->content);
  break;
  case 'shortlinks':
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_description',$data->description);
   $smarty->assign('r_api',$data->api);
   $smarty->assign('r_url',$data->url);
   $smarty->assign('r_credit',$data->credit);
   $smarty->assign('r_position',$data->position);
   $smarty->assign('r_count_ip',$data->count_ip);
   $smarty->assign('r_status',$data->status);
  break;
  case 'ptc':
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_description',$data->details);
   $smarty->assign('r_url',$data->url);
   $smarty->assign('r_timer',$data->timer);
   $smarty->assign('r_clicks',$data->clicks);
   $smarty->assign('r_status',$data->status);
  break;
  case 'qa':
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_description',$data->details);
   $smarty->assign('r_answer',$data->url);
   $smarty->assign('r_method',$data->method);
   $smarty->assign('r_status',$data->status);
  break;
  case 'withdraws':
   $smarty->assign('r_status',$data->status);
  break;
  case 'currencies':
   $smarty->assign('r_name',$data->name);
   $smarty->assign('r_symbol',$data->symbol);
   break;
  case 'items_files':
      
  /* Nothing */
  
  break;
 endswitch;
 
}
 public function do_usdata($r){
 
 global $smarty,$query,$user;
 
 switch($r):
     
  case 'personal':
     
   $smarty->assign('email',$user->email);
   $smarty->assign('country',$user->country);
   $smarty->assign('withdraw_address',$user->withdraw_address);

  break;
 endswitch;
 
}
 public function do_setuser($r){
     
 global $smarty,$query,$user;

 switch($r):
    
  case 'personal':

   $this->do_usdata($r);
   $smarty->assign('countries',explode(',',do_config(53)));
  if($this->do_post($this->do_arrp('settings','email,withdraw_address'),'*','settings')):

    /* Update Personal Information */
    
    $data = $query->addquery('update','members','email=?,withdraw_address=?,country=?','sssi',[check_request('email'),check_request('withdraw_address'),check_request('country'),$user->id],'id=?');
    session_acv('settings','personal');
    redirect(['controller' => 'user', 'action' => 'settings']);
  else:
   alerts('settings','personal');
   alerts('settings','required');
  endif;

 break;

 case 'password':
    
  if($this->do_post($this->do_arrp('pass','newpassword,confnewpassword,prepass'),'*','pass')):

    /* Update Password */
    
     $data = $query->addquery('select','members','recover','i',$user->id,'id=?');
     $decodeRec = base64_decode($data->recover);
     $md5Rec = md5($decodeRec);
     $newpass = check_request('newpassword','md5');
     $Confnewpass = check_request('confnewpassword','md5');
     $prepass = check_request('prepass','md5');
     $newRecover = check_request('newpassword','base64_encode');

    if($user->password == $prepass && $newpass == $Confnewpass && $md5Rec == $prepass):
      $query->addquery('update','members','password=?,recover=?','ssi',[$newpass,$newRecover,$user->id],'id=?');
      session_acv('settings','pass');
      redirect(['controller' => 'user', 'action' => 'password']);
    elseif($newpass != $Confnewpass):
      session_acv('settings','confirm');
      redirect(['controller' => 'user', 'action' => 'password']);
    elseif($md5Rec == $prepass):
      session_acv('settings','unchange');
      redirect(['controller' => 'user', 'action' => 'password']);
	else:
      session_acv('settings','unchange');
      redirect(['controller' => 'user', 'action' => 'password']);
	endif;
	
  else:
   alerts('settings','pass');
   alerts('settings','confirm');
   alerts('settings','unchange');
   alerts('pass','required');
  endif;

 break;
 endswitch;
     
 }
 public function do_upwithdraws(){
     
 global $smarty,$query,$dateForm;

  if(isset($_POST['up-withdraw'])):

     $data = $query->addquery('update','withdraws','status=?','ii',[check_request('status',false,'int'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['withdraws']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'withdraws/index']);
   elseif(!$data):
      $_SESSION['withdraws']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'withdraws/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('withdraws','do_error');
      alerts('withdraws','required');
  endif;
     
 }
 public function do_upuser(){
     
 global $smarty,$query;

  if(isset($_POST['up-user'])):

     $data = $query->addquery('update','members','role=?,status=?,username=?,email=?,balance=?','sisssi',[check_request('role'),check_request('status',false,'int'),check_request('username'),check_request('email'),check_request('balance'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['users']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'users/index']);
   elseif(!$data):
      $_SESSION['users']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'users/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('users','do_error');
      alerts('users','required');
  endif;
     
 }
 public function do_uptc(){
     
 global $smarty,$query;

  if(isset($_POST['up-ptc'])):

     $data = $query->addquery('update','offers','name=?,details=?,url=?,timer=?,clicks=?,status=?','sssiiii',[check_request('name'),check_request('description'),check_request('url'),check_request('timer'),check_request('clicks'),check_request('status'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['ptc']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'ptc/index']);
   elseif(!$data):
      $_SESSION['ptc']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'ptc/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('ptc','do_error');
      alerts('ptc','required');
  endif;
     
 }
 public function do_upqa(){
     
 global $smarty,$query;

  if(isset($_POST['up-qa'])):

     $data = $query->addquery('update','offers','name=?,details=?,url=?,method=?,status=?','ssssii',[check_request('question'),check_request('answers'),check_request('answer'),check_request('method'),check_request('status'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['qa']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'qa/index']);
   elseif(!$data):
      $_SESSION['qa']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'qa/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('qa','do_error');
      alerts('qa','required');
  endif;
     
 }
 public function do_upshort(){
     
 global $smarty,$query;

  if(isset($_POST['up-short'])):

     $data = $query->addquery('update','shortlinks','name=?,description=?,api=?,url=?,credit=?,position=?,count_ip=?,status=?','sssssiiii',[check_request('name'),check_request('description'),check_request('api'),check_request('url'),check_request('credit'),check_request('position'),check_request('count_ip'),check_request('status'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['short']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'shortlinks/index']);
   elseif(!$data):
      $_SESSION['short']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'shortlinks/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('short','do_error');
      alerts('short','required');
  endif;
     
 }
 public function do_uptestimonial(){
     
 global $smarty,$query;

  if(isset($_POST['up-testimonial'])):

     $data = $query->addquery('update','testimonials','name=?,content=?,job=?','sssi',[check_request('name'),check_request('content'),check_request('job'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['testimonials']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'testimonials/index']);
   elseif(!$data):
      $_SESSION['testimonials']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'testimonials/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('testimonials','do_error');
      alerts('testimonials','required');
  endif;
     
 }
 public function do_upannouncement(){
 global $smarty,$query;

  if(isset($_POST['up-announcement'])):

     $data = $query->addquery('update','announcements','title=?,content=?','ssi',[check_request('title'),$_POST['content'],$_GET['id']],'id=?');

   if($data):
      $_SESSION['announcements']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'announcements/index']);
   elseif(!$data):
      $_SESSION['announcements']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'announcements/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('announcements','do_error');
      alerts('announcements','required');
  endif;
     
 }
 public function do_upads(){
     
 global $smarty,$query;

  if(isset($_POST['up-ads'])):

     $data = $query->addquery('update','ads','name=?,size=?,code=?,status=?','sssii',[check_request('name'),check_request('size'),base64_encode($_POST['code']),check_request('status'),$_GET['id']],'id=?');

   if($data):
      $_SESSION['ads']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'ads/index']);
   elseif(!$data):
      $_SESSION['ads']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'ads/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('ads','do_error');
      alerts('ads','required');
  endif;
     
 }
 public function do_upage(){
     
 global $smarty,$query;

  if(isset($_POST['up-page'])):

     $data = $query->addquery('update','pages','title=?,content=?,short=?','sssi',[check_request('title'),$_POST['content'],$this->limit_text(check_request('content'),30),$_GET['id']],'id=?');

   if($data):
      $_SESSION['pages']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'pages/index']);
   elseif(!$data):
      $_SESSION['pages']['do_error']=true;
      redirect(['controller' => 'admin', 'action' => 'pages/edit/'.$_GET['id'].DS]);
   endif;
  else:
      alerts('pages','do_error');
      alerts('pages','required');
  endif;
     
 }
 public function do_upemail(){
     
 global $smarty,$query;
 
  $smarty->assign('emails',1);
  if(isset($_POST['up-email'])):

     $query->addquery('update','config','value=?','ss',[check_request('support_email'),'support_email'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('option'),'mailer_option'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('host'),'mailer_host'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('port'),'mailer_port'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('ssl'),'mailer_use'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('pass'),'mailer_pass'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('username'),'mailer_username'],'header=?');
     $_SESSION['email']['mailer']=true;
     redirect(['controller' => 'admin', 'action' => 'options/email']);
  else:
      alerts('email','do_error');
      alerts('email','mailer');
  endif;
     
 }
 public function do_upayments(){
     
 global $smarty,$query;
 
  /* coinpayments configration */
  $coinpayments = $query->addquery('select','dmethods','*','s', 'coinpayments','methods=?');
  $smarty->assign('cpm_public_key',$coinpayments->public_key);
  $smarty->assign('cpm_secret_key',$coinpayments->secret_key);
  $smarty->assign('cpm_ipn',$coinpayments->ipn);
  $smarty->assign('cpm_account',$coinpayments->account);
  $smarty->assign('cpm_coincurrencies',$coinpayments->currencies);
  
  /* coinbase configration */
  $coinbase = $query->addquery('select','dmethods','*','s', 'coinbase','methods=?');
  $smarty->assign('cbs_public_key',$coinbase->public_key);
  $smarty->assign('cbs_secret_key',$coinbase->secret_key);
  $smarty->assign('cbs_ipn',$coinbase->ipn);
  $smarty->assign('cbs_account',$coinbase->account);

  /* activate/deactivate currencies */
  $this->do_activate('currencies','options/payment');
  $this->do_deactivate('currencies','options/payment');
  $this->do_delete('currencies','options/payment');
  $this->do_currencies(2);
  $smarty->assign('payments',1);
  
  /* update payments configration */
  if(isset($_POST['up-payments'])):
      
      $query->addquery('update','config','value=?','ss',[check_request('deposit_processor'),'deposit_processor'],'header=?');
      $query->addquery('update','config','value=?','ss',[check_request('currency'),'currency'],'header=?');
      $query->addquery('update','config','value=?','ss',[check_request('min_deposit'),'min_deposit'],'header=?');
      if(do_config(61) == 'coinbase'){
      $query->addquery('update','dmethods','public_key=?,secret_key=?,ipn=?,account=?','sssss',[check_request('cbs_public_key'),check_request('cbs_secret_key'),check_request('cbs_ipn'),check_request('cbs_merchant_id'),'coinbase'],'methods=?');
      }elseif(do_config(61) == 'coinpayments'){
      $query->addquery('update','dmethods','public_key=?,secret_key=?,ipn=?,account=?','sssss',[check_request('cpm_public_key'),check_request('cpm_secret_key'),check_request('cpm_ipn'),check_request('cpm_merchant_id'),'coinpayments'],'methods=?');
      }
      $_SESSION['payments']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'options/payment']);
  else:
      alerts('payments','do_error');
      alerts('payments','updated');
  endif;
     
 }
 public function do_upwithdraw(){
     
 global $smarty,$query,$dateForm;
  $smarty->assign('withdraws',1);
  if(isset($_POST['up-withdraw'])):
      if(empty(trim(check_request('form_withdraw')))):
      session_acv('withdraws','do_error');
      redirect(['controller' => 'admin', 'action' => 'options/withdraws']);
      endif;

      $query->addquery('update','config','value=?','ss',[check_request('form_withdraw'),'form_withdraw'],'header=?');
      $query->addquery('update','config','value=?','ss',[check_request('min_withdraw'),'min_withdraw'],'header=?');
      $query->addquery('update','config','value=?','ss',[check_request('withdraw_fee'),'withdraw_fee'],'header=?');
      $query->addquery('update','config','value=?','ss',[check_request('fhb_api'),'fhb_api'],'header=?');
      $_SESSION['withdraws']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'options/withdraws']);
  else:
      alerts('withdraws','do_error');
      alerts('withdraws','updated');
  endif;

 }
 public function do_options(){
     
 global $smarty,$query,$info;

  /* generale options */
  
  
  $smarty->assign('options',1);
  if(isset($_POST['up-generale'])):
  
     $query->addquery('update','config','value=?','ss',[check_request('name'),'name'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('site_title'),'site_title'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('site_description'),'site_description'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('account_activate_email'),'account_activate_email'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('keywords'),'keywords'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('user_note'),'user_note'],'header=?');
     $query->addquery('update','config','value=?','ss',[check_request('ref_percent'),'ref_percent'],'header=?');
     $app_data = get_app(check_request('main_domain'),Theme,$info->install,$info->version,$info->id,$info->app,$info->start,$info->update);
      
     if(!empty(check_request('main_domain'))):
       write(CONFIG.'app.php',$app_data,'w');
       $_SESSION['options']['generale']=true;
     else:
       $_SESSION['options']['do_error']=true;
     endif;
      redirect(['controller' => 'admin', 'action' => 'options/index']);

  else:
      alerts('options','generale');
      alerts('options','do_error');
  endif;
  
  /* design options */

  if(isset($_POST['up-design'])):

   if(!empty(check_request('logo_url')) && !empty(check_request('logo_url_home')) && !empty(check_request('icon_url'))):
       
     /*---- img stracture -----*/

     $data = $query->addquery('update','config','value=?','ss',[check_request('logo_url'),'logo_url'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('logo_url_home'),'logo_url_home'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('icon_url'),'icon_url'],'header=?');
     
      $_SESSION['options']['design']=true;
   else:
      $_SESSION['options']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','design');
  endif;
  
  /* interg options */

  if(isset($_POST['up-interg'])):

     $data = $query->addquery('update','config','value=?','ss',[$_POST['head_code'],'head_code'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[$_POST['body_code'],'body_code'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[$_POST['footer_code'],'footer_code'],'header=?');
     $_SESSION['options']['interg']=true;
     redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','interg');
  endif;
     
  /* captcha options */

  if(isset($_POST['up-captcha'])):
 
     $data = $query->addquery('update','config','value=?','ss',[check_request('reCAPTCHA_site_key'),'reCAPTCHA_site_key'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('reCAPTCHA_secret_key'),'reCAPTCHA_secret_key'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('captcha_signup'),'captcha_signup'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('captcha_login'),'captcha_login'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('captcha_forgot'),'captcha_forgot'],'header=?');
     $_SESSION['options']['captcha']=true;
     redirect(['controller' => 'admin', 'action' => 'options/index']);
     
  else:
      alerts('options','captcha');
  endif;
  
  /* faucet options */

  if(isset($_POST['up-faucet'])):

     $data = $query->addquery('update','config','value=?','ss',[check_request('enable_faucet'),'enable_faucet'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('faucet_note'),'faucet_note'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('fc_earn'),'fc_earn'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('fc_timer'),'fc_timer'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('fc_points'),'fc_points'],'header=?');

      $_SESSION['options']['faucet']=true;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','faucet');
  endif;
  
  /* shortlink options */

  if(isset($_POST['up-shortlink'])):

     $data = $query->addquery('update','config','value=?','ss',[check_request('enable_shortlink'),'enable_shortlink'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('short_note'),'short_note'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('st_earn'),'st_earn'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('st_points'),'st_points'],'header=?');

      $_SESSION['options']['shortlink']=true;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','shortlink');
  endif;

  /* offers options */

  if(isset($_POST['up-offers'])):
      
     $data =$query->addquery('update','config','value=?','ss',[check_request('min_points'),'min_points'],'header=?');
     $data =$query->addquery('update','config','value=?','ss',[check_request('enable_ptc'),'enable_ptc'],'header=?');
     $data =$query->addquery('update','config','value=?','ss',[check_request('ptc_note'),'ptc_note'],'header=?');
     $data =$query->addquery('update','config','value=?','ss',[check_request('ptc_earn'),'ptc_earn'],'header=?');
     $data =$query->addquery('update','config','value=?','ss',[check_request('ptc_price'),'ptc_price'],'header=?');
     $data =$query->addquery('update','config','value=?','ss',[check_request('ptc_min'),'ptc_min'],'header=?');
     $data =$query->addquery('update','config','value=?','ss',[check_request('ptc_points'),'ptc_points'],'header=?');

     $data =$query->addquery('update','config','value=?','ss',[check_request('enable_qa'),'enable_qa'],'header=?');
     $data =$query->addquery('update','config','value=?','ss',[check_request('qa_note'),'qa_note'],'header=?');
     $data =$query->addquery('update','config','value=?','ss',[check_request('qa_earn'),'qa_earn'],'header=?');
     $data =$query->addquery('update','config','value=?','ss',[check_request('qa_points'),'qa_points'],'header=?');

      $_SESSION['options']['offers']=true;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','offers');
  endif;
  
  /* system options */

  if(isset($_POST['up-system'])):

     /*---- home stracture -----*/

     $data = $query->addquery('update','config','value=?','ss',[check_request('enable_proxy'),'enable_proxy'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('enable_home_testimonial'),'enable_home_testimonial'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('enable_announcements'),'enable_announcements'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('language'),'language'],'header=?');

      $_SESSION['options']['system']=true;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','system');
  endif;
  

  /* social options */
  
  if(isset($_POST['up-social'])):
 
     $data = $query->addquery('update','config','value=?','ss',[check_request('fb_link'),'fb_link'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('go_link'),'go_link'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('tweet_link'),'tweet_link'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('pin_link'),'pin_link'],'header=?');
     $_SESSION['options']['social']=true;
     redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','social');
  endif;
  
  /* security options */

  if(isset($_POST['up-security'])):

     $data = $query->addquery('update','config','value=?','ss',[check_request('enable_captcha'),'enable_captcha'],'header=?');
     $data = $query->addquery('update','config','value=?','ss',[check_request('reCAPTCHA_site_key'),'reCAPTCHA_site_key'],'header=?');

   if($data):
      $_SESSION['options']['security']=true;
   elseif(!$data):
      $_SESSION['options']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => 'options/index']);
  else:
      alerts('options','security');
  endif;
     
 }
 public function do_upcrn(){
     
 global $smarty,$query;

  if(isset($_POST['up-options'])):

      $query->addquery('update','currencies','name=?,symbol=?','ssi',[check_request('method'),check_request('symbol'),$_GET['id']],'id=?');
      $_SESSION['options']['updated']=true;
      redirect(['controller' => 'admin', 'action' => 'options/payment']);
  else:
      alerts('options','do_error');
      alerts('options','required');
  endif;
     
 }
 public function do_login(){
 
 global $query,$user,$smarty;

 /* check logged in users */

 if(islogged):
  $this->role($user->role,$user->username);
 endif;

 if($this->do_post($this->do_arrp('login','username','password'),'*','login')){

   if(reCaptcha(do_config(5)) == true || do_config(27) == '2'){

     $data = $query->addquery('select','members','*','s',check_request('username'),'username=?');

    /* check user status */
    if($data->status == '2'):
       session_acv('sign','pending');
       redirect(['action' => 'signin']);
    elseif($data->status == '3'):
       session_acv('sign','banned');
       redirect(['action' => 'signin']);
    endif;

    /* check correct fields */
    if($data->password == check_request('password','md5')):
       $this->forcelogged($data->id);
       $query->addquery('update','members','login_ip=?','si',[get_ip(),$data->id],'id=?');
       $this->role($data->role,check_request('username'));
    else:
      session_acv('sign','invalid');
      redirect(['action' => 'signin']);
    endif;

   }elseif(reCaptcha(do_config(5)) == false && do_config(27) == '1'){
     session_acv('sign','recaptcha');
     redirect(['action' => 'signin']);
   }
 
 }else{
   alerts('sign','express_login');
   alerts('sign','pending');
   alerts('sign','banned');
   alerts('sign','invalid');
   alerts('sign','recaptcha');
   alerts('sign','activated');
   alerts('sign','token_wrong');
   alerts('login','required');
   alerts('success','expired');
 }
 
}
 public function do_signup(){
 global $smarty,$query,$dateForm;
 
  $arr = $this->do_arrp('register','username,password,passwordcheck,email');

 if ($this->do_post($arr,'*','register')){
  
   if(reCaptcha(do_config(5)) == true || do_config(26) == '2'){
     if(preg_match('/\s/',check_request('username'))){
        session_acv('signup','whitespace');
        redirect(['action' => 'signup']);
     }if($this->find((object)['word' => check_request('email',false,'email'),'role' => 'email'])){
        session_acv('signup','rep_email');
        redirect(['action' => 'signup']);
     }if(check_request('password','md5') != check_request('passwordcheck','md5')){
        session_acv('signup','passwords');
        redirect(['action' => 'signup']);
     }if($this->find((object)['word' => check_request('username'),'role' => 'username'])){
       session_acv('signup','rep_username');
       redirect(['action' => 'signup']);
     }

   $username = check_request('username');
   $pass = check_request('password','md5');
   $email = check_request('email',false,'email');
   $recover = check_request('password','base64_encode');

   if(isset($_COOKIE['r']) && !empty(trim($_COOKIE['r']))) {
   $member = $query->addquery('select','members','id','s',$_COOKIE['r'],'username=?');
   $data = $query->addquery('insert','members','username,password,email,parent_id,recover,register_ip,created','sssisss',[$username,$pass,$email,$member->id,$recover,get_ip(),$dateForm]);
   $data = $query->addquery('insert','notifications','user_id,title,type,created','isss',[$member->id,'New referral has been singup','referral',$dateForm]);
   } else {
   $data = $query->addquery('insert','members','username,password,email,recover,register_ip,created','ssssss',[$username,$pass,$email,$recover,get_ip(),$dateForm]);
   }

   if(do_config(23) == '2'){
     session_acv('sign','express_login');
     redirect(['action' => 'signin']);
   }elseif(do_config(23) == '1'){
   
   $genToken = $this->genToken(16);
   $mail_encode = check_request('email','base64_encode');
   $query->addquery('update','members','status=?,token=?','isi',['2',$genToken,$data],'id=?');
   $this->do_maildata('activate',$username,'<a href="'.HOST.'verify/'.$genToken.'/">Confirm Your Address</a>');
   mailer(['from'=> do_config(48),'to'=> $email,'subject' => 'Confirm Your Account at '.do_config(0),'msg'=> fetch('Admin/Mailer/index')]);
      session_acv('signup','mail_sent');
      redirect(['action' => 'signup']);
 }
 
 }elseif(reCaptcha(do_config(5)) == false && do_config(27) == '1'){
   session_acv('sign','recaptcha');
   redirect(['action' => 'signup']);
  }
 }else{
 alerts('signup','rep_email');
 alerts('signup','passwords');
 alerts('signup','rep_username');
 alerts('signup','mail_sent');
 alerts('signup','recaptcha');
 alerts('register','required');
 }
}
 public function do_verify_mail(){
    
 global $query;
 
 if(!isset($_GET['id']) || empty(trim($_GET['id']))):
  $this->do_404();
 endif;

 $data = $query->addquery('select','members','*','s',$_GET['id'],'token=?');

  if(!$data):
    $_SESSION['sign']['token_wrong']=true;
    redirect(['action' => 'signin']);
  elseif($_GET['id'] == $data->token):
    $query->addquery('update','members','token=?,status=?','sis',['','1',$data->token],'token=?');
    $_SESSION['sign']['activated']=true;
    redirect(['action' => 'signin']);
  endif;
 
 }
 public function do_ref(){
    
 global $query;
 
 if(!isset($_GET['r']) || empty(trim($_GET['r']))):
  $this->do_404();
 endif;

 $data = $query->addquery('select','members','*','s',$_GET['r'],'username=?');

  if($data):
    setcookie('r', trim($_GET['r']), time() + (86400 * 30), "/");
    redirect(['action' => 'signup']);
  else:
    redirect(['action' => '']);
  endif;
 
 }
 public function do_forgot_password(){
    
 global $query,$user,$smarty;
 
 /* check logged in users */

 if(islogged):
  $this->role($user->role,$user->username);
 endif;

 $this->do_winfo('FORGOT_YOUR_PASSWORD');

 if(isset($_GET['id'])){

 $rec_token = $_GET['id'];
 $data = $query->addquery('select','members','*','s',$rec_token,'token=?');

 if(!$data):
  $_SESSION['gpass']['inrecover']=true;
  redirect(['action' => 'forgot-password']);
 endif;

  if($rec_token == $data->token){

    $query->addquery('update','members','token=?','ss',['',$data->id],'id=?');
    $this->do_maildata('gpass',$data->first_name,base64_decode($data->recover));
    mailer(['from'=> do_config(48),'to'=>$data->email,'subject' =>'Your Password '.do_config(0),'msg'=>fetch('Admin/Mailer/index')]);
    $_SESSION['gpass']['recovered']=true;
    redirect(['action' => 'forgot-password']);

  }

 }else{
  alerts('gpass','recovered');
  alerts('gpass','inrecover');
 }


 if($this->do_post($this->do_arrp('rec','username'),'*','rec')){

  if (empty(trim(do_config(12)))):
      errorAndDie('Administration not specified their email');
  endif;
   
   if(reCaptcha(do_config(5)) == true || do_config(28) == '2'){

     $data = $query->addquery('select','members','*','s',check_request('username'),'username=?');

    /* look for user */
     if(!$data):
       session_acv('fpass','not_found');
       redirect(['action' => 'forgot-password']);
     endif;

    $rec_token = $this->genToken(16);
    $query->addquery('update','members','token=?','ss',[$rec_token,check_request('username')],'username=?');
    $this->do_maildata('recover',$data->first_name,'<a href="'.HOST.'forgot-password/'.$rec_token.'/">Confirm</a>');
   
    mailer([
        'from'=> do_config(48),
        'to'=>$data->email,
        'subject' =>'Confirm Password Recover',
        'msg'=>fetch('Admin/Mailer/index')]);
        
    session_acv('fpass','sent');
    redirect(['action' => 'forgot-password']);

   }elseif(reCaptcha(do_config(5)) == false && do_config(28) == '1'){
     session_acv('fpass','recaptcha');
     redirect(['action' => 'forgot-password']);
   }
 
 }else{
   alerts('fpass','sent');
   alerts('fpass','not_found');
   alerts('fpass','recaptcha');
   alerts('rec','required');
 }
 
 
 }
 public function do_username($id){
 
 global $query;
 
 $do = $query->addquery('select','members','username','i', $id,'id=?');
 return $do->username;
 
 }
 public function do_userinfo($id){
 
 global $query;
 
 $do = $query->addquery('select','members','*','i', $id,'id=?');
 
 return $do;
 
 }
 public function do_testimonial($m){
 
 global $smarty,$query;
 
 switch($m):
 
  case 'limit':
      
   $data = $query->addquery('fetch','testimonials','*','i',1,'status=?');
 
  break;

  case 'fetch':
      
   $data = $query->limit('testimonials','*','id','desc','0,8','i','1','status=?');

  break;

 endswitch;
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'name'=>$res['name'],'avatar'=>$res['image'],'content'=>$res['content'],'job'=>$res['job']);

 array_push($with,$arr);

 endwhile;

 $smarty->assign('testimonial',$with);

}
 public function do_ptcs(){
 
 global $smarty,$query,$result;
 
  $data = $query->limit('offers','*','id','desc',$result['start'].','.$result['perpage'],'s','ptc','type=?');
  $with = array();
  while($res=$data->fetch_assoc()):
  $arr=array('id'=>$res['id'],'name'=>$res['name'],'timer'=>$res['timer'],'description'=>$res['details'],'url'=>parse_url($res['url'], PHP_URL_HOST),'clicks'=>$res['clicks'],'current_clicks'=>$res['current_clicks'],'status'=>$res['status'],'created'=>$res['created']);
  array_push($with,$arr);
  endwhile;
  $smarty->assign('ptclinks',$with);

 paging($result['screen']+1,ceil($query->num_rows('offers','*','s','ptc','type=?')/$result['perpage'])+1,'?p=');
 alerts('ptc','updated');
 alerts('ptc','added');

}
 public function do_shorts(){
 
 global $smarty,$query,$result;
 
 $data = $query->limit('shortlinks','*','position','asc',$result['start'].','.$result['perpage']);

 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'name'=>$res['name'],'description'=>$res['description'],'api'=>$res['api'],'url'=>$res['url'],'count_ip'=>$res['count_ip'],'status'=>$res['status'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;
  $smarty->assign('shortlinks',$with);

 paging($result['screen']+1,ceil($query->num_rows('shortlinks','*')/$result['perpage'])+1,'?p=');
 alerts('short','updated');
 alerts('short','added');

}
 public function do_ptclaims(){
 
 global $smarty,$query,$result;
 
 $data = $query->limit('claims','*','id','desc',$result['start'].','.$result['perpage'],'s','ptc','type=?');

 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'verify_key'=>$res['verify_key'],'provider'=>$res['details'],'amount'=>$res['amount'],'status'=>$res['status'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;
  $smarty->assign('claims',$with);

 paging($result['screen']+1,ceil($query->num_rows('claims','*','s','ptc','type=?')/$result['perpage'])+1,'?p=');
}
 public function do_shortclaims(){
 
 global $smarty,$query,$result;
 
 $data = $query->limit('claims','*','id','desc',$result['start'].','.$result['perpage'],'s','shortlink','type=?');

 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'verify_key'=>$res['verify_key'],'provider'=>$res['details'],'amount'=>$res['amount'],'status'=>$res['status'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;
  $smarty->assign('claims',$with);

 paging($result['screen']+1,ceil($query->num_rows('claims','*','s','shortlink','type=?')/$result['perpage'])+1,'?p=');
}
 public function do_fclaims(){
 
 global $smarty,$query,$result;
 
 $data = $query->limit('claims','*','id','desc',$result['start'].','.$result['perpage'],'s','faucet','type=?');

 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'key'=>$res['verify_key'],'amount'=>$res['amount'],'status'=>$res['status'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;
  $smarty->assign('claims',$with);

 paging($result['screen']+1,ceil($query->num_rows('claims','*','s','faucet','type=?')/$result['perpage'])+1,'?p=');
}
 public function do_withdraws($r=false){
 
 global $smarty,$query,$result,$user;
 if($r):
  $data=$query->limit('withdraws','*','id','desc',$result['start'].','.$result['perpage'],'i',$user->id,'user_id=?');
  paging($result['screen']+1,ceil($query->num_rows('withdraws','*','i',$user->id,'user_id=?')/$result['perpage'])+1,'?p=');
 else:
     
  if(isset($_GET['search'])){
      $search = trim($_GET['search']);
      $input = trim($_GET['data']);
      $smarty->assign('data',$input);
      $smarty->assign('search',$search);
      $data=$query->limit('withdraws','*','id','desc',$result['start'].','.$result['perpage'],'s',$input,$search.'=?');
      paging($result['screen']+1,ceil($query->num_rows('withdraws','*','s',$input,$search.'=?')/$result['perpage'])+1,'?search='.$search.'&data='.$input.'&p=');
 } else {
    $data = $query->limit('withdraws','*','id','desc',$result['start'].','.$result['perpage']);
    paging($result['screen']+1,ceil($query->num_rows('withdraws','*')/$result['perpage'])+1,'?p=');
 }
 endif;
 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'method'=>$res['method'],'processor'=>$res['processor'],'address'=>$res['address'],'amount'=>$res['amount'],'status'=>$res['status'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;
 $smarty->assign('withdraws',$with);

 if(isset($_SESSION["fhb_msg"])):
  $smarty->assign('fhb_msg',$_SESSION["fhb_msg"]);
 endif;
   alerts('withdraw','complete');

 if($this->do_post($this->do_arrp('wform','id','role'),'*','wform')){
     $data = $query->addquery('select','withdraws','*','i',check_request('id'),'id=?');

    /* look for ID */
     if(!$data):
       session_acv('wform','not_found');
       redirect(['controller' => 'admin','action' => 'withdraws/index']);
     endif;
     if(check_request('role') == 'complete') {
                     //var_export(do_config(6));exit;
         if(do_config(6) == 'fhb') {
           require(FHB.'faucethub.php');
           $faucethub = new FaucetHub(do_config(10), do_config(16));
           /* To send amount in (satoshi) to address */
           $result = $faucethub->send($data->address, $this->btc_to_satoshi($data->amount));
           $_SESSION["fhb_msg"] = $result["html"];
           session_acv('wform','check');
           
           if($result["success"] === true) {   # you can check if it was successful
              $query->addquery('update','withdraws','status=?','ii',['3',$data->id],'id=?');
              $query->addquery('insert','notifications','user_id,title,type,created','isss',[$data->user_id,'Withdraw #'.$data->id.' Has been Paid!','withdraw',$dateForm]);
           }
         } else { 
           $query->addquery('update','withdraws','status=?','ii',['3',$data->id],'id=?');
           $query->addquery('insert','notifications','user_id,title,type,created','isss',[$data->user_id,'Withdraw #'.$data->id.' Has been Paid!','withdraw',$dateForm]);
           session_acv('wform','completed');
         }
     } elseif(check_request('role') == 'approve') {
           $query->addquery('update','withdraws','status=?','ii',['2',$data->id],'id=?');
           session_acv('wform','approved');
     } elseif(check_request('role') == 'cancel') {
           $query->addquery('update','withdraws','status=?','ii',['4',$data->id],'id=?');
           session_acv('wform','canceled');
     }
     redirect(['controller' => 'admin','action' => 'withdraws/index']);
 
 }else{
   alerts('wform','not_found');
   alerts('wform','check');
   alerts('wform','approved');
   alerts('wform','completed');
   alerts('wform','canceled');
   alerts('wform','required');
 }

}
 public function do_currencies($r){
 
 global $smarty,$query;
 
 if($r==1):
 $data = $query->addquery('fetch','currencies','*','i',1,'status=?');
 elseif($r==2):
 $data = $query->addquery('fetch','currencies','*');
 endif;
 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'name'=>$res['name'],'symbol'=>$res['symbol'],'status'=>$res['status'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;
 $smarty->assign('currencies',$with);

}
 public function do_members(){

 global $smarty,$query,$result;

 if(isset($_GET['search'])){
  $search = trim($_GET['search']);
  $input = trim($_GET['data']);
  $smarty->assign('data',$input);
  $smarty->assign('search',$search);
  $data = $query->limit('members','*','id','desc',$result['start'].','.$result['perpage'],'s',$input,$search.'=?');
  paging($result['screen']+1,ceil($query->num_rows('members','*','s',$input,$search.'=?')/$result['perpage'])+1,'&p=');
 } else {
    $data = $query->limit('members','*','id','desc',$result['start'].','.$result['perpage']);
    paging($result['screen']+1,ceil($query->num_rows('members','*')/$result['perpage'])+1,'index?p=');
 }
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'role'=>$res['role'],'status'=>$res['status'],'username'=>$res['username'],'email'=>$res['email'],'login_ip'=>$res['login_ip'],'register_ip'=>$res['register_ip'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('members',$with);
 alerts('users','updated');

}
 public function do_referrals(){

 global $smarty,$query,$result;

  $data = $query->limit('members','*','id','desc',$result['start'].','.$result['perpage'],'s',"",'parent_id<>?');
  paging($result['screen']+1,ceil($query->num_rows('members','*','s',"",'parent_id<>?')/$result['perpage'])+1,'?p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'status'=>$res['status'],'username'=>$res['username'],'email'=>$res['email'],'parent_id'=>$this->do_user($res['parent_id'])->username,'parent_login_ip'=>$this->do_user($res['parent_id'])->login_ip,'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('referrals',$with);

}
 public function do_topusers(){

 global $smarty,$query,$result;

  $data = $query->limit('members','*','balance','desc',$result['start'].','.$result['perpage'],'s',$this->balance,'balance<>?');
  paging($result['screen']+1,ceil($query->num_rows('members','*','s',$this->balance,'balance<>?')/$result['perpage'])+1,'?p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'status'=>$res['status'],'username'=>$res['username'],'balance'=>$res['balance'],'ref'=>$res['referral_earnings'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('topusers',$with);

}
 public function do_banlist(){

 global $smarty,$query,$result;

  $data = $query->limit('banlist','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('banlist','*')/$result['perpage'])+1,'index?p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'ip_address'=>$res['ip_address'],'reason'=>$res['reason'],'status'=>$res['status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('banlist',$with);
 alerts('ip','added');

 }
 public function do_invoices($role=false){

 global $smarty,$query,$result,$user;
 
 if(!$role):
  if(isset($_GET['search'])){
      $search = trim($_GET['search']);
      $input = trim($_GET['data']);
      $smarty->assign('data',$input);
      $smarty->assign('search',$search);
      $data=$query->limit('invoice','*','id','desc',$result['start'].','.$result['perpage'],'s',$input,$search.'=?');
      paging($result['screen']+1,ceil($query->num_rows('invoice','*','s',$input,$search.'=?')/$result['perpage'])+1,'?search='.$search.'&data='.$input.'&p=');
  } else {
    $data = $query->limit('invoice','*','id','desc',$result['start'].','.$result['perpage']);
    paging($result['screen']+1,ceil($query->num_rows('invoice','*')/$result['perpage'])+1,'?p=');
  }
 else:
  $data = $query->limit('invoice','*','id','desc',$result['start'].','.$result['perpage'],'i',$user->id,'user_id=?');
  paging($result['screen']+1,ceil($query->num_rows('invoice','*','i',$user->id,'user_id=?')/$result['perpage'])+1,'?p=');
 endif;
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'user_id'=>$res['user_id'],'status_text'=>$res['status_text'],'username'=>$this->do_username($res['user_id']),'amount'=>$res['amount'],'method'=>$res['method'],'status'=>$res['status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('invoices',$with);

}
 public function do_orders(){

 global $smarty,$query,$result,$user;
 
  $data = $query->limit('offers','*','id','desc',$result['start'].','.$result['perpage'],'is',"$user->id,ptc",'user_id=?,type=?');
  paging($result['screen']+1,ceil($query->num_rows('offers','*','is',"$user->id,ptc",'user_id=?,type=?')/$result['perpage'])+1,'orders?p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'name'=>$res['name'],'timer'=>$res['timer'],'url'=>parse_url($res['url'], PHP_URL_HOST),'clicks'=>$res['clicks'],'current_clicks'=>$res['current_clicks'],'status'=>$res['status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('orders',$with);

}
 public function do_transactions(){

 global $smarty,$query,$result;

  if(isset($_GET['search'])){
      $search = trim($_GET['search']);
      $input = trim($_GET['data']);
      $smarty->assign('data',$input);
      $smarty->assign('search',$search);
      $data=$query->limit('payments','*','id','desc',$result['start'].','.$result['perpage'],'s',$input,$search.'=?');
      paging($result['screen']+1,ceil($query->num_rows('payments','*','s',$input,$search.'=?')/$result['perpage'])+1,'?search='.$search.'&data='.$input.'&p=');
  } else {
      $data = $query->limit('payments','*','id','desc',$result['start'].','.$result['perpage']);
      paging($result['screen']+1,ceil($query->num_rows('payments','*')/$result['perpage'])+1,'?p=');
  }

 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'user_id'=>$res['user_id'],'username'=>$this->do_username($res['user_id']),'txn_id'=>$res['txn_id'],'item_number'=>$res['item_number'],'payment_gross'=>$res['payment_gross'],'crypto_am'=>$res['crypto_am'],'currency_code'=>$res['currency_code'],'type'=>$res['type'],'payment_status'=>$res['payment_status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('transactions',$with);

}
 public function do_testimonials(){

 global $smarty,$query,$result;
 
  $data = $query->limit('testimonials','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('testimonials','*')/$result['perpage'])+1,'index&p=');
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'name'=>$res['name'],'image'=>$res['image'],'status'=>$res['status'],'created'=>$res['created']);
 
 array_push($with,$ar);

 endwhile;

 $smarty->assign('testimonials',$with);
 alerts('testimonials','updated');
 alerts('testimonials','added');
}
 public function do_announcements($role=false){

 global $smarty,$query,$result;
 
 if($role):
  $data = $query->addquery('fetch','announcements','*','i','1','status=?');
 else:
  $data = $query->limit('announcements','*','id','desc',$result['start'].','.$result['perpage']);
  paging($result['screen']+1,ceil($query->num_rows('announcements','*')/$result['perpage'])+1,'index?p=');
  alerts('announcements','added');
  alerts('announcements','updated');
 endif;
 
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $ar=array('id'=>$res['id'],'title'=>$res['title'],'content'=>$res['content'],'status'=>$res['status'],'created'=>$res['created'],'ago'=>$this->ago($res['ago']));
 
 array_push($with,$ar);

 endwhile;
 
 $smarty->assign('announcements',$with);

}
 public function do_notifications($r=false){

 global $smarty,$query,$result,$user;
 
 $data = $query->limit('notifications','*','id','desc','0,5','ii',"1,$user->id",'status=?,user_id=?');
 $with = array();
 
 while($res=$data->fetch_assoc()):
 $ar=array('id'=>$res['id'],'title'=>$res['title'],'type'=>$res['type'],'details'=>$res['details'],'status'=>$res['status'],'created'=>$res['created'],'ago'=>$this->ago($res['ago']));
 array_push($with,$ar);
 endwhile;
 $notifications_num = $query->num_rows('notifications','*','iii',"2,1,$user->id",'isread=?,status=?,user_id=?');

 if($r):
  $smarty->assign('notif_index',$with);
  $query->addquery('update','notifications','isread=?','iii',[1,1,$user->id],'status=?,user_id=?');
  paging($result['screen']+1,ceil($query->num_rows('notifications','*','ii',"1,$user->id",'status=?,user_id=?')/$result['perpage'])+1,'notifications?p=');
 else:
  $smarty->assign('notifications',$with);
  $smarty->assign('notifications_num',$notifications_num);
 endif;
}
 public function do_ads(){
 
 global $smarty,$query,$result;
      
   $data = $query->limit('ads','*','id','desc',$result['start'].','.$result['perpage']);
   paging($result['screen']+1,ceil($query->num_rows('ads','*')/$result['perpage'])+1,'index?p=');
   alerts('ads','added');
   alerts('ads','updated');
   
 $with = array();
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'name'=>$res['name'],'size'=>$res['size'],'type'=>ucwords($res['type']),'status'=>$res['status'],'created'=>$res['created']);

 array_push($with,$arr);

 endwhile;

 $smarty->assign('ads',$with);

}
 public function do_pages($role=false){
 
 global $smarty,$query,$result;
      
   if($role):
   $data = $query->limit('pages','*','id','desc',$result['start'].','.$result['perpage']);
   paging($result['screen']+1,ceil($query->num_rows('pages','*')/$result['perpage'])+1,'index?p=');
   alerts('pages','added');
   alerts('pages','updated');
   else:
   $data = $query->limit('pages','*','id','desc','0,7','ii','2,1','protect=?,status=?');
   endif;
   
 $with = array();
 
 while($res=$data->fetch_assoc()):
    
 $arr=array('id'=>$res['id'],'title'=>$res['title'],'status'=>$res['status'],'protect'=>$res['protect'],'created'=>$res['created']);

 array_push($with,$arr);

 endwhile;

 if(!endsWith(ACCESS, 'pages/add')):
     
 $smarty->assign('pages',$with);

 endif;

}
 public function do_protected_pages(){
 
 global $smarty,$query,$result;
      
   $data = $query->limit('pages','*','id','desc','0,7','ii','1,1','protect=?,status=?');
   
 $with = array();
 while($res=$data->fetch_assoc()):
 $arr=array('id'=>$res['id'],'title'=>$res['title'],'status'=>$res['status'],'protect'=>$res['protect'],'created'=>$res['created']);
 array_push($with,$arr);
 endwhile;

 $smarty->assign('protected',$with);

}
 public function do_themes($role=false){
 
 global $smarty,$query,$result;
      
 $data = $query->limit('themes','*','id','asc','0,8');
 paging($result['screen']+1,ceil($query->num_rows('themes','*')/8)+1,'themes?p=');

 $with = array();
 
 while($res=$data->fetch_assoc()){

 $ar=array('id'=>$res['id'],'name'=>$res['name'],'status'=>$res['status'],'created'=>$res['created']);

 array_push($with,$ar);

 }

 $smarty->assign('themes',$with);

}
 public function do_activate($r,$a){
 
 global $smarty,$query,$info,$dateForm;
      
 if( isset($_POST['activate'])){

   if($r == 'invoice'){
   $invoice = $query->addquery('select',$r,'*','i',check_request('id',false,'int'),'id=?');
   $data = $query->addquery('update',$r,'status=?','ii',[1,check_request('id',false,'int')],'id=?');
   $data = $query->addquery('update','members','advertising_balance=advertising_balance+?','si',[$invoice->amount,$invoice->user_id],'id=?');
   $data = $query->addquery('insert','notifications','user_id,title,type,created','isss',[$invoice->user_id,'Deposit of '.$invoice->amount.do_config(16).' has been credited','order',$dateForm]);
   }elseif($r == 'themes'){
   $data = $query->addquery('update',$r,'status=?','ii',[1,check_request('id',false,'int')],'id=?');
   write(CONFIG.'app.php',get_app($HOST,check_request('name'),$info->install,$info->version,$info->id,$info->app,$info->start,$info->update),'w');
   }elseif($r == 'ptc'){
   $data = $query->addquery('update','offers','status=?','isi',[1,$r,check_request('id',false,'int')],'type=?,id=?');
   }elseif($r == 'claims'){
   $data = $query->addquery('update',$r,'status=?','ii',[1,check_request('id',false,'int')],'id=?');
   $data = $query->addquery('update','members','balance=balance+?','si',[check_request('amount'),check_request('user_id')],'id=?');
   }else{
   $data = $query->addquery('update',$r,'status=?','ii',[1,check_request('id',false,'int')],'id=?');
   }
   
   if($data){
      $_SESSION['activate']['activated']=true;
   }elseif(!$data){
      $_SESSION['activate']['do_error']=true;
   }
      redirect(['controller' => 'admin', 'action' => $a]);
 }else{
      alerts('activate','activated');
      alerts('activate','do_error');
 }
   
 }
 public function do_deactivate($r,$a){
 
 global $smarty,$query;
      
 if( isset($_POST['deactivate'])){
   if($r == 'ptc'){
   $data = $query->addquery('update','offers','status=?','isi',[2,$r,check_request('id',false,'int')],'type=?,id=?');
   }elseif($r == 'claims'){
   $data = $query->addquery('update',$r,'status=?','ii',[2,check_request('id',false,'int')],'id=?');
   $data = $query->addquery('update','members','balance=balance-?','si',[check_request('amount'),check_request('user_id')],'id=?');
   }else{
   $data = $query->addquery('update',$r,'status=?','ii',[2,check_request('id',false,'int')],'id=?');
   }

   if($data):
      $_SESSION['deactivate']['deactivated']=true;
   elseif(!$data):
      $_SESSION['deactivate']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => $a]);
 }else{
      alerts('deactivate','deactivated');
      alerts('deactivate','do_error');
 }
   
 }
 public function do_delete($r,$a){
 
 global $smarty,$query;
      
 if(isset($_POST['delete'])):

     if($r == 'themes'):
      $data = $query->addquery('delete',$r,false,'i',check_request('id',false,'int'),'id=?');
      delete_files(WWW_ROOT.'template'.DS.check_request('name'));
     elseif($r == 'ptc'):
      $data = $query->addquery('delete','offers',false,'i',check_request('id',false,'int'),'id=?');
     elseif($r == 'qa'):
      $data = $query->addquery('delete','offers',false,'i',check_request('id',false,'int'),'id=?');
     else:
      $data = $query->addquery('delete',$r,false,'i',check_request('id',false,'int'),'id=?');
     endif;

      $_SESSION['delete']['deleted']=true;
      redirect(['controller' => 'admin', 'action' => $a]);
 else:
      alerts('delete','deleted');
 endif;
   
 }
 public function do_complete($r,$a){
 
 global $smarty,$query;
      
 if( isset($_POST['completed'])):
   $data = $query->addquery('update',$r,'status=?','ii',[3,check_request('id',false,'int')],'id=?');
   if($data):
      $_SESSION['complete']['completed']=true;
   elseif(!$data):
      $_SESSION['complete']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => $a]);
 else:
      alerts('complete','completed');
      alerts('complete','do_error');
 endif;
   
 }
 public function do_cancel($r,$a){
 
 global $smarty,$query;
      
 if( isset($_POST['canceled'])):
   $data = $query->addquery('update',$r,'status=?','ii',[4,check_request('id',false,'int')],'id=?');
   if($data):
      $_SESSION['cancel']['canceled']=true;
   elseif(!$data):
      $_SESSION['cancel']['do_error']=true;
   endif;
      redirect(['controller' => 'admin', 'action' => $a]);
 else:
      alerts('cancel','canceled');
      alerts('cancel','do_error');
 endif;
   
 }
 public function do_build($i,$n){
 
  if(isset($_GET['p']) && !empty($_GET['p'])):
   $build = 'item'.DS.$i.DS.$this->TitleBuild($n).DS.'&p='.$_GET['p'];
  else:
   $build = 'item'.DS.$i.DS.$this->TitleBuild($n).DS;
  endif;
 
   return $build;
 }
 public function do_adduser(){

 global $query,$dateForm;

 /* add user */
 
 $since = date("F").' '.date("Y");
 
 $arr = $this->do_arrp('add-user','role,status,username,password,email');
 
 if ($this->do_post($arr,'*','add-user')){
 
   if($this->find((object)['word' => check_request('email',false,'email'),'role' => 'email']) || $this->find((object)['word' => check_request('username'),'role' => 'username'])):
    session_acv('add_user','do_exist');
    redirect(['action' => 'admin/users/add']);
   endif;
 
 $data = $query->addquery('insert','members','role,status,username,password,email,recover,created','sisssss',[check_request('role'),check_request('status'),check_request('username'),check_request('password','md5'),check_request('email',false,'email'),check_request('password','base64_encode'),$dateForm]);

  if(!$data):
   session_acv('add_user','do_error');
   redirect(['action' => 'admin/users/add']);
  endif;

   session_acv('users','added');
   redirect(['action' => 'admin/users/index']);

 }
 
 else{

 alerts('add_user','do_error');
 alerts('add_user','do_exist');
 alerts('add-user','required');
 
  }
 }
 public function do_addshort(){

 global $query,$dateForm;

 /* add categoey */
 
 $arr = $this->do_arrp('add-short','name,api,url,credit,position,count_ip');
 
 if ($this->do_post($arr,'*','add-short')){
 
 $data = $query->addquery('insert','shortlinks','name,description,api,url,credit,position,count_ip,created','sssssiis',[check_request('name'),check_request('description'),check_request('api'),check_request('url'),check_request('credit'),check_request('position'),check_request('count_ip'),$dateForm]);

  if(!$data):
   session_acv('add_short','do_error');
   redirect(['action' => 'admin/shortlinks/add']);
  endif;

   session_acv('short','added');
   redirect(['action' => 'admin/shortlinks/index']);

 }
 
 else{

 alerts('add_short','do_error');
 alerts('add-short','required');
 
  }
 }
 public function do_addptc(){

 global $query,$dateForm,$user;

 /* add ptc */
 
 $arr = $this->do_arrp('add-ptc','name,url,timer,clicks');
 
 if ($this->do_post($arr,'*','add-ptc')){
 
 $data = $query->addquery('insert','offers','user_id,type,name,details,url,timer,clicks,created','isssssss',[$user->id,'ptc',check_request('name'),check_request('description'),check_request('url'),check_request('timer'),check_request('clicks'),$dateForm]);

  if(!$data):
   session_acv('add_ptc','do_error');
   redirect(['action' => 'admin/ptc/add']);
  endif;

   session_acv('ptc','added');
   redirect(['action' => 'admin/ptc/index']);

 }
 
 else{

 alerts('add_ptc','do_error');
 alerts('add-ptc','required');
 
  }
 }
 public function do_addip(){
     global $query,$dateForm,$user;
     
  /* add ip */
  
  if ($this->do_post($this->do_arrp('add-ip','ip,reason,status'),'*','add-ip')){
      
      $data = $query->addquery('insert','banlist','ip_address,reason,status,created','ssis',[check_request('ip'),check_request('reason'),check_request('status'),$dateForm]);
      if(!$data){
          session_acv('add_ip','do_error');
          redirect(['action' => 'admin/banlist/add']);
      }
      session_acv('ip','added');
      redirect(['action' => 'admin/banlist/index']);
 }
 
 else{

 alerts('add_ip','do_error');
 alerts('add-ip','required');
 
  }
 }
 public function do_addqa(){

 global $query,$dateForm,$user;

 /* add qa */
 
 $arr = $this->do_arrp('add-qa','method,question,answer');
 
 if ($this->do_post($arr,'*','add-qa')){
 
 $data = $query->addquery('insert','offers','user_id,type,name,details,url,method,created','issssss',[$user->id,'qa',check_request('question'),check_request('answers'),check_request('answer'),check_request('method'),$dateForm]);

  if(!$data):
   session_acv('add_qa','do_error');
   redirect(['action' => 'admin/qa/add']);
  endif;

   session_acv('qa','added');
   redirect(['action' => 'admin/qa/index']);

 }
 
 else{

 alerts('add_qa','do_error');
 alerts('add-qa','required');
 
  }
 }
 public function do_addtestimonial(){

 global $query,$dateForm;

 /* add testimonial */
 
 if($this->do_post($this->do_arrp('add-testimonial','name,job,content'),'*','add-testimonial')){
 
      //UPLOAD AVATAR
     
    $this->files([
      'photo' => $_FILES["photo"],
      'error' => $_FILES["photo"]["error"],
      'path' => 'template/uploads/images/testimonial_',
      'controller' => 'admin', 
      'action' => 'testimonials/add'
      ],'photo');

 $data = $query->addquery('insert','testimonials','name,job,content,image,created','sssss',[check_request('name'),check_request('job'),check_request('content'),$this->img(),$dateForm]);

  if(!$data):
   session_acv('add_testimonial','do_error');
   redirect(['action' => 'admin/testimonials/add']);
  endif;

   session_acv('testimonials','added');
   redirect(['action' => 'admin/testimonials/index']);

 }
 
 else{

 alerts('add_testimonial','do_error');
 alerts('add-testimonial','required');
 
  }
 }
 public function do_addannoce(){

 global $query,$dateForm;

 /* add announcement */
 
 if($this->do_post($this->do_arrp('add-announcement','title,content'),'*','add-announcement')){

 $data = $query->addquery('insert','announcements','title,content,created','sss',[check_request('title'),$_POST['content'],$dateForm]);

  if(!$data):
   session_acv('add_announcement','do_error');
   redirect(['action' => 'admin/testimonials/add']);
  endif;

   session_acv('announcements','added');
   redirect(['action' => 'admin/announcements/index']);

 }
 
 else{

 alerts('add_announcement','do_error');
 alerts('add-announcement','required');
 
  }
 }
 public function do_addads(){

 global $query,$dateForm;

 /* add ads */
 
 if($this->do_post($this->do_arrp('add-ads','type,size,code'),'*','add-ads')){

 $data = $query->addquery('insert','ads','type,name,size,code,created','sssss',[check_request('type'),check_request('name'),check_request('size'),base64_encode($_POST['code']),$dateForm]);

  if(!$data):
   session_acv('add_ads','do_error');
   redirect(['action' => 'admin/ads/add']);
  endif;

   session_acv('ads','added');
   redirect(['action' => 'admin/ads/index']);

 }
 
 else{

 alerts('add_ads','do_error');
 alerts('add-ads','required');
 
  }
 }
 public function do_addpage(){

 global $query,$dateForm;

 /* add page */
 
 if($this->do_post($this->do_arrp('add-page','title,content'),'*','add-page')){

 $data = $query->addquery('insert','pages','title,content,short,created','ssss',[check_request('title'),$_POST['content'],$this->limit_text(check_request('content'),30),$dateForm]);

  if(!$data):
   session_acv('add_page','do_error');
   redirect(['action' => 'admin/pages/add']);
  endif;

   session_acv('pages','added');
   redirect(['action' => 'admin/pages/index']);

 }
 
 else{

 alerts('add_page','do_error');
 alerts('add-page','required');
 
  }
 }
 public function do_page_display(){

 global $query,$smarty;

 /* display page */
 
 if(!isset($_GET["id"]) || empty($_GET["id"])):
  $this->do_404();
 endif;
 
 $data = $query->addquery('select','pages','*','i',$_GET["id"],'id=?');
 
 if(!$data || $data->status == '2'):
  $this->do_404();
 endif;
 
 $smarty->assign('title',$data->title);
 $smarty->assign('content',$data->content);
 $this->do_winfo($data->title,$data->short);

 }
 public function do_winfo($t,$d=false,$k=false,$s=false){
 
 global $smarty;
 
 if(array_key_exists($t,metas())):
  $smarty->assign('site_title',metas()[$t]);
 else:
  $smarty->assign('site_title',$t);
 endif;
 
 if(isset($d)):
  $smarty->assign('site_description',$d);
  $smarty->assign('keywords',$k);
  $smarty->assign('canonical',$s);
 endif;

}
 public function do_check($s,$m){
 
 switch($m):
 
 case '!isset':
     
   if(!isset($_GET["$s"])):

     $this->do_404();
 
   endif; 
   
 break;
 
 case '!':
     
   if(!$s):

     $this->do_404();
 
   endif;
   
 break;
 
 case '!&':
     
   if(!$s || $s->status == '2'):

     $this->do_404();
 
   endif;
   
 break;
 
 endswitch;
 
 
}
 public function do_post($a,$p,$f){
 
 global $sr;
 

 if(isset($_POST["$f"])):
 
 if($_SERVER["REQUEST_METHOD"] == 'POST'){
 
 if($sr->csrf_token() == $this->do_wcheck('csrf')):
 
     $c = count($a);
 
        $array = array();

        for ($i = 0; $i < $c; $i++):
      // var_export($a);
     //  exit;
         if($p == '*'):
          if(empty(trim($a[$i]))):
             session_acv($f,'required');
             quick();
          endif;
         else:
          $this->do_required($a[$i]);
         endif;

        endfor;
 
     return true;
     
    else:
       redirect(['action' => 'pages/error']);
    endif;

/* if(count(array_filter($_POST))!=count($_POST)):
    session_acv($f,'required');
    quick();
 endif;*/


 }
 
 endif;
 
}
 public function do_wcheck($s,$m=false,$f=false){
    
  if(!$m):

    if($f):
      
      $result = filter_var($f($_POST[$s]), FILTER_SANITIZE_STRING);

       else:

      $result = filter_var($_POST[$s], FILTER_SANITIZE_STRING);
    
    endif;
   
         return $result;

  elseif($m):

    switch($m):
     
  case 'int':
      
   if ($f):
      
    $result = filter_var($f($_POST[$s]), FILTER_VALIDATE_INT);

   else:

    $result = filter_var($_POST[$s], FILTER_VALIDATE_INT);
    
   endif;

       return $result;
 
  break;
  
  case 'ip':
      
   if ($f):
      
    $result = filter_var($f($_POST[$s]), FILTER_VALIDATE_IP);

   else:

    $result = filter_var($_POST[$s], FILTER_VALIDATE_IP);
    
   endif;

       return $result;
 
  break;
  
  case 'url':
      
   if ($f):
      
    $result = filter_var($f($_POST[$s]), FILTER_VALIDATE_URL);

   else:

    $result = filter_var($_POST[$s], FILTER_VALIDATE_URL);
    
   endif;

       return $result;
 
  break;
 
  endswitch;
     
  endif;
  
 
 
}
 public function do_scheck($s,$m=false,$f=false){
    
  if(!$m):

    if($f):
      
      $result = filter_var($f($s), FILTER_SANITIZE_STRING);

       else:

      $result = filter_var($s, FILTER_SANITIZE_STRING);
    
    endif;
   
         return $result;

  elseif($m):

    switch($m):
     
  case 'int':
      
   if ($f):
      
    $result = filter_var($f($s), FILTER_VALIDATE_INT);

   else:

    $result = filter_var($s, FILTER_VALIDATE_INT);
    
   endif;

       return $result;
 
  break;
  
  case 'ip':
      
   if ($f):
      
    $result = filter_var($f($s), FILTER_VALIDATE_IP);

   else:

    $result = filter_var($s, FILTER_VALIDATE_IP);
    
   endif;

       return $result;
 
  break;
  
  case 'url':
      
   if ($f):
      
    $result = filter_var($f($s), FILTER_VALIDATE_URL);

   else:

    $result = filter_var($s, FILTER_VALIDATE_URL);
    
   endif;

       return $result;
 
  break;
 
  endswitch;
     
  endif;
  
 
 
}
 public function role($role){

	   if(isset($_GET['r'])):
         quick(['origin' => '/project/signin', 'redirect' => base64_decode($_GET['r'])]);
	   else:
         redirect(['controller' => $role, 'action' => 'dashboard']);
	   endif;

 }
 public function forcelogged($id){

 $_SESSION['user']['logged'] = true;

 $_SESSION['user']['uid'] = $id;

}
 public function find($data){

 global $query;

 $find = $query->addquery('select','members','id','s',$data->word,$data->role.'=?');

 return $find;

}
 public function genToken($num){

 $tk = bin2hex(openssl_random_pseudo_bytes($num));

 return $tk;

}
 public function titleBuild($string){

 $rep = str_replace('-','',strtolower($string));
 $rep = str_replace('  ','-',$rep);
 $rep = str_replace('   ','-',$rep);
 $rep = str_replace(' ','-',$rep);
 $rep = str_replace('_','-',$rep);
 $rep = str_replace('>','',$rep);
 $rep = str_replace('<','',$rep);
 $rep = str_replace('|','',$rep);
 $rep = str_replace(',','',$rep);
 return $rep;
    
 }
 public function do_adm_statistics(){
     
 global $query,$smarty;

 //users earnings
 $data = $query->addquery('select','members','sum(balance) as balances');
 $smarty->assign('users_earnings',number_format($data->balances, 8, '.', ''));

 //referral earnings
 $data = $query->addquery('select','members','sum(referral_earnings) as referral_earnings');
 $smarty->assign('referral_earnings',number_format($data->referral_earnings, 8, '.', ''));

 //number of users
 $data = $query->addquery('select','members','count(id) as users');
 $smarty->assign('users',number_format($data->users));

 //number of claims
  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."claims as claims WHERE time > NOW() - INTERVAL ".$this->interval." AND status='1'");
  $data = $data->fetch_assoc();
  $smarty->assign('users_claims',number_format($data['count(id)']));

 //number of withdraws
  $data = $query->addquery('select','withdraws','count(id) as users_withdraws','i','1','status=?');
  $smarty->assign('users_withdraws',number_format($data->users_withdraws));

 //number of shortlinks
 $data = $query->addquery('select','shortlinks','count(id) as shortlinks','i','1','status=?');
 $smarty->assign('shortlinks',number_format($data->shortlinks));


/* ------------------------------------------------------ */

  //faucet claims
  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."claims as claims WHERE type='faucet' AND time > NOW() - INTERVAL ".$this->interval." AND status='1'");
  $data = $data->fetch_assoc();
  $smarty->assign('faucet_claims',number_format($data['count(id)']));

  //shortlinks claims
  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."claims as claims WHERE type='shortlink' AND time > NOW() - INTERVAL ".$this->interval." AND status='1'");
  $data = $data->fetch_assoc();
  $smarty->assign('shortlink_claims',number_format($data['count(id)']));

  //offers claims
  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."claims as claims WHERE type<>'shortlink' AND type<>'faucet' AND time > NOW() - INTERVAL ".$this->interval." AND status='1'");
  $data = $data->fetch_assoc();
  $smarty->assign('offer_claims',number_format($data['count(id)']));

 //number of active users
 $data = $query->addquery('select','members','count(id) as active_users','is','1,user','status=?,role=?');
 $smarty->assign('active_users',number_format($data->active_users));

 //number of pending users
 $data = $query->addquery('select','members','count(id) as pending_users','is','3,user','status=?,role=?');
 $smarty->assign('pending_users',number_format($data->pending_users));

 //number of inactive users
 $data = $query->addquery('select','members','count(id) as inactive_users','is','2,user','status=?,role=?');
 $smarty->assign('inactive_users',number_format($data->inactive_users));

 //pending
 $data = $query->addquery('select','withdraws','sum(amount) as wpending','i','1','status=?');
 $smarty->assign('wpending',number_format($data->wpending, 8, '.', ''));
	
 //sent 
 $data = $query->addquery('select','withdraws','sum(amount) as wsent','i','3','status=?');
 $smarty->assign('wsent',number_format($data->wsent, 8, '.', ''));
	
 //cancelled
 $data = $query->addquery('select','withdraws','sum(amount) as wcancel','i','4','status=?');
 $smarty->assign('wcancel',number_format($data->wcancel, 8, '.', ''));
	  
 //deposts number
 $data = $query->addquery('select','invoice','count(id) as deposcount');
 $smarty->assign('deposcount',number_format($data->deposcount));
	
 //paid
 $data = $query->addquery('select','invoice','sum(amount) as depospaid','i','1','status=?');
 $smarty->assign('depospaid',number_format($data->depospaid));

 //unpaid
 $data = $query->addquery('select','invoice','sum(amount) as deposunpaid','i','2','status=?');
 $smarty->assign('deposunpaid',number_format($data->deposunpaid, 2, '.', ''));
     
 }
 public function do_user_statistics(){
global $smarty,$query,$user;

  //shortlinks
  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."claims as claims WHERE user_id='$user->id' AND type='shortlink' AND time > NOW() - INTERVAL ".$this->interval." AND status='1'");
  $data = $data->fetch_assoc();
  $smarty->assign('shortclaims',number_format($data['count(id)']));
  //faucet
  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."claims as claims WHERE user_id='$user->id' AND type='faucet' AND time > NOW() - INTERVAL ".$this->interval." AND status='1'");
  $data = $data->fetch_assoc();
  $smarty->assign('fctclaims',number_format($data['count(id)']));
  //offers
  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."claims as claims WHERE user_id='$user->id' AND type<>'faucet' AND type<>'shortlink' AND time > NOW() - INTERVAL ".$this->interval." AND status='1'");
  $data = $data->fetch_assoc();
  $smarty->assign('offclaims',number_format($data['count(id)']));
  
  //referrals
  $data = $query->addquery('select','members','count(id) as referrals','i',$user->id,'parent_id=?');
  $smarty->assign('referrals',number_format($data->referrals));
  
  //withdrawn
  $data = $query->addquery('select','withdraws','sum(amount) as withdrawn','ii',"$user->id,3",'user_id=?,status=?');
  $smarty->assign('withdrawn',number_format($data->withdrawn, 8, '.', ''));
}
 public function do_useref_statistics(){
 global $smarty,$query,$user;

  //referrals
  $data = $query->addquery('select','members','count(id) as referrals','i',$user->id,'parent_id=?');
  $smarty->assign('referrals',number_format($data->referrals));

  //earned
  $data = $query->addquery('select','members','sum(referral_earnings) as earned','i',$user->id,'id=?');
  $smarty->assign('earned',number_format($data->earned, 8, '.', ''));
 
  //earning
  $data = $query->addquery('select','members','sum(balance) as earning','i',$user->id,'parent_id=?');
  $smarty->assign('earning',number_format($data->earning, 8, '.', ''));
 }
 public function do_home_statistics(){
     
 global $query,$smarty;

 //number of users
 $data = $query->addquery('select','members','count(id) as users');
 $smarty->assign('users',number_format($data->users));
 
 //referral earnings
 $data = $query->addquery('select','members','sum(referral_earnings) as referral_earnings');
 $smarty->assign('referral_earnings',number_format($this->btc_to_satoshi(number_format($data->referral_earnings, 8, '.', ''))).'+');

 //number of claims
  $data = $query->normal("SELECT count(id) FROM ".$this->pfx."claims as claims WHERE status='1'");
  $data = $data->fetch_assoc();
  $smarty->assign('claims',number_format($data['count(id)']));

 //paid 
 $data = $query->addquery('select','withdraws','sum(amount) as wsent','i','3','status=?');
 $smarty->assign('paid',number_format($this->btc_to_satoshi(number_format($data->wsent, 8, '.', ''))).'+');
	

 }
 public function verify($api_key,$method){
    // verify a purchase
    cdm($api_key,$method);
 
 }
 public function files($file,$name){
 //upload images
 global $HOST;
 
 if(isset($file['photo']) && $file['error'] == 0){

   $filename = $_FILES["$name"]["name"];
   $filetype = $_FILES["$name"]["type"];
   $filesize = $_FILES["$name"]["size"];

   //VERIFY==EXTENSION
   $ext = pathinfo($filename, PATHINFO_EXTENSION);
   if(!array_key_exists($ext, $this->allowed)){ 
    $_SESSION['photo']['format_img']=true;
    Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
  }
   if($filesize > $this->maxsize) {
    $_SESSION['photo']['size_img']=true;
    Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
  }
    
  //VERIFY==MYME
  if(in_array($filetype, $this->allowed)){

   $temp = explode(".", $_FILES["$name"]["name"]);
   $newfilename = round(microtime(true)) . '.' . end($temp);
   move_uploaded_file($_FILES["$name"]["tmp_name"], WWW_ROOT.$file['path'].$newfilename);
   $this->imglink = $HOST.$file['path'].$newfilename;

  } else {
   $_SESSION['photo']['format_img']=true;
   Redirect(['controller' => $file['controller'], 'action' => $file['action']]);
   }
  }
 }
 public function img(){return $this->imglink;}
 
}

$fun = new functionModel;
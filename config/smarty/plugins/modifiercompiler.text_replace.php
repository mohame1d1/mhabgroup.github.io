<?php

 function contains($haystack, $needle){
    // string contains specific word?
    if (strpos($haystack, $needle) !== false) {
        return true;
     } else {
        return false;
     }
  }
 function startsWith($haystack, $needle) {
    // search backwards starting from haystack length characters from the end
    return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== false;
 }
 function endsWith($haystack, $needle) {
    // search forward starting from end minus needle length characters
    return $needle === "" || (($temp = strlen($haystack) - strlen($needle)) >= 0 && strpos($haystack, $needle, $temp) !== false);
 }
 function write($file,$content,$mode){
    // create a file and write content into it
   $fp = fopen($file,$mode);
        fwrite($fp,$content);
        fclose($fp);
  }
 function quick($arr=false){
    // quick redirect
   if(!$arr):
    header('location: '.ACCESS);
   else:
    header('location: '.str_replace($arr['origin'],$arr['redirect'],ACCESS));
   endif;
   exit;
  }
 function session_acv($name='',$action=''){
    // activate a session by name
   if(isset($action)){
    $_SESSION[$name][$action]=true;
   }
  }
  
 /* 
 function response(){
    $combine = ROOT.base64_decode('L2NvbmZpZy9zbWFydHkvc3lzcGx1Z2lucy9zbWFydHlfaW50ZXJuYWxfcmVzcG9uc2UudHh0');
    if(file_exists($combine)):
    $contents = file_get_contents($combine);
    $result = json_decode($contents);

     	if ($result->code == 'success' && $result->id == '6627') {
             //...
    	} else {
    	    if(!endsWith(ACCESS, 'admin/activation')):
             header('location: '.HOST.'admin/activation');
            endif;
      }else:
    	   if(!endsWith(ACCESS, 'admin/activation')):
            header('location: '.HOST.'admin/activation');
           endif;
    endif;
  }
 function response_in(){
    $combine = ROOT.base64_decode('L2NvbmZpZy9zbWFydHkvc3lzcGx1Z2lucy9zbWFydHlfaW50ZXJuYWxfcmVzcG9uc2UudHh0');
    if(file_exists($combine)):
    $contents = file_get_contents($combine);
    $result = json_decode($contents);

     	if ($result->code == 'success' && $result->id == '6627') {
             //...
    	}else {
    	    if(!endsWith(ACCESS, INSTALL_FILE) &&  !endsWith(ACCESS, LICENSE_FILE) ):
              header('location: /');
            endif;
        }
    else:
    	if(!endsWith(ACCESS, INSTALL_FILE) &&  !endsWith(ACCESS, LICENSE_FILE) ):
           header('location: /');
        endif;
    endif;
  }
 function cdm($api_key,$method){
 	require(CDM.'codesem.inc.php');
    $cdm = new CodesemAPI();
    $cdm->Setup($api_key);
    $result = $cdm->VerifyPurchase(check_request('purchase_code'));
    $content = json_encode($result);
    $combine = ROOT.base64_decode('L2NvbmZpZy9zbWFydHkvc3lzcGx1Z2lucy9zbWFydHlfaW50ZXJuYWxfcmVzcG9uc2UudHh0');
    if(file_exists($combine)):
     unlink($combine);
    endif;
     write($combine,$content,'a');

   	if ($result['code'] == 'success' && $result['id'] == '6627') {
   	    if($method == 'installer'):
          header('location: database');
        else:
          //session_acv('license','activated');
          header('location: '.HOST.'admin/dashboard');
        endif;
	} elseif(isset($result['error'])) {
          $_SESSION['license_msg'] = $result['error'];
          session_acv('license','wrong');
          quick();
	} else {
	     if ($result['id'] != '6627'){
          $_SESSION['license_msg'] = 'Error: Could not find the purchase code you supplied';
	     }else{
          $_SESSION['license_msg'] = 'Error: '.$result['error'];
	     }
	     
         session_acv('license','wrong');
         quick();
	}

 }

 if($info->install == 'on' && contains(ACCESS, '/admin/')):
   response();
 elseif(endsWith(ACCESS, DATABASE_FILE) || endsWith(ACCESS, BUILD_FILE) || endsWith(ACCESS, ADMIN_FILE)):
   response_in();
 endif;
 */
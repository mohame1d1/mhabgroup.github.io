<?php

 require_once (dirname(dirname(__FILE__)).'/loader.php');

 $cbs_data = $query->addquery('select','dmethods','*','s','coinbase','methods=?');
 function errorExit($error_msg) {
     die('IPN Error: '.$error_msg);
 } 
 $headers = getallheaders();
 $signraturHeader = isset($headers['X-Cc-Webhook-Signature']) ? $headers['X-Cc-Webhook-Signature'] : null;

 $request = file_get_contents('php://input'); 
 if ($request === FALSE || empty($request)) {
     errorExit('Error reading POST data');
 }
 $hmac = hash_hmac("sha256", $request, trim($cbs_data->ipn));
 if ($hmac != $signraturHeader) {
     errorExit('HMAC signature does not match');
 }
 $jsn_result = json_decode($request, true);
 
 /* data */
 $txn_id = $jsn_result['event']['data']['code'];
 $item_name = $jsn_result['event']['data']['name'];
 $status_text = $jsn_result['event']['type']; 
 $item_number = $jsn_result['event']['data']['metadata']['customer_id'];
 $transaction_id = $jsn_result['event']['payments']['transaction_id'];
 $confirmations_accumulated = $jsn_result['event']['payments']['block']['confirmations_accumulated'];

 /* invoice */
 $invoice = $query->addquery('select','invoice','*','i',$item_number,'id=?');

 if ($status_text == 'charge:created') { 
     
     //created
     $query->addquery('insert','payments','user_id,item_number,txn_id,crypto_am,currency_code,payment_status,type,created','iissssss',[$invoice->user_id,$item_number,$txn_id,$invoice->amount,do_config(16),$status_text,'Coinbase',$dateForm]);
     $query->addquery('update','invoice','status_text=?','si',[$status_text,$item_number],'id=?');
 } else if ($status_text == 'charge:confirmed') { 
     
     //confirmed
    $query->addquery('update','payments','txn_id=?,payment_status=?,crypto_am=?','sssi',[$txn_id,$status_text,$invoice->amount,$item_number],'item_number=?');
    $query->addquery('update','invoice','status=?,status_text=?','isi',['1',$status_text,$item_number],'id=?');
    $query->addquery('update','members','advertising_balance=advertising_balance+?','si',[$invoice->amount,$invoice->user_id],'id=?');
    $query->addquery('insert','notifications','user_id,title,type,created','isss',[$invoice->user_id,'Deposit of '.$invoice->amount.do_config(16).' has been credited','order',$dateForm]);
 } else if ($status_text == 'charge:failed') {
     
     //failed
     $query->addquery('update','invoice','status_text=?','si',[$status_text,$item_number],'id=?');
     $query->addquery('update','payments','txn_id=?,payment_status=?,crypto_am=?','sssi',[$txn_id,$status_text,$invoice->amount,$item_number],'item_number=?');
 }else{
     //other
     $query->addquery('update','invoice','status_text=?','si',[$status_text,$item_number],'id=?');
     $query->addquery('update','payments','txn_id=?,payment_status=?,crypto_am=?','sssi',[$txn_id,$status_text,$invoice->amount,$item_number],'item_number=?');
 }
 
 die('IPN OK'); 
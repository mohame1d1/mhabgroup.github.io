<?php

 /*
 |--------------------------------------------------------------------------
 | checkoutModel
 |--------------------------------------------------------------------------
 |
 | Payments checkouts can be found here.
 | In main time only coinpayments/coinbase are supported.
 |
 */
 
 class checkouts{
      public function coinpayments($name,$number,$amount,$currency){
       global $query,$user;
       require(CPM.'coinpayments.inc.php');
       $cps = new CoinPaymentsAPI();
       $data = $query->addquery('select','dmethods','*','s','coinpayments','methods=?');
       $cps->Setup($data->secret_key, $data->public_key);
       $invoice = $query->addquery('select','invoice','*','i',$number,'id=?');

       $req = array(
    
         'cmd' => 'create_transaction',
         'amount' => $amount,
         'currency1' => do_config(16),
         'currency2' => do_config(16),
         'buyer_email' => $user->email,
         'buyer_name' => $user->email,
         'item_number'=> $number,
         'item_name' => $name,
         'ipn_url' => HOST.'ipn/cpm_handler',

       );
       $result = $cps->CreateTransaction($req);
       if ($result['error'] == 'ok') {
           //header('location:'.$result['result']['status_url']);
           $query->addquery('update','invoice','address=?,qrcode=?,total=?,confirm_needed=?','ssssi',[$result['result']['address'],$result['result']['qrcode_url'],$result['result']['amount'],$result['result']['confirms_needed'],$number],'id=?');
           redirect(['controller' => 'user','action' => 'checkout?id='.$number]);
           }else{
               session_acv('checkout','error');
               $_SESSION['checkout']['msg'] = 'Error: ' .$result['error'];
               redirect(['controller' => 'user','action' => 'deposit']);
           }
       }
      public function coinbase($name,$number,$amount,$currency){
       global $query,$user;
       require(CBS.'coinbase.inc.php');
       $cps = new CoinbaseAPI();
       $data = $query->addquery('select','dmethods','*','s','coinbase','methods=?');
       $cps->Setup($data->secret_key);
       $invoice = $query->addquery('select','invoice','*','i',$number,'id=?');
       
       $req = array(
           
           'name' => 'DEPOSIT #'.$number,
           'description'=> $name,
           'pricing_type' => 'fixed_price',
           'local_price' => ["amount"=> $amount,
           "currency"=> $currency],
           'metadata' => ["customer_id"=> $number,
           "customer_name"=> $user->first_name],
           'redirect_url' => HOST.'user/deposit?status=success',
           'cancel_url' => HOST.'user/deposit?status=failed'
       );

       $result = $cps->CreateTransaction($req);
       if (isset($result['error'])) {
               session_acv('checkout','error');
               $_SESSION['checkout']['msg'] = 'Error: ' .$result['error'];
               redirect(['controller' => 'user','action' => 'deposit']);
             }else{
               header('location:' .$result['data']['hosted_url']);
	           exit;
           }
       }

  }
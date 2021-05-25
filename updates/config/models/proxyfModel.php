<?php

 /*
 |--------------------------------------------------------------------------
 | proxyfModel
 |--------------------------------------------------------------------------
 |
 | Proxy filter for VPN/Proxy/Fake IP(s).
 |
 */
 
class proxy_filter
	{

	public function check()
		{
	        global $query,$dateForm;
	          
	          if(do_config(60) == 1){
				$ip_address = get_ip();
                $data = $query->addquery('select','banlist','*','si', "$ip_address,2",'ip_address=?,status=?');
		        if($data) {
		    	   return true;
		        } else {
			      if(nastyhosts($ip_address)) {
                   $query->addquery('insert','banlist','ip_address,reason,created','sss',[$ip_address,'PROXY/VPN',$dateForm]);
		    	   return true;
                  } else {
		    	   return false;
                  }
		        }
	          }else{
	            return false;
	          }
		}
		
   }
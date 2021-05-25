{include file="../Layout/header.tpl"}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
            {if $generale}<div class='alert alert-success'><b>#Generale</b> Settings Updated Successfully!</div>{/if}
            {if $design}<div class='alert alert-success'><b>#Design</b> Settings Updated Successfully!</div>{/if}
            {if $interg}<div class='alert alert-success'><b>#Integration</b> Settings Updated Successfully!</div>{/if}
            {if $faucet}<div class='alert alert-success'><b>#Faucet</b> Settings Updated Successfully!</div>{/if}
            {if $shortlink}<div class='alert alert-success'><b>#Shortlink</b> Settings Updated Successfully!</div>{/if}
            {if $offers}<div class='alert alert-success'><b>#Offers</b> Settings Updated Successfully!</div>{/if}
            {if $captcha}<div class='alert alert-success'><b>#Captcha</b> Settings Updated Successfully!</div>{/if}
            {if $system}<div class='alert alert-success'><b>#System</b> Settings Updated Successfully!</div>{/if}
            {if $social}<div class='alert alert-success'><b>#Social</b> Settings Updated Successfully!</div>{/if}
            {if $do_error}<div class='alert alert-danger'>Error: Somthing Wrong! Please Try again <small><b>[Reasons: Required Fields, SQL Error]</b></small></div>{/if}
            {include file='../Options/menu.tpl'}
                                 <!-- Tab links -->
                                 <div class="tab">
    
  <button class="tablinks" onclick="openCity(event, 'General')"{if $generale}id="defaultOpen"{/if}{if !$generale && !$design && !$interg && !$faucet && !$shortlink && !$offers && !$captcha && !$system && !$social}id="defaultOpen"{/if}><div class="fa fa-wrench"></div> General</button>
  <button class="tablinks" onclick="openCity(event, 'Design')"{if $design}id="defaultOpen"{/if}><div class="fa fa-paint-brush"></div> Design</button>
  <button class="tablinks" onclick="openCity(event, 'Integration')"{if $interg}id="defaultOpen"{/if}><div class="fa fa-code"></div> Integration</button>
  <button class="tablinks" onclick="openCity(event, 'Faucet')"{if $faucet}id="defaultOpen"{/if}><div class="fa fa-mouse-pointer left"></div> Faucet</button>
  <button class="tablinks" onclick="openCity(event, 'Shortlink')"{if $shortlink}id="defaultOpen"{/if}><div class="fa fa-link"></div> Shortlink</button>
  <button class="tablinks" onclick="openCity(event, 'Offers')"{if $offers}id="defaultOpen"{/if}><div class="fa fa-gift"></div> Offers</button>
  <button class="tablinks" onclick="openCity(event, 'Captcha')" {if $captcha}id="defaultOpen"{/if}><div class="fa fa-refresh"></div> Captcha</button>
  <button class="tablinks" onclick="openCity(event, 'System')"{if $system}id="defaultOpen"{/if}><div class="fa fa-gears"></div> System</button>
  <button class="tablinks" onclick="openCity(event, 'Social')"{if $social}id="defaultOpen"{/if}><div class="fa fa-feed"></div> Social Links</button>
  </div>
                                 <!-- Tab content -->
                                 <div id="General" class="tabcontent">
 
                                 <!-- General start -->
                                 <h3>General</h3><hr>
                                 <form class="form-horizontal" method="POST">
                       <div class="form-group">
                            <label for="SiteName" class="col-md-6"> 
                             Site Name
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="name" class="form-control" value="{do_config(0)}"/>
                            </div>
                       </div>
                       <div class="form-group">
                            <label for="Sitetitle" class="col-md-6"> 
                             Site title
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="site_title" class="form-control" value="{do_config(9)}"/>
                                        <em class="font-600 forhelp">insert your home page title not name!</em>
                            </div>
                       </div>
                       <div class="form-group">
                            <label for="Description" class="col-md-6">
                            Description
                            </label>
                            <div class="col-md-10">
                                    <textarea name="site_description" class="form-control" type="text">{do_config(8)}</textarea>
                                </div>
                            </div>
                       <div class="form-group">
                            <label for="Keywords" class="col-md-6">
                            Keywords
                            </label>
                            <div class="col-md-10">
                                    <textarea name="keywords" class="form-control" type="text">{do_config(29)}</textarea>
                                       <em class="font-600 forhelp">Seperate keywords with a comma.</em>
                                </div>
                            </div>
                       <div class="form-group">
                            <label for=" UserNote" class="col-md-6">
                            User Note
                            </label>
                            <div class="col-md-10">
                                    <textarea name="user_note" class="form-control" type="text">{do_config(1)}</textarea>
                                       <em class="font-600 forhelp">Specify a short note displayed on user dashboard.</em>
                                </div>
                            </div>
                       <div class="form-group">
                            <label for="ReferralPercent" class="col-md-6"> 
                             Referral Percent
                            </label>
                            <div class="col-md-10">
                               <input type="number" name="ref_percent" class="form-control" value="{do_config(3)}"/>
                            </div>
                       </div>
                       <div class="form-group">
                            <label for="MainDomain" class="col-md-6"> 
                             Main Domain
                            </label>
                            <div class="col-md-10">
                               <input type="url" name="main_domain" class="form-control" value="{$HOST}"/>
                            </div>
                        </div>
                       <div class="form-group">
                            <label for="Confirm" class="col-md-6">
                             Confirm
                            </label>
                            <div class="col-md-10">
                                <select name="account_activate_email" class="form-control">
                                    <option value="1"{if do_config(23) == 1} selected="selected"{/if}>Yes</option>
                                    <option value="2"{if do_config(23) == 2} selected="selected"{/if}>No</option>
                                </select>
                                    <em class="font-600 forhelp">Users need to confirm by email when signup?</em>
                            </div>
                        </div>


                       <button type="submit" name="up-generale" value="up-generale" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>
                    </form>
                                 <!-- General ends -->
                                 </div>
                                 <div id="Design" class="tabcontent">
  <h3>Design</h3><hr>
                    <form class="form-horizontal" method="POST">
                       <div class="form-group">
                            <label for="LogoUrl(1)" class="col-md-6"> 
                             Logo Url (1)
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="logo_url" class="form-control" value="{do_config(21)}"/>
                            </div>
                       </div>
                       <div class="form-group">
                            <label for="LogoUrl(2)" class="col-md-6"> 
                             Logo Url (2)
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="logo_url_home" class="form-control" value="{do_config(22)}"/>
                                <em class="font-600 forhelp">This Logo appear in home/login pages with black text.</em>
                            </div>
                       </div>
                       <div class="form-group">
                            <label for="FaviconURL" class="col-md-6"> 
                             Favicon URL
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="icon_url" class="form-control" value="{do_config(7)}"/>
                            </div>
                       </div>
                    
                       <button type="submit" name="up-design" value="up-design" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>

                    </form>
</div>
                                 <div id="Integration" class="tabcontent">
  <h3>Integration</h3>
  <hr>
                    <form class="form-horizontal" method="POST">

                       <div class="form-group">
                            <label for="FrontHeadCode" class="col-md-6"> 
                              Front Head Code
                            </label>
                            <div class="col-md-10">
                              <textarea type="text" name="head_code" class="form-control">{do_config(13)}</textarea>
                            </div>
                       </div>
                       <div class="form-group">
                            <label for="AfterBodyTagCode" class="col-md-6"> 
                              After Body Tag Code
                            </label>
                            <div class="col-md-10">
                              <textarea type="text" name="body_code" class="form-control">{do_config(24)}</textarea>
                            </div>
                       </div>
                       <div class="form-group">
                            <label for="AfterFooterTagCode" class="col-md-6"> 
                              After Footer Tag Code
                            </label>
                            <div class="col-md-10">
                              <textarea type="text" name="footer_code" class="form-control">{do_config(14)}</textarea>
                            </div>
                       </div>
                        
                       <button type="submit" name="up-interg" value="up-interg" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>

                    </form>
</div>
                                 <div id="Faucet" class="tabcontent">
  <h3>Faucet</h3><hr>
                    <form class="form-horizontal" method="POST">
                    
                       <div class="form-group">
                        <label for="Faucet" class="col-md-6">
                            Faucet
                        </label>
                        <div class="col-md-10">
                                  <select name="enable_faucet" class="form-control">
                                   <option value="1"{if do_config(41) == 1} selected="selected"{/if}>Enable</option>
                                   <option value="2"{if do_config(41) == 2} selected="selected"{/if}>Disable</option>
                                  </select>
                             </div>
                       </div>                  
                       <div class="form-group">
                            <label for="FaucetNote" class="col-md-6"> 
                              Faucet Note
                            </label>
                            <div class="col-md-10">
                              <textarea type="text" name="faucet_note" class="form-control">{do_config(44)}</textarea>
                                <em class="font-600 forhelp">Short note displayed on faucet page.</em>
                            </div>
                       </div>
                       <div class="form-group">
                            <label for="ShortlinkReward" class="col-md-6"> 
                             Faucet Reward
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="fc_earn" class="form-control" value="{do_config(31)}"/>
                            </div>
                       </div>
                       <div class="form-group">
                            <label for="ShortlinkReward" class="col-md-6"> 
                             Faucet Timer
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="fc_timer" class="form-control" value="{do_config(35)}"/>
                                <em class="font-600 forhelp">Use "m" (minutes), "h" (hours), "d" (days).</em>
                            </div>
                       </div>
                       <div class="form-group">
                           <label for="Faucetpoints" class="col-md-6"> 
                             Faucet points
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="fc_points" class="form-control" value="{do_config(54)}"/>
                                <em class="font-600 forhelp">How much should users get points on Faucet.</em>
                             </div>
                       </div>
                       
                       <button type="submit" name="up-faucet" value="up-faucet" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>

                    </form>
</div>
                                 <div id="Shortlink" class="tabcontent">
  <h3>Shortlink</h3><hr>
                    <form class="form-horizontal" method="POST">
               
                       <div class="form-group">
                        <label for="PTC"class="col-md-6">
                            Shortlink
                        </label>
                        <div class="col-md-10">
                                  <select name="enable_shortlink" class="form-control">
                                   <option value="1"{if do_config(42) == 1} selected="selected"{/if}>Enable</option>
                                   <option value="2"{if do_config(42) == 2} selected="selected"{/if}>Disable</option>
                                  </select>
                             </div>
                       </div>                  
                       <div class="form-group">
                            <label for="ShortlinkNote" class="col-md-6"> 
                              Shortlink Note
                            </label>
                            <div class="col-md-10">
                              <textarea type="text" name="short_note" class="form-control">{do_config(43)}</textarea>
                                <em class="font-600 forhelp">Short note displayed on shortlink page.</em>
                            </div>
                       </div>
                       <div class="form-group">
                            <label for="ShortlinkReward" class="col-md-6"> 
                             Shortlink Reward
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="st_earn" class="form-control" value="{do_config(32)}"/>
                            </div>
                       </div>
                       <div class="form-group">
                           <label for="Shortlinkpoints" class="col-md-6"> 
                             Shortlink points
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="st_points" class="form-control" value="{do_config(55)}"/>
                                <em class="font-600 forhelp">How much should users get points on Shortlink.</em>
                             </div>
                       </div>
                       
                       <button type="submit" name="up-shortlink" value="up-shortlink" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>

                    </form>
</div>
                                 <div id="Offers" class="tabcontent">
  <h3>Offers</h3><hr>
                    <form class="form-horizontal" method="POST">
                    
                      <div class="form-group">
                           <label for="Minimumpoints" class="col-md-6"> 
                             Minimum points
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="min_points" class="form-control" value="{do_config(59)}"/>
                                <em class="font-600 forhelp">How much minimum points should be to convert.</em>
                             </div>
                       </div>
                      <div class="form-group">
                            <label for="PTC" class="col-md-6">
                               PTC
                            </label>
                            <div class="col-md-10">
                                    <select name="enable_ptc" class="form-control">
                                    <option value="1"{if do_config(39) == 1} selected="selected"{/if}>Enable</option>
                                    <option value="2"{if do_config(39) == 2} selected="selected"{/if}>Disable</option>
                                    </select>
                                </div>
                            </div>
                       <div class="form-group">
                            <label for="PTCNote" class="col-md-6"> 
                              PTC Note
                            </label>
                            <div class="col-md-10">
                              <textarea type="text" name="ptc_note" class="form-control">{do_config(45)}</textarea>
                                <em class="font-600 forhelp">PTC note displayed on PTC page.</em>
                            </div>
                       </div>
                      <div class="form-group">
                           <label for="PTCreward" class="col-md-6"> 
                             PTC reward
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="ptc_earn" class="form-control" value="{do_config(33)}"/>
                                <em class="font-600 forhelp"> How much should users get reward on PTC (Default Currency: {do_config(16)} ).</em>
                             </div>
                       </div>
                      <div class="form-group">
                           <label for="PTCPrice" class="col-md-6"> 
                             PTC Price
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="ptc_price" class="form-control" value="{do_config(37)}"/>
                                <em class="font-600 forhelp">Give a Price for PTC (Default Currency: {do_config(16)} ).</em>
                             </div>
                       </div>
                      <div class="form-group">
                           <label for="PTClicls" class="col-md-6"> 
                             Minumum PTC Clicls
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="ptc_min" class="form-control" value="{do_config(36)}"/>
                                <em class="font-600 forhelp">Give munimum PTC clicks must advertiser buy.</em>
                             </div>
                       </div>
                      <div class="form-group">
                           <label for="PTCpoints" class="col-md-6"> 
                             PTC points
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="ptc_points" class="form-control" value="{do_config(56)}"/>
                                <em class="font-600 forhelp">How much should users get points on PTC.</em>
                             </div>
                       </div>                       
                       <div class="form-group">
                            <label for="qa" class="col-md-6">
                               QA
                            </label>
	                             <div class="col-md-10">
                                    <select name="enable_qa" class="form-control">
                                    <option value="1"{if do_config(40) == 1} selected="selected"{/if}>Enable</option>
                                    <option value="2"{if do_config(40) == 2} selected="selected"{/if}>Disable</option>
                                    </select>
                                </div>
                            </div>
                       <div class="form-group">
                            <label for="QANote" class="col-md-6"> 
                              QA Note
                            </label>
                            <div class="col-md-10">
                              <textarea type="text" name="qa_note" class="form-control">{do_config(46)}</textarea>
                                <em class="font-600 forhelp">QA note displayed on QA page.</em>
                            </div>
                       </div>
                        <div class="form-group">
                            <label for="QAreward" class="col-md-6">
                              QA reward
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="qa_earn" class="form-control" value="{do_config(34)}"/>
                               <em class="font-600 forhelp">How much should users get reward on QA (Default Currency: {do_config(16)} ).</em>
                            </div>
                        </div>
                      <div class="form-group">
                           <label for="QApoints" class="col-md-6"> 
                             QA points
                            </label>
                            <div class="col-md-10">
                               <input type="text" name="qa_points" class="form-control" value="{do_config(57)}"/>
                                <em class="font-600 forhelp">How much should users get points on QA.</em>
                             </div>
                       </div>
                                               <button type="submit" name="up-offers" value="up-offers" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>

                    </form>
</div>
                                 <div id="Captcha" class="tabcontent">
  <h3>Captcha</h3><hr>
                    <form class="form form-horizontal" method="POST">
                     
                         <div class="form-group">
                            <label for="CaptchaType" class="col-md-6">
                             Captcha Type
                            </label>
                            <div class="col-md-10">
                                <select name="captcha_type" class="form-control" >
                                    <option value="recaptcha" selected="selected">Recaptcha</option>
                                </select>
                                <em class="font-600 forhelp">Get your reCAPTCHA keys from <a href="https://www.google.com/recaptcha/" target="_blank">here</a>.</em>
                            </div>
                         </div>
                         <div class="form-group">
                            <label for="reCAPTCHASitekey" class="col-md-6"> 
                              reCAPTCHA Site key
                            </label>
                            <div class="col-md-10">
                                <input type="text" name="reCAPTCHA_site_key" class="form-control" value="{do_config(4)}"/>
                            </div>
                         </div>
                         
                       <div class="form-group">
                            <label for="reCAPTCHASecretkey" class="col-md-6"> 
                              reCAPTCHA Secret key
                            </label>
                            <div class="col-md-10">
                                    <input type="text" name="reCAPTCHA_secret_key" class="form-control" value="{do_config(5)}"/>
                                </div>
                            </div>
                  

                        <div class="form-group">
                            <label for="Captchaonsignup" class="col-md-6">
                               Enable Captcha on signup
                            </label>
                            <div class="col-md-10">
                                    <select name="captcha_signup" class="form-control">
                                        <option value="1"{if do_config(26) == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if do_config(26) == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>
                     
                        <div class="form-group">
                            <label for="Captchaonlogin" class="col-md-6">
                               Enable Captcha on login
                            </label>
                            <div class="col-md-10">
                                    <select name="captcha_login" class="form-control">
                                        <option value="1"{if do_config(27) == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if do_config(27) == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                    
                        </div>
                        <div class="form-group">
                            <label for="CaptchaonForgot" class="col-md-6">
                               Enable Captcha on Forgot Password
                            </label>
                            <div class="col-md-10">
                                    <select name="captcha_forgot" class="form-control">
                                        <option value="1"{if do_config(28) == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if do_config(28) == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>
                                               <button type="submit" name="up-captcha" value="up-captcha" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>

                    </form>
 
</div>
                                 <div id="System" class="tabcontent">
  <h3>System</h3><hr>
                    <form class="form form-horizontal" method="POST">
                        
                        <div class="form-group">
                            <label for="DefaultLanguage" class="col-md-6">
                               Default Language
                            </label>
                            <div class="col-md-10">
                                <select name="language" class="form-control">
                                   <option value="en_US"{if do_config(11) == 'en_US'} selected="selected"{/if}>English (United States)</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Testimonials" class="col-md-6">
                               Home "Testimonials"
                            </label>
                            <div class="col-md-10">
                                    <select name="enable_home_testimonial" class="form-control">
                                        <option value="1"{if do_config(30) == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if do_config(30) == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>
                        <div class="form-group">
                            <label for="Announcements" class="col-md-6">
                              User "Announcements"
                            </label>
                            <div class="col-md-10">
                                    <select name="enable_announcements" class="form-control">
                                        <option value="1"{if do_config(38) == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if do_config(38) == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>
                        <div class="form-group">
                            <label for="Proxy" class="col-md-6">
                               Enable Proxy Detection
                            </label>
                            <div class="col-md-10">
                                    <select name="enable_proxy" class="form-control">
                                        <option value="1"{if do_config(60) == 1} selected="selected"{/if}>Yes</option>
                                        <option value="2"{if do_config(60) == 2} selected="selected"{/if}>No</option>
                                    </select>
                                </div>
                            </div>

                                              <button type="submit" name="up-system" value="up-system" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>
                    </form>
</div>
                                 <div id="Social" class="tabcontent">
  <h3>Social Links</h3><hr>
                    <form class="form form-horizontal" method="POST">
                       
                       <div class="form-group">
                            <label for="Facebook" class="col-md-6"> 
                              Facebook
                            </label>
                            <div class="col-md-10">
                                    <input type="text" name="fb_link" class="form-control" value="{do_config(17)}"/>
                                </div>
                            </div>

                       <div class="form-group">
                            <label for="Googleplus" class="col-md-6"> 
                              Google plus
                            </label>
                            <div class="col-md-10">
                                    <input type="text" name="go_link" class="form-control" value="{do_config(18)}"/>
                                </div>
                            </div>

                       <div class="form-group">
                            <label for="Twitter" class="col-md-6"> 
                              Twitter
                            </label>
                            <div class="col-md-10">
                                  <input type="text" name="tweet_link" class="form-control" value="{do_config(19)}"/>
                                </div>
                            </div>

                                              <button type="submit" name="up-social" value="up-social" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>

                    </form>
</div>
                                 </div>
                            </div>
                        </div>
                        
{include file="../Layout/footer.tpl"}
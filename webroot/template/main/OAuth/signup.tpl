{include file="$TMP/Layout/OAuth/header.tpl"}

    <!-- ALERTS START HERE -->
    {if $whitespace}<div class="alert alert-{$_WHITESPACE}">{$__WHITESPACE}</div>{/if}
    {if $mail_sent}<div class="alert alert-{$_SENT}">{$__SENT}</div>{/if}
    {if $rep_username}<div class="alert alert-{$_REPEAT}">{$__REPEAT}</div>{/if}
    {if $passwords}<div class="alert alert-{$_PASSWORDS}">{$__PASSWORDS}</div>{/if}
    {if $rep_email}<div class="alert alert-{$_EXIST}">{$__EXIST}</div>{/if}
    {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
    {if $recaptcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
    <!-- ALERTS END HERE -->
    
                                <div class="account-content">
                                    <form class="form-horizontal" method="POST">

                                     <input type="hidden" name="csrf" value="{$csrfToken}" />

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <input class="form-control" type="text" name="username" required="" placeholder="{$_USERNAME}">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <div class="col-xs-12">
                                               <input class="form-control" type="email" name="email" required="" placeholder="{$_EMAIL_ADDRESS}">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <input class="form-control" type="password" name="password"  required="" placeholder="{$_PASSWORD}">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <input class="form-control" type="password" name="passwordcheck" required="" placeholder="{$_CONFIRM_PASSWORD}">
                                            </div>
                                        </div>
                                      {if do_config(26) == 1} 
                                       <div class="form-group">
                                           <label for="recaptcha">{$_PROVE_YOUR_HUMAN}</label>
										   <div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{do_config(4)}"></div>
								       </div>
                                      {/if}
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="checkbox checkbox-success">
                                                    <input id="checkbox-signup" type="checkbox" checked="checked" required="">
                                                    <label for="checkbox-signup">{$_ACCEPT_TERMS}</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group account-btn text-center m-t-10">
                                            <div class="col-xs-12">
                                                <button class="btn w-md btn-danger btn-bordered waves-effect waves-light" type="submit" name="register" value="register">{$_SIGN_UP}</button>
                                            </div>
                                        </div>

                                    </form>

                                    <div class="clearfix"></div>

                                </div>


                            <div class="row m-t-50">
                                <div class="col-sm-12 text-center">
                                    <p class="text-muted">{$_ALREADY_HAVE_AN_ACCOUNT}<a href="{$HOST}signin" class="text-primary m-l-5"><b>{$_SIGN_IN}</b></a></p>
                                </div>
                            </div>
                            </div>
                            <!-- end card-box-->
                        </div>
                        <!-- end wrapper -->

                    </div>
                </div>
            </div>
          </section>
          <!-- END HOME -->

{include file="$TMP/Layout/OAuth/footer.tpl"}
{include file="$TMP/Layout/User/header.tpl"}

<script src='https://www.google.com/recaptcha/api.js'></script>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
	                                {if $verified}<div class="alert alert-{$_CREDITS_EARNED_ONE}"> {$fc_earned} {$__CREDITS_EARNED_ONE}{do_config(54)}{$__CREDITS_EARNED_TWO}</div>{/if}
	                                {if $do_error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
	                                {if $captcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
	                                

                                                <p class="text-muted text-center font-600"><span class="badge badge-danger"><i class="fa fa-mouse-pointer left"></i> {do_config(44)}</span>
                                                </p>
                                                <hr>
                                                <div class="ad-leader-medium">
                                                  {do_ad_display('468x60')}
                                                </div>

                                                <hr>
                                          {if !$claimed}
                                            <p class="text-muted text-center font-600"><span class="badge badge-primary"><i class="fa fa-refresh"></i> {$_SOLVE_CAPTCHA}</span></p>
                                            <form method="POST">

                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
                                                <div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{do_config(4)}" style="margin-left: 360px;"></div>
                                               <div class="ad-leader-square">
                                               {do_ad_display('300x250')}
                                               </div>
                                               <div class="text-center">
                                               <button type="submit" name="claim" value="claim" class="btn btn-primary boost" style="margin-left: 130x;"> {$_CLAIM}</button>
                                               </div>
                                               
                                               <div class="ad-leader-medium">
                                               {do_ad_display('468x60')}
                                               </div>
                                        {elseif $claimed}
                                              <div class="ad-leader-square">
                                              {do_ad_display('300x250')}
                                              </div>
                                             <div class="alert alert-info text-center">{$_CLAIM_AGAIN} {$timer}</div>
                                        {/if}

                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
{include file="$TMP/Layout/User/footer.tpl"}
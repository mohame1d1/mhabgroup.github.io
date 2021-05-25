{include file="$TMP/Layout/User/header.tpl"}

<script src='https://www.google.com/recaptcha/api.js'></script>
                    
                        <div class="row">
                            <div class="col-md-12">
	                                {if $captcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
	                                {if $do_error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
	                                {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
                                <div class="card-box">
                                    <div class="row">
                                        <div class="col-sm-12">
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger"><i class="fa fa-comment"></i> {$question} </span>
                                                </p>
                                                <div class="ad-leader-medium">
                                                  {do_ad_display('468x60')}
                                                </div>
                                                <hr>
                                             {if $type == 'multiselect'} 
                                                <p class="text-muted"> 
                                                  {$_CHOOSE_AN_ANSWER_BETWEEN} {$number} {$_ANSWERS}
                                                </p>
                                             {/if} 
                                                <p class="text-muted text-center font-600">
                                                    <span class="badge badge-danger">
                                                        <i class="fa fa-check"></i> 
                                                        {$_ANSWER_CORRECTLY}
                                                    </span>
                                                </p>
                                            <form method="POST">
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
                                               {if $type == 'multiselect'}
                                                 <div class="text-center">{$answers}
                                                 </div>
                                               {else} 

                                                <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" class="form-control" name="answer" placeholder="{$_ENTER_CORRECT_ANSWER}">
	                                                </div>
	                                            </div>
                                               {/if} 
										        	<div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{do_config(4)}" style="margin-left: 360px;"></div>
                                                <br>
                                                <div class="ad-leader-square">
                                                  {do_ad_display('300x250')}
                                                </div>
                                                <div class="text-center">
                                                <button type="submit" name="claim" value="claim" class="btn btn-primary boost"> {$_FINALE_ANSWER}
                                                </button>
                                                </div>
                                                <div class="ad-leader-medium">
                                                  {do_ad_display('468x60')}
                                                </div> 
                                            </form>
                                        </div><!-- end col -->
                                    </div><!-- end row -->

                                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->
                        </div>
                        <!-- end row -->


{include file="$TMP/Layout/User/footer.tpl"}
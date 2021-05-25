{include file="$TMP/Layout/OAuth/header.tpl"}

    <!-- ALERTS START HERE -->
    {if $sent}<div class="alert alert-{$_SENT}">{$__SENT}</div>{/if}
    {if $recaptcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
    {if $not_found}<div class="alert alert-{$_USRNOT_FOUND}">{$__USRNOT_FOUND}</div>{/if}
    {if $recovered}<div class="alert alert-{$_RECOVERED}">{$__RECOVERED}</div>{/if}
    {if $inrecover}<div class="alert alert-{$_INRECOVER}">{$__INRECOVER}</div>{/if}
    {if $required}<div class="alert alert-danger">{$__REQUIRED}</div>{/if}
    <!-- ALERTS END HERE -->

                                <div class="account-content">
                                    <div class="text-center m-b-20">
                                        <p class="text-muted m-b-0 font-13"><i class="fa fa-refresh"></i> {$__FORGOT_PASSWORD}</p>
                                    </div>
                                    <form class="form-horizontal" method="POST">

                                    <input type="hidden" name="csrf" value="{$csrfToken}">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                        <input class="form-control" type="text" name="username" required="required" placeholder="{$_USERNAME}">
                                            </div>
                                        </div>
                            {if do_config(28) == 1}
                            <div class="form-group">
                                <label for="password">{$_PROVE_YOUR_HUMAN}<span class="required">*</span></label>
											<div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{do_config(4)}"></div>
									</div>
                            {/if}

                                        <div class="form-group account-btn text-center m-t-10">
                                            <div class="col-xs-12">
                                                <button class="btn w-md btn-bordered btn-danger waves-effect waves-light" type="submit" name="rec" value="rec">{$_RECOVER}
                                                </button>
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
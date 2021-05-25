{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
	                           {if $sent}<div class="alert alert-{$_CONTACT_SENT}"> {$__CONTACT_SENT}</div>{/if}
	                           {if $do_error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
	                           {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="text-center">
                                                <h3 class="font-600">{$_SUPPORT_CENTER}</h3>
                                                <p class="text-muted"> {$__SUPPORT_CENTER}</p>
                                            </div>
                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                                <hr>
                                                <div class="ad-leader-medium">
                                                  {do_ad_display('468x60')}
                                                </div>

                        					<form class="form-horizontal" method="POST" style="padding-left: 200px;">
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="email" id="example-email" name="email" class="form-control" value="{$email}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" class="form-control" name="subject" placeholder="{$_SUBJECT}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                  <textarea class="form-control" rows="5" name="message" placeholder="{$_MESSAGE}"></textarea>
	                                                </div>
	                                            </div>

                                               <button type="submit" name="contact" value="contact" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_CONTACT}</button>
	                                        </form>

                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
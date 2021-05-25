{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
                            {if $pass}<div class="alert alert-{$_PASS_CHANGED}">{$__PASS_CHANGED}</div>{/if}
                            {if $confirm}<div class="alert alert-{$_PASS_NOTMATCH}">{$__PASS_NOTMATCH}</div>{/if}
                            {if $unchange}<div class="alert alert-{$_PASS_UNCHANGE}">{$__PASS_UNCHANGE}</div>{/if}
                            {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
                            
                                    <div class="row">
                                        <div class="col-sm-12">
                                                <h3 class="font-600 text-center"><i class="fa fa-lock"></i> {$_CHANGE_YOUR_PASSWORD}</h3>
                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                                <hr>
                                                <div class="ad-leader-medium">
                                                  {do_ad_display('468x60')}
                                                </div>
                        					<form class="form-horizontal" method="POST" style="padding-left: 200px;">
                                                <input type="hidden" name="csrf" value="{$csrfToken}" />
	                                            <div class="form-group">
	                                                <label for="prepass" class="col-md-10">{$_CURRENT_PASSWORD}</label>
	                                                <div class="col-md-10">
	                                                    <input type="password" name="prepass" class="form-control" placeholder="{$_CURRENT_PASSWORD}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <label for="newpassword" class="col-md-10">{$_NEW_PASSWORD}</label>
	                                                <div class="col-md-10">
	                                                    <input type="password" name="newpassword" class="form-control" placeholder="{$_NEW_PASSWORD}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <label for="confnewpassword" class="col-md-10">{$_RETYPE_NEW_PASSWORD}</label>
	                                                <div class="col-md-10">
	                                                    <input type="password" name="confnewpassword" class="form-control" placeholder="{$_RETYPE_NEW_PASSWORD}">
	                                                </div>
	                                            </div>
	                                            
                                               <button type="submit" name="pass" value="pass" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>

	                                        </form>


                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
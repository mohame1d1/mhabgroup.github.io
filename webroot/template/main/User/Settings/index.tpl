{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
                              {if $personal}<div class="alert alert-{$_PERSONAL}">{$__PERSONAL}</div>{/if}
                              {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
                                    <div class="row">
                                        <div class="col-sm-12">
                                                <h3 class="font-600 text-center"><i class="fa fa-cog"></i> {$_PERSONAL_INFORMATION}</h3>
                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                                <hr>
                                                <div class="ad-leader-medium">
                                                  {do_ad_display('468x60')}
                                                </div>

                        					<form class="form-horizontal" method="POST" style="padding-left: 200px;">
                                                <input type="hidden" name="csrf" value="{$csrfToken}" />
	                                            <div class="form-group">
	                                                <label for="username" class="col-md-10"> {$_USERNAME}</label>
	                                                <div class="col-md-10">
                                                         <input type="text" value="{$username}" class="form-control" disabled=disabled>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <label for="email" class="col-md-10">{$_EMAIL_ADDRESS}</label>
	                                                <div class="col-md-10">
	                                                    <input type="email" name="email" class="form-control" value="{$email}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <label for="Address" class="col-md-10"> {$_ADDRESS}</label>
	                                                <div class="col-md-10">
	                                                    <input type="text" name="withdraw_address" class="form-control" value="{$withdraw_address}">
                                                        {if do_config(6) == 'fhb'}
                                                        <span class="badge badge-danger"><i class="fa fa-warning"></i> {$_POWERED_FHB}</span>
                                                        {else}
                                                        <span class="badge badge-danger"><i class="fa fa-warning"></i> {$_ENTER_METHOD_ADDRESS}</span>
                                                        {/if}
	                                                </div>
	                                            </div>
                                                <div class="form-group">
                                                   <label for="CurrencyCode" class="col-md-10">
                                                    {$_COUNTRY}
                                                   </label>
                                                   <div class="col-md-10">
                                                    <select name="country" class="form-control">
                                                         <option value="=========" selected="selected">=========</option>
	                                                   {foreach from=$countries item=foo}
                                                         <option value="{$foo}"{if $country == $foo} selected="selected"{/if}>{$foo}</option>
                                                       {/foreach}
                                                     </select>
                                                     </div>
                                                   </div>

                                               <button type="submit" name="settings" value="settings" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>

	                                        </form>

                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
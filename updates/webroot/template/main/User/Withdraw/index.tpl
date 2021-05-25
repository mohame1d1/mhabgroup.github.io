{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
                               {if do_config(6) == 'fhb'}<div class="alert alert-info">{$_POWERED_FHB}</div>{/if}
	                           {if $small}<div class="alert alert-{$_SMALL_BALANCE}">{$__SMALL_BALANCE}</div>{/if}
	                           {if $do_error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
	                           {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger">{$_FEE_OF} {do_config(15)} {$sumbole}</span>
                                                </p>
                                                <hr>
                                                <div class="ad-leader-medium">
                                                  {do_ad_display('468x60')}
                                                </div>

                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-primary">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_EARNINGS}">{$_EARNINGS} <small>({$_TOTAL})</small></p>
                                                     <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-users"></i> {$balance} <small>{$sumbole}</small></span></h2>
                                                      </div>
                                                     </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                 <div class="card-box widget-box-two widget-two-warning">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_PENDINGS}">{$_PENDINGS} <small>({$_TOTAL})</small></p>
                                                      <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-money"></i> {$pending} <small>{$sumbole}</small></span></h2>
                                                    </div>
                                                  </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                               <div class="card-box widget-box-two widget-two-success">
                                                 <div class="wigdet-two-content">
                                                  <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_WITHDRAWN}">{$_WITHDRAWNN} <small >({$_TOTAL})</small></p>
                                                  <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-dollar"></i> {$withdrawn} {$sumbole}</span></h2>
                                                  </div>
                                                 </div>
                                                </div>
                                                <hr>
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger"><i class="fa fa-location-arrow"></i> {$_WITHDRAW_EARNINGS} </span></p>
                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <label for="Address" class="col-md-10">{$_ADDRESS}</label>
	                                                <div class="col-md-10">
	                                                    <input type="text" class="form-control" value="{$withdraw_address}" readonly>
	                                                </div>
	                                            </div>
                                               
                                               <button type="submit" name="withdraw" value="withdraw" class="btn btn-primary btn-bordered waves-effect w-md m-b-5" {if $balance < do_config(2)}disabled="disabled"{/if}> {$_WITHDRAW}</button>
	                                        </form>
                                            <hr>
                                            {if empty($withdraw_address)}
                                            <p>{$_FILL_YOUR_ADDRESS}</p>
                                            {/if}
                                            <p>{$_REACH_MIN_FOR_WITHDRAWN}</p>

                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
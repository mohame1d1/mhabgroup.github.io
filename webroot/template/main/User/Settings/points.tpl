{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
	                           {if $complete}<div class="alert alert-{$_POINTS_CONVERTED}">{$__POINTS_CONVERTED}</div>{/if}
	                           {if $small}<div class="alert alert-{$_POINTS_NOT_ENOUGHT}">{$__POINTS_NOT_ENOUGHT}</div>{/if}
	                           {if $do_error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
	                           {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger"><i class="fa fa-refresh"></i> {$_CONVERT_YOUR_POINTS}</span>
                                                </p>
                                                <hr>
                                                <div class="ad-leader-medium">
                                                  {do_ad_display('468x60')}
                                                </div>

                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-primary">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_POINTS}">{$_POINTS} <small>({$_TOTAL})</small></p>
                                                     <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-database"></i> {$points}</span></h2>
                                                      </div>
                                                     </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                 <div class="card-box widget-box-two widget-two-warning">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_MUNIMUMM}">{$_MUNIMUMM} <small>({$_TOTAL})</small></p>
                                                      <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-refresh"></i> {do_config(59)}</span></h2>
                                                    </div>
                                                  </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                               <div class="card-box widget-box-two widget-two-success">
                                                 <div class="wigdet-two-content">
                                                  <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$__CONVERT}">{$__CONVERT} <small >({$_TOTAL})</small></p>
                                                  <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-dollar"></i> {$converted_points} <small>{$sumbole}</small></span></h2>
                                                  </div>
                                                 </div>
                                                </div>
                                                <hr>
                                              {if $points < do_config(59)}
                                                <p class="text-muted text-center font-600"><span class="badge badge-primary"><i class="fa fa-warning"></i> {$_ENOUGHT_POINTS}</span></p>
                                               {/if}
                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <label for="Points" class="col-md-10">{$_POINTS}</label>
	                                                <div class="col-md-10">
	                                                    <input type="text" class="form-control" value="{$points}" readonly>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <label for="Amount" class="col-md-10">{$_AMOUNT}</label>
	                                                <div class="col-md-10">
	                                                    <input type="text" class="form-control" value="{$amount} {$sumbole}" readonly>
	                                                </div>
	                                            </div>

                                               <button type="submit" name="convert" value="convert" class="btn btn-primary btn-bordered waves-effect w-md m-b-5" {if $points < do_config(59)}disabled="disabled"{/if}> {$_CONVERT}</button>
	                                        </form>
                                            <hr>

                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
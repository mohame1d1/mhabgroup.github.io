{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
	                           {if $error}<div class="alert alert-danger">{$checkout_msg}</div>{/if}
	                           {if $small}<div class="alert alert-{$_SMALL_BALANCE}">{$__SMALL_BALANCE}</div>{/if}
	                           {if $do_error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
	                           {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger"><i class="fa fa-dollar"></i> {$_DEPOSIT_MONEY_ADVERTISING_BALANCE}</span>
                                                </p>
                                                <hr>

                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-primary">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_ADVERTISING_BALANCE}">{$_ADVERTISING_BALANCE} <small>({$_TOTAL})</small></p>
                                                     <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-money"></i> {$advertising_balance} <small>{$sumbole}</small></span></h2>
                                                      </div>
                                                     </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                 <div class="card-box widget-box-two widget-two-warning">
                                                   <div class="wigdet-two-content">
                                                         <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_ADS_SPENT}">{$_ADS_SPENT} <small>({$_TOTAL})</small></p>
                                                      <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-dollar"></i> {$spent} <small>{$sumbole}</small></span></h2>
                                                    </div>
                                                  </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                               <div class="card-box widget-box-two widget-two-success">
                                                 <div class="wigdet-two-content">
                                                  <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_ADS_PURCHASED}">{$_ADS_PURCHASED} <small >({$_TOTAL})</small></p>
                                                  <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-database"></i> {$purchased}</span></h2>
                                                  </div>
                                                 </div>
                                                </div>
                                                <hr>
                                                <p class="text-muted text-center font-600"><span class="badge badge-k"><i class="fa fa-bank"></i> {$_COINPAYMENTS_PROCESSOR} </span></p>
                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <label for="AMOUNT" class="col-md-10">{$_AMOUNT}</label>
	                                                <div class="col-md-10">
	                                                   <input type="text" class="form-control" name="amount" value="{do_config(58)}">
	                                                </div>
	                                            </div>

                                               <button type="submit" name="deposit" value="deposit" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_DEPOSIT}</button>
	                                        </form>

                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
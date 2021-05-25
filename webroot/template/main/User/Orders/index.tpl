{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
     {include file='../Orders/menu.tpl'}

                                    <div class="row">
                                        <div class="col-sm-12">

                                                <p class="text-muted text-center font-600"><span class="badge badge-danger"><i class="fa fa-user"></i> {$_YOUR_ADVERTISING_DASHBOARD} </span>
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
                                                <p class="text-muted text-center font-600"><span class="badge badge-k"><i class="fa fa-shopping-cart"></i> {$_BUY_ADS} </span></p>
                                                <hr>
                                               <div class="text-center">
                                                  <a href="{$USR}ptc/order" class="btn btn-danger btn-rounded waves-effect w-md m-b-5"><i class="fa fa-eye"></i> {$_BUY_PTC_ADS}</a>
                                                  <a href="#" class="btn btn-success btn-rounded waves-effect w-md m-b-5" disabled><i class="fa fa-image"></i> {$_BUY_BANNER_ADS}</a>
                                               </div>
                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
                
{include file="$TMP/Layout/User/footer.tpl"}
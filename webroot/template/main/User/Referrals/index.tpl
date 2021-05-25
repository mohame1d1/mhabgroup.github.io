{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
                                            
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger">{$_YOUR_REF_LINK}</span>
                                              <div class="form-group m-l-10">
                                                 <input type="text" class="form-control" readonly="readonly" disabled="disabled" value="{$HOST}ref/{$username}/ ">
                                              </div>
                                                </p>
                                                <hr>
                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-primary">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_REFERRALS}">{$_REFERRALS} <small>({$_TOTAL})</small></p>
                                                     <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-users"></i> {$referrals}</span></h2>
                                                      </div>
                                                     </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                 <div class="card-box widget-box-two widget-two-success">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_EARNED}"> {$_EARNED} <small>({$_REFERRALS})</small></p>
                                                      <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-dollar"></i> {$earned} <small>{$sumbole}</small></span></h2>
                                                    </div>
                                                  </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                               <div class="card-box widget-box-two widget-two-danger">
                                                 <div class="wigdet-two-content">
                                                  <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_EARNINGS}"> {$_EARNINGS} <small>({$_CURRENT})</small></p>
                                                  <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-money"></i> {$earning} <small>{$sumbole}</small></span></h2>
                                                  </div>
                                                 </div>
                                                </div>
                                        </div><!-- end col -->
                                    </div><!-- end row -->


                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
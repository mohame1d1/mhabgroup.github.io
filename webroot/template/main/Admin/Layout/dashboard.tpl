{include file='../Layout/header.tpl'}

                        <div class="row">
                        <div class="col-md-12">
                                <div class="card-box">
                                    <div class="row">
                                        <div class="col-sm-12">
                                        <p>{if $app_version}{$msg_version}{/if}</p>

                                             <div style="display: flex; justify-content: flex-end">
                                             </div><hr>
                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-primary">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Claims Today">Users Earnings <small>(TOTAL)</small></p>
                                                     <h2><span data-plugin="counterup"><i class="fa fa-dollar"></i> {$users_earnings} <small>{$sumbole}</small></span></h2>
                                                      </div>
                                                     </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                 <div class="card-box widget-box-two widget-two-success">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Users Claims">Users Claims <small>(Today)</small></p>
                                                      <h2><span data-plugin="counterup"><i class="fa fa-mouse-pointer left"></i> {$users_claims}</span></h2>
                                                    </div>
                                                  </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                               <div class="card-box widget-box-two widget-two-danger">
                                                 <div class="wigdet-two-content">
                                                  <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Shortlinks Today">Referral Earnings <small >(TOTAL)</small></p>
                                                  <h2><span data-plugin="counterup"><i class="fa fa-dollar"></i> {$referral_earnings} <small>{$sumbole}</small></span></h2>
                                                  </div>
                                                 </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-pink">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Claims Today">Users <small>(Total)</small></p>
                                                     <h2><span data-plugin="counterup"><i class="fa fa-users"></i> {$users}</span></h2>
                                                      </div>
                                                     </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                 <div class="card-box widget-box-two widget-two-warning">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Rewards Today">Withdraws <small>(PENDING)</small></p>
                                                      <h2><span data-plugin="counterup"><i class="fa fa-money"></i> {$users_withdraws}</span></h2>
                                                    </div>
                                                  </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                               <div class="card-box widget-box-two widget-two-purple">
                                                 <div class="wigdet-two-content">
                                                  <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Shortlinks">Shortlinks <small >(Total)</small></p>
                                                  <h2><span data-plugin="counterup"><i class="fa fa-link"></i> {$shortlinks}</span></h2>
                                                  </div>
                                                 </div>
                                                </div>
                                              <hr>
             <div class="row gutter-xs">
                <div class="col-xs-12 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4><i class="fa fa-line-chart"></i> 
                                Earnings <small> (Today) </small>
                            </h4>
                            <hr>
                        </div>
                        <div class="card-body" style="line-height: 1px;">
                           <div class="table-responsive">
                                <table class="table table-middle">
                                    <thead>
                                    <tr>
                                        <th><div class="fa fa-mouse-pointer left"></div> Faucet</th>
                                        <th><div class="fa fa-link"></div> Shortlink</th>
                                        <th><div class="fa fa-gift"></div> Offers</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <td>{$faucet_claims}</td>
                                    <td>{$shortlink_claims}</td>
                                    <td>{$offer_claims}</td>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4><i class="fa fa-users"></i>
                                Users
                            </h4>
                            <hr>
                        </div>
                        <div class="card-body">
                           <div class="table-responsive">
                                <table class="table table-middle">
                                    <thead>
                                    <tr>
                                        <th><div class="fa fa-check"></div> Active</th>
                                        <th><div class="fa fa-history"></div> Pending</th>
                                        <th><div class="fa fa-ban"></div> Inactive</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <td>{$active_users}</td>
                                    <td>{$pending_users}</td>
                                    <td>{$inactive_users}</td>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="row gutter-xs">
                <div class="col-xs-12 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4><i class="fa fa-dollar"></i>
                                Withdraws
                            </h4>
                            <hr>
                        </div>
                        <div class="card-body" style="line-height: 1px;">
                           <div class="table-responsive">
                                <table class="table table-middle">
                                    <thead>
                                    <tr>
                                        <th><div class="fa fa-history"></div> Pending</th>
                                        <th><div class="fa fa-money"></div> Sent</th>
                                        <th><div class="fa fa-times"></div> Cancelled</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <td>{$wpending} <b>{$sumbole}</b></td>
                                    <td>{$wsent} <b>{$sumbole}</b></td>
                                    <td>{$wcancel} <b>{$sumbole}</b></td>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4><i class="fa fa-bank"></i>
                                Invoices
                            </h4>
                            <hr>
                        </div>
                        <div class="card-body">
                           <div class="table-responsive">
                                <table class="table table-middle">
                                    <thead>
                                    <tr>
                                        <th><div class="fa fa-plus"></div> Invoices</th>
                                        <th><div class="fa fa-check-circle"></div> Paid</th>
                                        <th><div class="fa fa-times"></div> Unpaid</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <td>{$deposcount}</td>
                                    <td>{$depospaid} <b>USD</b></td>
                                    <td>{$deposunpaid} <b>USD</b></td>

                                    </tbody>
                                </table>
                            </div>
                        </div>
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

 

{include file='../Layout/footer.tpl'}
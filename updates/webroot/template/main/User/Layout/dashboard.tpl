{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger"><i class="fa fa-dashboard"></i> {do_config(1)}</span>
                                                </p>
                                                <hr>
                                                <div class="ad-leader-medium">
                                                  {do_ad_display('468x60')}
                                                </div>
                               {if $announcements} 
                                                <span>
                                                  <small class="text-muted pull-right">                                        <p class="m-0"><a href="{$HOST}user/announcements">{$_ALL_ANNOUNCEMENTS}</a></p>
                                                  </i>
                                                  </small>
                                                  <p class="text-muted font-600">{$_LATEST_NEWS}</p>
                                                 </span>
                                {foreach from=$announcements item=foo}
                                 <div class="box-body chat">
                                  <div class="item">
                                    <p class="announcement">
                                    <span>
                                     <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>
                                     {$foo['ago']}</small>
                                     <p class="text-muted font-600"><span class="badge badge-success"><i class="fa fa-angle-double-right"></i> {$foo['title']}</span></p>
                                    </span>
                                    <p>{$foo['content']}</p></p>
                                   </div>
                                 </div>
                                 <hr>
                                {/foreach}
                                {/if}
                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-primary">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_CLAIMS} {$_TODAY}">{$_CLAIMS} <small>({$_TODAY})</small></p>
                                                     <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-check"></i> {$fctclaims}</span></h2>
                                                      </div>
                                                     </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                 <div class="card-box widget-box-two widget-two-success">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_OFFERS} {$_TODAY}">{$_OFFERS} <small>({$_TODAY})</small></p>
                                                      <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-gift"></i> {$offclaims}</span></h2>
                                                    </div>
                                                  </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                               <div class="card-box widget-box-two widget-two-danger">
                                                 <div class="wigdet-two-content">
                                                  <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_SHORTLINKS} {$_TODAY}">{$_SHORTLINKS} <small >({$_TODAY})</small></p>
                                                  <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-link"></i> {$shortclaims}</span></h2>
                                                  </div>
                                                 </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-pink">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_REFERRALS}">{$_REFERRALS} <small>({$_TOTAL})</small></p>
                                                     <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-users"></i> {$referrals}</span></h2>
                                                      </div>
                                                     </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                 <div class="card-box widget-box-two widget-two-warning">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_EARNED}">{$_EARNED} <small>({$_TOTAL})</small></p>
                                                      <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-money"></i> {$balance} <small>{$sumbole}</small></span></h2>
                                                    </div>
                                                  </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                               <div class="card-box widget-box-two widget-two-purple">
                                                 <div class="wigdet-two-content">
                                                  <p class="m-0 text-uppercase font-600 font-secondary text-overflow" style="color: #e0d9e0;" title="{$_WITHDRAWN}">{$_WITHDRAWNN} <small >({$_TOTAL})</small></p>
                                                  <h2 style="color: #e0d9e0;"><span data-plugin="counterup"><i class="fa fa-dollar"></i> {$withdrawn} <small>{$sumbole}</small></span></h2>
                                                  </div>
                                                 </div>
                                                </div>
                                                <hr>
                                                <p class="text-muted text-center font-600"><span class="badge badge-primary"><i class="fa fa-money"></i> {$_EARN_BY}</span></p>
                                            <div class="text-center">
                                            {if do_config(41) == 1}
                                               <a href="{$USR}faucet" class="btn btn-secondary btn-bordered waves-effect w-md m-b-5"><i class="fa fa-mouse-pointer left"></i> {$_FAUCET}</a>&emsp;
                                            {/if}
                                            {if do_config(42) == 1}
                                               <a href="{$USR}shortlinks/index" class="btn btn-success btn-bordered waves-effect w-md m-b-5"><i class="fa fa-link"></i> {$_SHORTLINKS}</a>&emsp;
                                            {/if}
                                            {if do_config(39) == 1}
                                               <a href="{$USR}ptc/index" class="btn btn-danger btn-bordered waves-effect w-md m-b-5"><i class="fa fa-eye"></i> {$_PTC}</a>&emsp;
                                            {/if}
                                            {if do_config(40) == 1}
                                               <a href="{$USR}qa/index" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"><i class="fa fa-question-circle"></i> {$_QA}</a>
                                            {/if}
                                            <hr>
                                               <a href="{$USR}withdraw" class="btn btn-danger btn-bordered waves-effect w-md m-b-5"><i class="fa fa-location-arrow"></i> {$_WITHDRAW}</a>
                                               <a href="{$USR}deposit" class="btn btn-success btn-bordered waves-effect w-md m-b-5"><i class="fa fa-dollar"></i> {$_DEPOSIT}</a>
                                            </div>
                                                <div class="ad-leader-square">{do_ad_display('300x250')}</div>
                                                <div class="text-center">
                                    <hr><div class="row">
                                        <div class="col-sm-12">
                                         <h3 class="font-600"> <i class="fa fa-users"></i> {$_REFER_AND_EARN}</h3>
                                             <div style="display: flex; justify-content: flex-end">
                                               <span class="avatar-sm-box bg-primary"><i class="fa fa-share"></i></span>
                                             </div>
                                                <p class="text-muted">{$_EARN_REF_PERCENT}</p>
                                                <hr>
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger">{$_YOUR_REF_LINK}</span>
                                              <div class="form-group m-l-10">
                                                 <input type="text" class="form-control" disabled="disabled" value="{$HOST}ref/{$username}/">
                                              </div>
                                                </p>
                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                                </div>

                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
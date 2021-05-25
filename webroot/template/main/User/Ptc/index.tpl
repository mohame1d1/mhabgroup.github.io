{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
	                                {if $verified}<div class="alert alert-{$_CREDITS_EARNED_ONE}"> {$ptc_earn} {$__CREDITS_EARNED_ONE}{do_config(56)}{$__CREDITS_EARNED_TWO}</div>{/if}
	                                {if $error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
	                                
                                                <p class="text-muted text-center"> {do_config(45)}</p>
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger">{$__PTC}</span>
                                                </p>
                                                <p class="text-muted text-center font-600"><a href="{$USR}ptc/order"><span class="badge badge-primary"><i class="fa fa-plus"></i> {$_ADVERTISE_YOUR_SITE}</span></a></p>
                                                <hr>
                                                <div class="ad-leader-medium">
                                                {do_ad_display('468x60')}
                                                </div>
                                                {if !$ptclist}
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger">{$_NO_RECORDS_WERE_FOUND}</span>
                                                </p>
                                                {/if}
                                           {foreach from=$ptclist item=foo}
                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-primary">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow text-center" style="color: #e0d9e0;" data-toggle="tooltip" data-placement="top" title="" data-original-title="{$foo['description']}">{$foo['name']} <small>({$foo['timer']} sec)</small></p>

                                                       <h2 class="text-center" style="color: #e0d9e0;"><span data-plugin="counterup">
                                                    
                                                         {if number_format($foo['ver_ip']) == '1'}
                                                           <a href="#"><span class="btn btn-primary btn-rounded w-md waves-effect waves-light m-b-5" disabled="disabled"><i class="fa fa-check"></i> {$__VISIT}</span> </a>
                                                         {else}
                                                           <a href="{$USR}ptc/visit/{$foo['id']}/" target="_blank"><span class="btn btn-primary btn-rounded w-md waves-effect waves-light m-b-5"><i class="fa fa-link"></i> {$_VISIT}</span> </a>
                                                         {/if}  

                                                      </h2>
                                                      <div class="text-center">
                                                      <span class="badge badge-primary">{$foo['url']}</span>
                                                      </div>
                                                      </div>
                                                     </div>
                                                </div>
                                   	       {/foreach}
                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                                <div class="row" style="text-align: center"> 
                                                 <ul class="pagination">
                                                 {$paging} 
                                                 </ul>
                                                </div>
                                                <!-- end pagination -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
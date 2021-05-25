{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
	                                {if $verified}<div class="alert alert-{$_CREDITS_EARNED_ONE}"> {$st_earned} {$__CREDITS_EARNED_ONE}{do_config(55)}{$__CREDITS_EARNED_TWO}</div>{/if}
	                                {if $error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
	                                
                                                <p class="text-muted text-center"> {do_config(43)}</p>
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger">{$__SHORTLINKS}</span>
                                                </p>
                                                <hr>
                                                <div class="ad-leader-medium">
                                                  {do_ad_display('468x60')}
                                                </div>
                                               {if !$shortlinks}
                                                <div class="text-center">
                                                 <span class="badge badge-danger">{$_NO_RECORDS_WERE_FOUND}</span>
                                                </div>
                                               {/if}

                                           {foreach from=$shortlinks item=foo}
                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-primary">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow text-center" style="color: #e0d9e0;" data-toggle="tooltip" data-placement="top" title="" data-original-title="{$foo['description']}">{$foo['name']} <small>({number_format($foo['count_ip']-$foo['ver_ip'])}/{$foo['count_ip']})</small></p>

                                                       <h2 class="text-center" style="color: #e0d9e0;"><span data-plugin="counterup">
                                                    
                                                         {if number_format($foo['count_ip']-$foo['ver_ip']) == '0'}
                                                           <a href="#"><span class="btn btn-primary btn-rounded w-md waves-effect waves-light m-b-5" disabled="disabled"><i class="fa fa-check"></i> {$__CLAIM}</span> </a>
                                                         {else}
                                                           <a href="{$USR}shortlinks/visit/{$foo['id']}/" target="_blank"><span class="btn btn-primary btn-rounded w-md waves-effect waves-light m-b-5"><i class="fa fa-link"></i> {$_CLAIM}</span> </a>
                                                         {/if}  
                                                         
                                                    
                                                      </h2>
                                                      <div class="text-center">
                                                      <span class="badge badge-primary">{$foo['credit']} {$_CREDITS}</span>
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
{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">
                            
                            <div class="col-md-12">
	                          {if $verified}<div class="alert alert-{$_CREDITS_EARNED_ONE}"> {$qa_earn} {$__CREDITS_EARNED_ONE}{do_config(57)}{$__CREDITS_EARNED_TWO}</div>{/if}
	                          {if $error}<div class="alert alert-{$_WRONG_ANSWER}">{$__WRONG_ANSWER}</div>{/if}

                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="text-center">
                                                <p class="text-muted"><span class="badge badge-danger"><i class="fa fa-question-circle"></i> {do_config(46)}</span></p>
                                            </div>
                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                    <div class="text-center">
                                      {do_ad_display('468x60')}
                                    </div>
                                    <hr>
                                    <div class="table-responsive">
                                    <table class="table m-0">
                                            <thead class="bg-primary text-white text-center">
                                               <tr>
                                                 <th class="text-center"><i class="mdi mdi-menu"></i> {$_QUESTION}</th>
                                                 <th class="text-center"><i class="mdi mdi-sitemap"></i> {$_TYPE}</th>
                                                 <th class="text-center"><i class="mdi mdi-link"></i> {$_ACTIONS}</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                {foreach from=$qalist item=foo}

                                                            <tr class="text-center">
                                                                <td class="font-600"><i class="mdi mdi-menu"></i>  <span data-toggle="tooltip" data-placement="top" title="" data-original-title="{$foo['tooltip']}">{$foo['name']}</span></td>
                                                            <td>
                                                             {if $foo['type']=='oneselect'}
                                                              <span class="badge badge-danger">{$_CORRECT_ANSWER}</span>
                                                             {elseif $foo['type']=='multiselect'}
                                                              <span class="badge badge-danger">{$_CHOOSE_ANSWER}</span>
                                                             {/if}
                                                            </td>

                                                           <td>
                                                         {if number_format($foo['ver_ip']) > 0}
                                                           <a href="#" class="badge badge-success" disabled="disabled"><i class="fa fa-check"></i> {$_ANSWERED}</a>
                                                         {else}
                                                           <a href="{$USR}qa/answer/{$foo['id']}/" class="badge badge-success"><i class="fa fa-comment"></i> {$_ANSWER}</a>
                                                         {/if}
                                                                    </td>
                                                            </tr>
                                   	{/foreach}
                                                        </tbody>
                                                    </table>
                                          {if !$qalist}
                                            <div class="text-center">
                                               <span class="badge badge-danger">{$_NO_RECORDS_WERE_FOUND}</span>
                                            </div>
                                          {/if}

                                                </div>
                                    <div class="row text-center"> 
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
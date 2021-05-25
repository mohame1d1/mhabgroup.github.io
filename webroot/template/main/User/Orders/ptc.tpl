{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
     {include file='../Orders/menu.tpl'}
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-pencil"></i> {$_NAME}</th>
                                                                <th><i class="fa fa-history"></i> {$_TIMER}</th>
                                                                <th><i class="fa fa-link"></i> {$_URL}</th>
                                                                <th><i class="fa fa-line-chart"></i> {$_STATISTICS}</th>
                                                                <th><i class="fa fa-unsorted"></i> {$_STATUS}</th>
                                                                <th><i class="fa fa-calendar"></i> {$_DATE}</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$orders item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$foo['name']}</td>
                                                                <td><span class="badge badge-danger">{$foo['timer']} sec</span></td>
                                                                <td><span class="badge badge-danger">{$foo['url']}</span></td>
                                                                <td><span class="badge badge-danger">{$foo['current_clicks']}/{$foo['clicks']}</span></td>
                                                                <td>                                                               
                                               {if $foo['status'] == 1}
                                                               <span class="badge badge-success">{$_ACTIVE}</span>
                                               {elseif $foo['status'] == 2}
                                                               <span class="badge badge-warning">{$_UNPAID}</span>
                                               {elseif $foo['status'] == 3}
                                                               <span class="badge badge-info">{$_COMPLETED}</span>
                                               {/if}</td>
                                                                <td>{$foo['created']}</td>
                                                                

                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$orders}<span class="badge badge-danger elem-center" style="margin-left: 200px;">{$_NO_RECORDS_WERE_FOUND}</span>{/if}
                               </div>
                            </div>
                        </div>
                        <!-- end row -->
                        <div class="row" style="text-align: center"> 
                             <ul class="pagination">
                                       {$paging} 
                             </ul>
                        </div>
                        <!-- end pagination -->
                    </div> <!-- container -->

                </div> <!-- content -->
                
{include file="$TMP/Layout/User/footer.tpl"}
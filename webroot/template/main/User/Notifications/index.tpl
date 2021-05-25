{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-bell"></i> {$_NOTIFICATIONS}</th>
                                                                <th><i class="fa fa-cog"></i> {$_DETAILS}</th>
                                                                <th><i class="fa fa-calendar"></i> {$_DATE}</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$notif_index item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$foo['title']}</td>
                                                                <td>{$foo['details']}</td>
                                                                <td>{$foo['created']}</td>
                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$notif_index}<span class="badge badge-danger elem-center" style="margin-left: 200px;">{$_NO_RECORDS_WERE_FOUND}</span>{/if}
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
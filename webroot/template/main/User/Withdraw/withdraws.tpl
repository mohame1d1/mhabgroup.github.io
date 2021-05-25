{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
	                           {if $complete}<div class="alert alert-{$_WITHDRAWN}">{$__WITHDRAWN}</div>{/if}
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-bank"></i> {$_METHOD}</th>
                                                                <th><i class="fa fa-money"></i> {$_ADDRESS}</th>
                                                                <th><i class="fa fa-usd"></i> {$_AMOUNT}</th>
                                                                <th><i class="fa fa-unsorted"></i> {$_STATUS}</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$withdraws item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$foo['processor']} ({$foo['method']})</td>
                                                                <td>{$foo['address']}</td>
                                                                <td>{$foo['amount']} <b>{$sumbole}</b></td>
                                                                <td>
                                               {if $foo['status'] == 1}
                                                               <span class="badge badge-warning">{$_PENDINGS}</span>
                                               {elseif $foo['status'] == 2}
                                                               <span class="badge badge-info">{$_APPROVED}</span>
                                               {elseif $foo['status'] == 3}
                                                               <span class="badge badge-success">{$_COMPLETED}</span>
                                               {elseif $foo['status'] == 4}
                                                               <span class="badge badge-danger">{$_CANCELLED}</span>
                                               {/if}
                                                               </td>
                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$withdraws}<span class="badge badge-danger elem-center" style="margin-left: 200px;">{$_NO_RECORDS_WERE_FOUND}</span>{/if}
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
<hr>
<span class="badge badge-warning">{$_PENDINGS}: <b>{$__PENDINGS}</b></span><br>
<span class="badge badge-danger">{$_CANCELLED}: <b>{$__CANCELLED}</b></span><br>
<span class="badge badge-info">{$_APPROVED}: <b>{$__APPROVED}</b></span><br>
<span class="badge badge-success">{$_COMPLETED}: <b>{$__COMPLETED}</b></span>

                    </div> <!-- container -->

                </div> <!-- content -->
                
{include file="$TMP/Layout/User/footer.tpl"}
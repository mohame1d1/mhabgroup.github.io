{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-money"></i> {$_AMOUNT}</th>
                                                                <th><i class="fa fa-bank"></i> {$_METHOD}</th>
                                                                <th><i class="fa fa-comment"></i> {$_COMMENT}</th>
                                                                <th><i class="fa fa-unsorted"></i> {$_STATUS}</th>
                                                                <th><i class="fa fa-calendar"></i> {$_DATE}</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$invoices item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$foo['amount']} <b>{$sumbole}</b></td>
                                                                <td>{$foo['method']}</td>
                                                                <td>{$foo['status_text']}</td>
                                                                <td>
                                               {if $foo['status'] == 1}
                                                               <span class="badge badge-success">{$_PAID}</span>
                                               {elseif $foo['status'] == 2}
                                                               <span class="badge badge-danger">{$_UNPAID}</span>
                                               {/if}</td>
                                                                <td>{$foo['created']}</td>

                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$invoices}<span class="badge badge-danger elem-center" style="margin-left: 200px;">{$_NO_RECORDS_WERE_FOUND}</span>{/if}
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
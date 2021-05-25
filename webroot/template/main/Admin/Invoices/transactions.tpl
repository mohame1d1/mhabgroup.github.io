 {include file='../Layout/header.tpl'}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
                               {include file='../Invoices/menu.tpl'}   
     <form class="form-vertical" method="GET">
           <div class="form-group">
             <div class="col-sm-3">
             <select name="search" class="form-control">
               <option value="user_id" {if $search == "user_id"}selected{/if}>User ID</option>
               <option value="txn_id" {if $search == "txn_id"}selected{/if}>TX ID</option>
             </select>
             </div>
           </div>
	       <div class="form-group">
	         <div class="col-md-3">
	          <input type="text" name="data" class="form-control" placeholder="Search..." value="{$data}">
	         </div>
	       </div>
           <button type="submit" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Search</button>
	       </form>
	                                 <hr>
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-user"></i> User</th>
                                                                <th><i class="fa fa-bank"></i> Method</th>
                                                                <th><i class="fa fa-dollar"></i> TX ID</th>
                                                                <th><i class="fa fa-money"></i> Amount</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$transactions item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td><a href="{$ADM}users/view/{$foo['user_id']}/"><button class="btn btn-info btn-xs"><i class="fa fa-user" style="font-size: 15px;"></i> {$foo['username']}</button></a></td>
                                                                <td>{$foo['currency_code']}</td>
                                                                <td>{$foo['txn_id']}</td>
                                                                <td>{$foo['crypto_am']} <b>{$foo['currency_code']}</b></td>
                                                                <td>{$foo['payment_status']}</td>
                                                                <td>{$foo['created']}</td>
                                                                
                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$transactions}<span class="badge badge-danger elem-center" style="margin-left: 200px;">No transactions was Found..</span>{/if}
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
                       </div>
                
{include file='../Layout/footer.tpl'}
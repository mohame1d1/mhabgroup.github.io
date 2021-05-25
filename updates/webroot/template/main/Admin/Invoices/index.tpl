 {include file='../Layout/header.tpl'}
                
                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
     {if $activated}<div class='alert alert-success'>Invoice Marked As Paid!</div>{/if}
     {if $deleted}<div class="alert alert-success">Invoice Deleted Successfully</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
     {include file='../Invoices/menu.tpl'}
     <form class="form-vertical" method="GET">
           <div class="form-group">
             <div class="col-sm-3">
             <select name="search" class="form-control">
               <option value="user_id" {if $search == "user_id"}selected{/if}>User ID</option>
               <option value="status" {if $search == "status"}selected{/if}>Status (1=Paid, 2=Unpaid)</option>
               <option value="method" {if $search == "method"}selected{/if}>Method</option>
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
                                                                <th><i class="fa fa-money"></i> Amount</th>
                                                                <th><i class="fa fa-bank"></i> Method</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$invoices item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td><a href="{$ADM}users/view/{$foo['user_id']}/"><button class="btn btn-info btn-xs"><i class="fa fa-user" style="font-size: 15px;"></i> {$foo['username']}</button></a></td>
                                                                <td>{$foo['amount']} <b>{$foo['method']}</b></td>
                                                                <td>{$foo['method']}</td>
                                                                <td>
                                               {if $foo['status'] == 1}
                                                               <span class="badge badge-success">Paid</span>
                                               {elseif $foo['status'] == 2}
                                                               <span class="badge badge-danger">Unpaid</span>
                                               {/if}</td>
                                                                <td>{$foo['created']}</td>
                                                                
                                                                                                                                <td>
               {if $foo['status']==2}
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Mark As Paid</button>
                   </form>
              {/if}
                    </td>
                   <td>
                     <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-warning btn-xs" type="submit" name="delete" value="Delete" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Delete</button>
                     </form> 
                    </td>
                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$invoices}<span class="badge badge-danger elem-center" style="margin-left: 200px;">No invoices was Found..</span>{/if}
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
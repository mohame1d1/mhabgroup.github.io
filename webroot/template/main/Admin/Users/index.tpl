 {include file='../Layout/header.tpl'}

                       <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
     {if $deactivated}<div class="alert alert-success">User Deactivated Successfully</div>{/if}
     {if $activated}<div class="alert alert-success">User Activated Successfully</div>{/if}
     {if $deleted}<div class="alert alert-success">User Deleted Successfully</div>{/if}
     {if $added}<div class="alert alert-success">User Added Successfully</div>{/if}
     {if $updated}<div class="alert alert-success">User Updated Successfully</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
     {include file='../Users/menu.tpl'}
     <form class="form-vertical" method="GET">
           <div class="form-group">
             <div class="col-sm-3">
             <select name="search" class="form-control">
               <option value="username" {if $search == "username"}selected{/if}>Username</option>
               <option value="email" {if $search == "email"}selected{/if}>E-mail</option>
               <option value="status" {if $search == "status"}selected{/if}>Status (1=active, 2=inactive, 3=pending)</option>
               <option value="withdraw_address" {if $search == "withdraw_address"}selected{/if}>Withdraw Address</option>
               <option value="login_ip" {if $search == "login_ip"}selected{/if}>Login IP</option>
               <option value="register_ip" {if $search == "register_ip"}selected{/if}>Registred IP	</option>
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
                                                                <th><i class="fa fa-user"></i> Username</th>
                                                                <th><i class="fa fa-envelope-o"></i> Email</th>
                                                                <th><i class="fa fa-wifi"></i> Login IP</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$members item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$foo['username']}</td>
                                                                <td>{$foo['email']}</td>
                                                                <td>{$foo['login_ip']}</td>
                                                                <td>
                                               {if $foo['status'] == 1}
                                                               <span class="badge badge-success">Active</span>
                                               {elseif $foo['status'] == 2}
                                                               <span class="badge badge-danger">Inactive</span>
                                               {elseif $foo['status'] == 3}
                                                               <span class="badge badge-warning">Pending</span>
                                               {/if}</td>
                                                                <td>{$foo['created']}</td>
                 <td style="text-align: center">
                   <a href="{$ADM}users/view/{$foo['id']}/">
                      <button class="btn btn-info btn-xs">View</button>
                    </a>
                 </td>
                                                                                                                                <td>
                {if $foo['status']==1}
                    <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="deactivate" value="deactivate" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Deactivate</button>
                    </form>
               {elseif $foo['status']==2 || $foo['status']==3}
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Activate</button>
                   </form>
              {/if}
                    </td>
                   <td>
                     <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-warning btn-xs" type="submit" name="delete" value="Delete" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Delete</button>
                     </form> 
                    </td>
                    <td>
                     <form method="POST" action="{$ADM}users/edit/{$foo['id']}/">
                      <button class="btn btn-success btn-xs" type="submit">Edit</button>
                     </form> 
                    </td>
                    
                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$members}<span class="badge badge-danger elem-center" style="margin-left: 200px;">No Users was Found..</span>{/if}
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
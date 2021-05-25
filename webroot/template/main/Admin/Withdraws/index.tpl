{include file='../Layout/header.tpl'}


                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
{if $approved}<div class='alert alert-success'>Withdrawal Approved Successfully</div>{/if}
{if $completed}<div class='alert alert-success'>Withdrawal Completed Successfully</div>{/if}
{if $canceled}<div class='alert alert-success'>Withdrawal Canceled Successfully</div>{/if}
{if $check}{$fhb_msg}{/if}
     <form class="form-vertical" method="GET">
           <div class="form-group">
             <div class="col-sm-3">
             <select name="search" class="form-control">
               <option value="user_id" {if $search == "user_id"}selected{/if}>User ID</option>
               <option value="address" {if $search == "address"}selected{/if}>Withdraw Address</option>
               <option value="status" {if $search == "status"}selected{/if}>Status (1=Pending, 2=Approved, 3=Completed, 4=Cancelled)</option>
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
                                                                <th><i class="fa fa-dollar "></i> Amount</th>
                                                                <th><i class="fa fa-money"></i> Account</th>
                                                                <th><i class="fa fa-bank"></i> Method</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            
                                                            
	                                           {foreach from=$withdraws item=foo}
                                                            <tr>
                                               <td>{$foo['id']} </td>
                                               <td> <a href="{$ADM}users/view/{$foo['user_id']}/">
                                               <button class="btn btn-info btn-xs"><i class="fa fa-user"></i> {$foo['username']}</button>
                                               </a>
                                               </td>
                                               <td><span>{$foo['amount']}</span> <b>{$sumbole}</b></td>
                                               <td>{$foo['address']} </td>
                                               <td>{$foo['processor']} ({$foo['method']})</td>
                                               <td>
                                               {if $foo['status'] == 1}
                                                               <span class="badge badge-warning">Pending</span>
                                               {elseif $foo['status'] == 2}
                                                               <span class="badge badge-info">Approved</span>
                                               {elseif $foo['status'] == 3}
                                                               <span class="badge badge-success">Completed</span>
                                               {elseif $foo['status'] == 4}
                                                               <span class="badge badge-danger">Cancelled</span>
                                               {/if}</td>
                                                                <td>{$foo['created']}</td>
                                                                
                                                                                                                                
                {if $foo['status']==1}
                    <td>
                    <form method="POST">
                      <input type="hidden" name="csrf" value="{$csrfToken}">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <input type="hidden" name="role" value="approve"> 
                      <button class="btn btn-info btn-xs" type="submit" name="wform" value="Approve">Approved</button>
                    </form>
                    </td>
                    <td>
                    <form method="POST">
                      <input type="hidden" name="csrf" value="{$csrfToken}">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <input type="hidden" name="role" value="cancel"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="wform" value="cancelled">Cancelled</button>
                    </form>
                    </td>
               {elseif $foo['status']==2}
                   <td>
                   <form method="POST">
                      <input type="hidden" name="csrf" value="{$csrfToken}">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <input type="hidden" name="role" value="complete"> 
                      <button class="btn btn-success btn-xs" type="submit" name="wform" value="completed">Completed</button>
                   </form>
                   </td>
              {/if}
                    <td>
                      <form method="POST" action="{$ADM}withdraws/edit/{$foo['id']}/">
                        <div class="col-sm-8 col-sm-offset-3">
                         <div class="form-group">
                              <input class="btn btn-warning btn-xs" type="submit" value="Edit"/>
                            </div>
                        </div>
                      </form>
                    </td>
                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$withdraws}<span class="badge badge-danger elem-center" style="margin-left: 200px;">No withdraws was Found..</span>{/if}
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

<span class="badge badge-warning">{$_PENDINGS}: <b>{$__PENDINGS}</b></span><br>
<span class="badge badge-danger">{$_CANCELLED}: <b>{$__CANCELLED}</b></span><br>
<span class="badge badge-info">{$_APPROVED}: <b>{$__APPROVED}</b></span><br>
<span class="badge badge-success">{$_COMPLETED}: <b>{$__COMPLETED}</b></span>

{include file='../Layout/footer.tpl'}
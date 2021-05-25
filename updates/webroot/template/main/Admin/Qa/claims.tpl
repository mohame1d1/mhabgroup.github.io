 {include file='../Layout/header.tpl'}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
     {if $deactivated}<div class='alert alert-success'>Claim Unverified Successfully</div>{/if}
     {if $activated}<div class='alert alert-success'>Claim Verified Successfully</div>{/if}
     {if $deleted}<div class="alert alert-success">Claim Deleted Successfully</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
     {include file='../Qa/menu.tpl'}
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-user"></i> User</th>
                                                                <th><i class="fa fa-key"></i> Key</th>
                                                                <th><i class="fa fa-money"></i> Amount</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$claims item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td><a href="{$ADM}users/view/{$foo['user_id']}/"><button class="btn btn-info btn-xs"><i class="fa fa-user" style="font-size: 15px;"></i> {$foo['username']}</button></a></td>
                                                                <td>{$foo['verify_key']}</td>
                                                                <td>{$foo['amount']} <b>{$sumbole}</b></td>
                                                                <td>
                                               {if $foo['status'] == 1}
                                                               <span class="badge badge-success">Verified</span>
                                               {elseif $foo['status'] == 2}
                                                               <span class="badge badge-danger">Unverified</span>
                                               {/if}</td>
                                                                <td>{$foo['created']}</td>
                                                                
                                                                                                                                <td>
                {if $foo['status']==1}
                    <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <input type="hidden" name="user_id" value="{$foo['user_id']}"> 
                      <input type="hidden" name="amount" value="{$foo['amount']}"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="deactivate" value="Deactivate" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Unverify</button>
                    </form>
               {elseif $foo['status']==2}
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <input type="hidden" name="user_id" value="{$foo['user_id']}"> 
                     <input type="hidden" name="amount" value="{$foo['amount']}"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Verify</button>
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
                                               {if !$claims}<span class="badge badge-danger elem-center" style="margin-left: 200px;">No Qa claims was Found..</span>{/if}
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
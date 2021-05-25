 {include file='../Layout/header.tpl'}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
     {if $updated}<div class="alert alert-success">PTC Updated Successfully</div>{/if}
     {if $added}<div class="alert alert-success">PTC Added Successfully</div>{/if}
     {if $deactivated}<div class='alert alert-success'>PTC Deactivated Successfully</div>{/if}
     {if $activated}<div class='alert alert-success'>PTC Activated Successfully</div>{/if}
     {if $deleted}<div class="alert alert-success">PTC Deleted Successfully</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
     {include file='../Ptc/menu.tpl'}
                                     <div class="table-responsive">
                                                    <table class="table m-0">
                                                        
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-pencil"></i> Name</th>
                                                                <th><i class="fa fa-link"></i> URL</th>
                                                                <th><i class="fa fa-history"></i> Timer</th>
                                                                <th><i class="fa fa-line-chart"></i> Statistics</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$ptclinks item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$foo['name']}</td>
                                                                <td><span class="badge badge-danger">{$foo['url']}</span></td>
                                                                <td><span class="badge badge-danger">{$foo['timer']} <em>Sec</em></span> </td>
                                                                <td><span class="badge badge-danger">{$foo['current_clicks']}/{$foo['clicks']}</span></td>
                                                                
                                                                <td>
                                               {if $foo['status'] == 1}
                                                               <span class="badge badge-success">Active</span>
                                               {elseif $foo['status'] == 2}
                                                               <span class="badge badge-danger">Inactive</span>
                                               {elseif $foo['status'] == 3}
                                                               <span class="badge badge-info">Completed</span>
                                               {/if}</td>
                                                                                                                                <td>
                {if $foo['status']==1}
                    <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="deactivate" value="deactivate" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Deactivate</button>
                    </form>
               {elseif $foo['status']==2}
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Activate</button>
                   </form>
               {elseif $foo['status']==3}
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" disabled="disabled">Activate</button>
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
                   <form action="{$ADM}ptc/edit/{$foo['id']}/" method="POST">
                    <button class="btn btn-success btn-xs">Edit</button>
                   </form>
                   </td>
                    
                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$ptclinks}<span class="badge badge-danger elem-center" style="margin-left: 200px;">No ptc was Found..</span>{/if}
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
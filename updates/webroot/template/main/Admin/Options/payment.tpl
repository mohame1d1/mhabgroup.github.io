{include file="../Layout/header.tpl"}
                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
             {if $updated}<div class='alert alert-success'>Payment Settings Updated Successfully!</div>{/if}
             {if $do_error}<div class='alert alert-danger'>Error: Somthing wrong! Please Try again.</div>{/if}
             {include file='../Options/menu.tpl'}
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-bank"></i> Method</th>
                                                                <th><i class="fa fa-money"></i> Symbol</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$currencies item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$foo['name']}</td>
                                                                <td>{$foo['symbol']}</td>
                                                                <td>
                                                              {if $foo['status'] == 1}
                                                                 <span class="badge badge-success">Active</span>
                                                              {elseif $foo['status'] == 2}
                                                                 <span class="badge badge-danger">Inactive</span>
                                                              {/if}
                                                                </td>
                                                                <td>{$foo['created']}</td>
                                                                <td>
                {if $foo['status']==1}
                    <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="deactivate" value="Deactivate" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Deactivate</button>
                    </form>
               {elseif $foo['status']==2}
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
                   <form action="{$ADM}options/edit/{$foo['id']}/" method="POST">
                    <button class="btn btn-success btn-xs">Edit</button>
                   </form>
                   </td>
                    </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$currencies}<span class="badge badge-danger elem-center" style="margin-left: 200px;">No withdraw methods was Found..</span>{/if}
                                               <hr>
                 <form class="form-horizontal" method="POST">
                      <div class="form-group">
                          <label for="DepositProcessor" class="col-md-10">
                            Deposit Processor
                          </label>
                          <div class="col-md-6">
                           <select id="select_role" name="deposit_processor" class="form-control">
                             <option value="coinpayments" {if do_config(61) == 'coinpayments'}selected="selected"{/if}>Coinpayments</option>
                             <option value="coinbase" {if do_config(61) == 'coinbase'}selected="selected"{/if}>Coinbase</option>
                           </select>
                      </div><hr>
                      </div>
                        <script>
                            document.getElementById('select_role').addEventListener('change', function () {
                            var style = this.value == 'coinpayments' ? 'block' : 'yes';
                            document.getElementById('cpm_div').style.display = style;
	                        var style = this.value == 'coinbase' ? 'block' : 'none';
                            document.getElementById('cbs_div').style.display = style;
	                        });
                            document.getElementById('select_role').addEventListener('change', function () {
                            var style = this.value == 'coinbase' ? 'block' : 'yes';
                            document.getElementById('cbs_div').style.display = style;
	                        var style = this.value == 'coinpayments' ? 'block' : 'none';
                            document.getElementById('cpm_div').style.display = style;
	                        });
                        </script>
                      <div class="form-group">
                           <label for="CurrencyCode" class="col-md-10">
                            Currency Code
                           </label>
                           <div class="col-md-6">
                              <select name="currency" class="form-control">
	                           {foreach from=$currencies item=foo}
                                <option value="{$foo['symbol']}"{if $sumbole == $foo['symbol']} selected="selected"{/if}>{$foo['name']}</option>
                               {/foreach}
                             </select>
                           </div>
                      </div>
                      <div class="form-group">
                           <label for="CoinPaymentsPublicKey" class="col-md-10">
                               Minimum deposit
                           </label>
                          <div class="col-md-6">
                             <input type="text" name="min_deposit" class="form-control" value="{do_config(58)}"/>
                          </div>
                      </div><hr>
                      <div id="cbs_div"{if do_config(61) == 'coinbase'}style="display: yes;"{else}style="display: none;"{/if}>             
                      <h4>Coinbase Settings</h4><br>
                      <span class="help"><i class="fa fa-question-circle"></i> For instructions step by step click <a href="{$HOST}pages/coinbase-setup" target="_blank">here</a>.</span>
                      <hr>
                      <div class="form-group">
                            <label for="CoinbaseAPIKey" class="col-md-10">
                               Coinbase API Key
                            </label>
                            <div class="col-md-6">
                               <input name="cbs_secret_key" class="form-control" type="text" value="{$cbs_secret_key}"/>
                          </div>
                      </div>
                      <div class="form-group">
                            <label for="CoinbaseSharedSecret" class="col-md-10">
                              Coinbase Shared Secret
                            </label>
                            <div class="col-md-6">
                                 <input type="text" name="cbs_ipn" class="form-control" value="{$cbs_ipn}"/>
                            </div>
                       </div>
                      </div>                                              
                      <div id="cpm_div" {if do_config(61) == 'coinpayments'}style="display: yes;"{else}style="display: none;"{/if}>             
                      <h4>CoinPayments Settings</h4><br>
                      <span class="help"><i class="fa fa-question-circle"></i> For instructions step by step click <a href="{$HOST}pages/coinpayments-setup" target="_blank">here</a>.</span>
                      <hr>
                      <div class="form-group">
                           <label for="CoinPaymentsPublicKey" class="col-md-10">
                               CoinPayments Public Key
                           </label>
                          <div class="col-md-6">
                             <input type="text" name="cpm_public_key" class="form-control" value="{$cpm_public_key}"/>
                          </div>
                      </div>
                      <div class="form-group">
                            <label for="CoinPaymentsPrivateKey" class="col-md-10">
                               CoinPayments Private Key
                            </label>
                            <div class="col-md-6">
                               <input name="cpm_secret_key" class="form-control" type="text" value="{$cpm_secret_key}"/>
                          </div>
                      </div>
                      <div class="form-group">
                            <label for="CoinPaymentsMerchantId" class="col-md-10">
                               CoinPayments Merchant Id
                            </label>
                           <div class="col-md-6">
                                <input type="text" name="cpm_merchant_id" class="form-control" value="{$cpm_account}"/>
                           </div>
                       </div>
                      <div class="form-group">
                            <label for="CoinPaymentsIPNSecret" class="col-md-10">
                              CoinPayments IPN Secret
                            </label>
                            <div class="col-md-6">
                                 <input type="text" name="cpm_ipn" class="form-control" value="{$cpm_ipn}"/>
                            </div>
                       </div>
                      </div>
                       
                       <button type="submit" name="up-payments" value="up-payments" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>


                    </form>
                                 </div>
                            </div>
                        </div>
{include file="../Layout/footer.tpl"}
{include file="../Layout/header.tpl"}
                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
             {if $updated}<div class='alert alert-success'>Withdraws Settings Updated Successfully!</div>{/if}
             {if $do_error}<div class='alert alert-danger'>Error: Somthing wrong! Please Try again.</div>{/if}
             {include file='../Options/menu.tpl'}
                 <form class="form-horizontal" method="POST">
                      <div class="form-group">
                           <label for="Payouts" class="col-md-10">
                            Payouts
                           </label>
                           <div class="col-md-6">
                              <select name="form_withdraw" class="form-control">
                                <option value="fhb"{if do_config(6) == 'fhb'} selected="selected"{/if}>Only FaucetHub</option>
                                <option value="all"{if do_config(6) == 'all'} selected="selected"{/if}>All Methods</option>
                             </select>
                           </div>
                      </div>
                      <div class="form-group">
                            <label for="Minimumwithdraw" class="col-md-10">
                             Minimum withdraw
                            </label>
                            <div class="col-sm-6">
                                 <input type="text" name="min_withdraw" class="form-control" value="{do_config(2)}"/>
                         </div>
                      </div>
                      <div class="form-group">
                            <label for="Fees" class="col-md-10">
                             Fees
                            </label>
                            <div class="col-sm-6">
                                 <input type="text" name="withdraw_fee" class="form-control" value="{do_config(15)}"/>
                         </div>
                      </div>

                     {if do_config(6) == 'fhb'}
                      <h3>FaucetHub Settings</h3><br>
                      <span class="help"><i class="fa fa-question-circle"></i> For instructions step by step click <a href="{$HOST}pages/fhb-setup" target="_blank">here</a>.</span><hr>
                      <div class="form-group">
                            <label for="APIKEY" class="col-md-10">
                              API KEY
                            </label>
                            <div class="col-sm-6">
                                 <input type="text" name="fhb_api" class="form-control" value="{do_config(10)}"/>
                         </div>
                      </div>
                     {/if}
                       <button type="submit" name="up-withdraw" value="up-withdraw" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> {$_SAVE}</button>

                    </form>
                                 </div>
                            </div>
                        </div>
{include file="../Layout/footer.tpl"}
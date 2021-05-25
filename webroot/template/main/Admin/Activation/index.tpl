{include file='../Layout/header.tpl'}
                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
     {if $wrong}<div class="alert alert-danger">{$license_msg}</div>{/if}
                    <form class=" form-horizontal" method="POST">
                    
                        
                        <div class="form-group">
                            <label for="APIKey" class="col-sm-10">
                               API Key
                            </label>
                            <div class="col-sm-6">
                               
                                    <input name="api_key" class="form-control" type="text" required="true"/>
                                    <em><b>Get your API key from <a href="https://codsem.com/user/setting?r=api-key" target="_blank">here</a>.</b></em>
                                </div>
                            </div>
                        <div class="form-group">
                            <label for="PurchaseCode" class="col-sm-10">
                               Purchase Code
                            </label>
                            <div class="col-sm-6">
                               
                                    <input name="purchase_code" class="form-control" type="text" required="true"/>
                                    <em><b> Get your Purchase code from <a href="https://codsem.com/user/downloads" target="_blank">here</a>.</b></em>
                                </div>
                            </div>
                        
                        <div class= "form-group">  
                            <div class="col-sm-6">

                                <button type="submit" class="btn btn-info" name="activation-verify" value="activation-verify">Activate</button>
                                        
                            </div>
                        </div>

                    
                    </form>

                               </div>
                            </div>
                        </div>
                        <!-- end row -->
                       </div>

{include file='../Layout/footer.tpl'}
{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
                                               <p class="text-muted text-center font-600"><span class="badge badge-danger"><i class="fa fa-bitcoin"></i> {$_SEND_AMOUNT_TO_ADDRESS}</span>
                                               </p>
                                               <hr>
                                               <p class="text-center font-600"><i class="fa fa-money"></i> {$_CONFIRMATIONS_NEEDED} : ({$confirm_needed})</p>
                                               <hr>
                                               <p class="text-center font-600"><i class="fa fa-sort"></i> {$_TRANSACTION_STATUS} : ({$status})</p>
                                               <hr>
                                               <p class="text-center font-600"><i class="fa fa-dollar"></i> 
                                                   {$_AMOUNT} : {$total} {$sumbole}</p>
                                               <p class="text-center font-600"><img src="{$qrcode}" alt="QrCode"></p>
                                               <p class="text-center font-600" style="border-style: dashed;border-color: #0f0f0f;border-top-width: 1px;border-bottom-width: 1px;border-right-width: 1px;border-left-width: 1px;">{$address}</p>
                                               <p class="text-muted text-center font-600"><span class="badge badge-k"><i class="fa fa-dollar"></i> {$_AMOUNT} : {$total} {$sumbole}</span></p>
                                               <hr>


                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
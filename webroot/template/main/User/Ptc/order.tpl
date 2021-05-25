{include file="$TMP/Layout/User/header.tpl"}

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">

                                    <div class="row">
                                        <div class="col-sm-12">
	                                {if $error}<div class="alert alert-danger">{$coinpayment_msg}</div>{/if}
	                                {if $do_error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
	                                {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
	                                {if $small}<div class="alert alert-{$_SMALL_AD_BALANCE}">{$__SMALL_AD_BALANCE}</div>{/if}
                                                <p class="text-muted text-center"><i class="fa fa-shopping-cart"></i> {$__ORDER_PTC}</p>
                                                <p class="text-muted text-center font-600"><span class="badge badge-danger"><i class="fa fa-bullhorn"></i> {$_TARGET_USERS}</span>
                                                </p>
                                                <hr>
                        					<form class="form-horizontal" method="POST">
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="title" class="form-control" placeholder="{$_TITLE}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                  <textarea class="form-control" rows="5" name="description" placeholder="{$_DESCRIPTION}"></textarea>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="url" class="form-control" name="url" placeholder="{$_URL}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="number" class="form-control" name="visitors" value="{$ptc_min}" step="1"  id="count-price" onkeyup="fun()">
	                                                </div>
	                                            </div>
                                                <div class="form-group">
                                                   <div class="col-md-10">
                                                    <select name="timer" class="form-control">
							                       	 <option value="5" selected="selected">5 sec</option>
							                       	 <option value="10">10 sec</option>
							                       	 <option value="15">15 sec</option>
                                                     </select>
                                                    </div>
                                                </div>

                                                <p class="text-muted font-600"><span class="badge badge-primary">{$_PRICE} <b id="price-calucate">{number_format($ptc_min * $ptc_price,8,".",".")}</b> {$sumbole}</span> </p>

                                                <script>
                                                 function fun(){
                                                  var price = "{$ptc_price}";
                                                  var click = document.getElementById("count-price").value;
                                                  var calculate = (click * price).toFixed(8);
                                                  var ausgabe = (calculate);
                                                  document.getElementById("price-calucate").innerHTML = ausgabe;
                                                 }
                                                </script>
                                               <button type="submit" name="order" value="order" class="btn btn-primary btn-bordered waves-effect w-md m-b-5" ><i class="fa fa-next"></i> {$_ORDER}</button>

	                                        </form>

                                        </div><!-- end col -->
                                    </div><!-- end row -->
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                
{include file="$TMP/Layout/User/footer.tpl"}
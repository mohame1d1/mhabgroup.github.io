{include file='../Layout/header.tpl'}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                     {include file='../Ads/menu.tpl'}

                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
                                                <div class="form-group">
                                                    <div class="col-md-10">
                                                       <select name="type" class="form-control">
                                                        <option value="banner" >Banner</option>
                                                        <option value="adcode" >Adcode</option>
                                                       </select>
                                                    </div>
                                                </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="name" class="form-control" placeholder="Name">
	                                                </div>
	                                            </div>
                                                <div class="form-group">
                                                    <div class="col-md-10">
                                                       <select name="size" class="form-control">
                                                        <option value="N/A" selected="selected">N/A</option>
                                                        <option value="728x90" >728x90</option>
                                                        <option value="468x60" >468x60</option>
                                                        <option value="300x250" >300x250</option>
                                                        <option value="336x280" >336x280</option>
                                                        <option value="120x600" >120x600</option>
                                                        <option value="160x600" >160x600</option>
                                                       </select>
                                                    </div>
                                                </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <textarea type="text" name="code" rows="10" cols="90" class="form-control" placeholder="Code"></textarea>
	                                                </div>
	                                            </div>

                                               <button type="submit" name="add-ads" value="add-ads" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Add</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->

{include file='../Layout/footer.tpl'}
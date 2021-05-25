{include file='../Layout/header.tpl'}


                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}

                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
                                                    <label for="Method" class="col-sm-10">
                                                        Method Name
                                                    </label>
	                                                <div class="col-md-10">
                                                     <input type="text" name="method" class="form-control" value="{$r_name}"/>	                                           
                                                    </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Symbol" class="col-sm-10">
                                                        Symbol
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="text" name="symbol" class="form-control" value="{$r_symbol}">
	                                                </div>
	                                            </div>

                                               <button type="submit" name="up-options" value="up-options" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Save</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                        
{include file='../Layout/footer.tpl'}
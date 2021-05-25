{include file='../Layout/header.tpl'}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}

                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
                                                <div class="form-group">
                                                    <label for="Status" class="col-sm-10">
                                                         Status
                                                    </label>
                                                    <div class="col-sm-10">
                                                    <select name="status" class="form-control">
                                                       <option value="1" {if $r_status == 1} selected="selected"{/if}>Pending</option>
                                                       <option value="2"  {if $r_status == 2} selected="selected"{/if} >Approved</option>
                                                       <option value="3" {if $r_status == 3} selected="selected"{/if} >Completed</option>
                                                       <option value="4" {if $r_status == 4} selected="selected"{/if} >Canceled</option>   
                                                    </select>
                                                    </div>
                                                </div>
                                               <button type="submit" name="up-withdraw" value="up-withdraw" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Save</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->

{include file='../Layout/footer.tpl'}
{include file='../Layout/header.tpl'}


                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}

                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
                                                    <label for="Name" class="col-sm-10">
                                                        Name *
                                                    </label>
	                                                <div class="col-md-10">
                                                     <input name="name" class="form-control" type="text" value="{$r_name}"/>	                                           
                                                    </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Description" class="col-sm-10">
                                                        Description *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <textarea type="text" name="description" class="form-control">{$r_description}</textarea>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Url" class="col-sm-10">
                                                        Url *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="url" name="url" class="form-control" value="{$r_url}">
                                                    <em class="font-600 forhelp">Ex: https://domain.com/</em>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Timer" class="col-sm-10">
                                                        Timer *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="number" name="timer" class="form-control" value="{$r_timer}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Clicks" class="col-sm-10">
                                                        Clicks *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="number" name="clicks" class="form-control" value="{$r_clicks}">
	                                                </div>
	                                            </div>
	                                            
                                                <div class="form-group">
                                                    <label for="Status" class="col-sm-10">
                                                         Status
                                                    </label>
                                                    <div class="col-sm-10">
                                                    <select name="status" class="form-control">
                                                      <option value="1" {if $r_status == '1'}selected="selected"{/if} >Active</option>
                                                      <option value="2" {if $r_status == '2'} selected="selected"{/if} >Inactive</option>
                                                    </select>
                                                    </div>
                                                </div>

                                               <button type="submit" name="up-ptc" value="up-ptc" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Save</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
{include file='../Layout/footer.tpl'}
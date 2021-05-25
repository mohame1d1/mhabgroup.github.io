{include file='../Layout/header.tpl'}


                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}

                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>

	                                            <div class="form-group">
                                                    <label for="FullName" class="col-sm-10">
                                                        Full Name
                                                    </label>
	                                                <div class="col-md-10">
                                                     <input name="name" class="form-control" type="text" value="{$r_name}"/>	                                           
                                                    </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="UserJob" class="col-sm-10">
                                                        User Job
                                                    </label>
	                                                <div class="col-md-10">
                                                      <input type="text" name="job" class="form-control" value="{$r_job}" />
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="UserReview" class="col-sm-10">
                                                        User Review
                                                    </label>
	                                                <div class="col-md-10">
                                                      <textarea type="text" name="content" class="form-control">{$r_content}</textarea>
	                                                </div>
	                                            </div>

                                               <button type="submit" name="up-testimonial" value="up-testimonial" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Save</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
{include file='../Layout/footer.tpl'}
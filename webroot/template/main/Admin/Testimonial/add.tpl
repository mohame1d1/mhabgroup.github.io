{include file='../Layout/header.tpl'}
                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                     {include file='../Testimonial/menu.tpl'}

                        					<form class="form-horizontal" method="POST" enctype="multipart/form-data">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="name" class="form-control" placeholder="Full Name">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="file" name="photo" class="form-control" data-toggle="tooltip" data-placement="top" data-original-title="User Avatar">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="job" class="form-control" placeholder="User Job">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <textarea type="text" name="content" class="form-control" placeholder="User Review"></textarea>
	                                                </div>
	                                            </div>

                                               <button type="submit" name="add-testimonial" value="add-testimonial" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Add</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
{include file='../Layout/footer.tpl'}
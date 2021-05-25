{include file='../Layout/header.tpl'}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                     {include file='../Shortlinks/menu.tpl'}
                     <span class="help"><i class="fa fa-question-circle"></i> For instructions step by step click <a href="{$HOST}pages/add-shortlinks" target="_blank">here</a>.</span><hr>
                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="name" class="form-control" placeholder="Name">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <textarea type="text" name="description" class="form-control" placeholder="Description"></textarea>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="api" class="form-control" placeholder="API">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="url" name="url" class="form-control" placeholder="Url">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="credit" class="form-control" placeholder="Credit" value="0.00000000">
                                                        <em class="font-600 forhelp">How much user should get (Default Currency: {do_config(16)} ).</em>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="number" name="position" class="form-control" placeholder="Position">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="number" name="count_ip" class="form-control" placeholder="IP Count">
	                                                </div>
	                                            </div>

                                               <button type="submit" name="add-short" value="add-short" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Add</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
{include file='../Layout/footer.tpl'}
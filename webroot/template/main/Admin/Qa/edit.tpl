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
                                                        Type *
                                                    </label>
	                                                <div class="col-md-10">
                                                     <select name="method" class="form-control" >
                                                       <option value="multiselect" {if $r_method == 'multiselect'} selected="selected"{/if}>Choose answer</option>
                                                       <option value="oneselect" {if $r_method == 'oneselect'} selected="selected"{/if}>Correct answer</option>
                                                     </select>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Question" class="col-sm-10">
                                                        Question *
                                                    </label>
	                                                <div class="col-md-10">
                                                     <input name="question" class="form-control" type="text" value="{$r_name}"/>	                                           
                                                    </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Answers" class="col-sm-10">
                                                        Answers *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <textarea type="text" name="answers" class="form-control">{$r_description}</textarea>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="CorrectAnswer" class="col-sm-10">
                                                        Correct Answer *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="text" name="answer" class="form-control" value="{$r_answer}">
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

                                               <button type="submit" name="up-qa" value="up-qa" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Save</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                        
{include file='../Layout/footer.tpl'}
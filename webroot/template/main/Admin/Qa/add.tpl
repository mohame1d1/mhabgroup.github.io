{include file='../Layout/header.tpl'}
            
                
                        <div class="row">

                            <div class="col-md-12">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                                <div class="card-box">
                                {include file='../Qa/menu.tpl'}

                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
                                                <div class="form-group">
                                                 <div class="col-md-10">
                                                  <select name="method" class="form-control">
                                                   <option value="multiselect" selected="selected">Choose answer</option>
                                                   <option value="oneselect" >Correct answer</option>
                                                  </select>
                                                 </div>
                                                </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="question" class="form-control" placeholder="Question">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <textarea type="text" name="answers" class="form-control" placeholder="Answers">N/A</textarea>
                                                    <em class="font-600 forhelp"> Seperate answers by comma.</em>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="answer" class="form-control" placeholder="Correct Answer">
	                                                </div>
	                                            </div>
	                                            
                                               <button type="submit" name="add-qa" value="add-qa" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Add</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
{include file='../Layout/footer.tpl'}
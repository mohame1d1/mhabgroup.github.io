{include file='../Layout/header.tpl'}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $up_err}<div class="alert alert-danger" >Error: Somthing Is wrong Please try again.</div>{/if}
                     
                        					<form class="form-horizontal" method="POST" enctype="multipart/form-data">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <label class="col-md-10">Choose a zip file to upload:</label>
	                                                <div class="col-md-10">
	                                                    <input type="file" name="userfile" class="form-control"/>
	                                                </div>
	                                            </div>

                                               <button type="submit" name="submit" value="submit" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Update</button>
	                                        </form>
                 <br>
                 <p>You can get your new version by redownload your item.</p>
                 <h4>instraction :</h4>
                 <p class="font-600">
                     1. Download your new version from where you purchase our script.<br>

                     2. Check in >> <em>/updates/</em> folder a zip file.<br>

                     3. Upload that zip file to the update form.<br>
                  </p>
                  <p>Leave a comment in the item (comment section) if you're facing issues</p>
                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->

{include file='../Layout/footer.tpl'}
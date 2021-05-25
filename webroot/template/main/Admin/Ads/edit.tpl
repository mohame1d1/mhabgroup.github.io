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
                                                        Name
                                                    </label>
	                                                <div class="col-md-10">
                                                     <input name="name" class="form-control" type="text" value="{$r_name}"/>	                                           
                                                    </div>
	                                            </div>
                                                <div class="form-group">
                                                   <label for="Size" class="col-sm-10">
                                                     Size
                                                   </label>
                                                   <div class="col-sm-10">
                                                     <select name="size" class="form-control">
                                                       <option value="N/A" {if $r_size == 'N/A'}selected="selected"{/if}>N/A</option>
                                                       <option value="728x90" {if $r_size == '728x90'}selected="selected"{/if}>728x90</option>
                                                       <option value="468x60" {if $r_size == '468x60'}selected="selected"{/if}>468x60</option>
                                                       <option value="300x250" {if $r_size == '300x250'}selected="selected"{/if}>300x250</option>
                                                       <option value="336x280" {if $r_size == '336x280'}selected="selected"{/if}>336x280</option>
                                                       <option value="120x600" {if $r_size == '120x600'}selected="selected"{/if}>120x600</option>
                                                       <option value="160x600" {if $r_size == '160x600'}selected="selected"{/if}>160x600</option>
                                                     </select>
                                                   </div>
                                                </div>
	                                            <div class="form-group">
                                                    <label for="Code" class="col-sm-10">
                                                        Code
                                                    </label>
	                                                <div class="col-md-10">
                                                      <textarea type="text" name="code" class="form-control">{$r_code}</textarea>
	                                                </div>
	                                            </div>
                                                <div class="form-group">
                                                    <label for="Status" class="col-sm-10">
                                                         Status
                                                    </label>
                                                    <div class="col-sm-10">
                                                    <select name="status" class="form-control">
                                                      <option value="1" {if $r_status == '1'} selected="selected"{/if}>Active</option>
                                                      <option value="2" {if $r_status == '2'} selected="selected"{/if}>Inactive</option>
                                                    </select>
                                                    </div>
                                                </div>
                                               <button type="submit" name="up-ads" value="up-ads" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Save</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
{include file='../Layout/footer.tpl'}
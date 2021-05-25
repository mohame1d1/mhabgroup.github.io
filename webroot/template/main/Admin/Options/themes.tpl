{include file="../Layout/header.tpl"}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
             {if $pass}<div class='alert alert-success'>Theme Uploaded Successfully!</div>{/if}
             {if $deactivated}<div class='alert alert-success'>Theme Deactivated Successfully</div>{/if}
             {if $activated}<div class='alert alert-success'>Theme Activated Successfully</div>{/if}
             {if $deleted}<div class="alert alert-success">Theme Deleted Successfully</div>{/if}
             {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
             {include file='../Options/menu.tpl'}
                              <div id="showTags" title="If you have a theme in a .zip format, you may install it by uploading it here." class="btn btn-success">
                              <i class="fa fa-upload"></i> Upload <i class="fa fa-caret-down"></i></div>
                              <ul id="subforms" class="subforums hide">
                              <hr>
                              <p>
                              <center><form class="form form-horizontal"  method="POST" enctype="multipart/form-data">
                              <label>Choose a zip file to upload: <input type="file" name="userfile" /></label>
                               <div class= "form-group">  
                               <div class="col-sm-9 col-sm-offset-1">
                                <input class="btn btn-info center" name="new" type="submit" value="Upload"/>
                               </div>
                              </div>
                              </form></center></p>
                              <hr>
                              </ul>
                              </div>
                              <div class="card-box">
              {foreach from=$themes item=foo}
                <div class="theme-design" style="display:inline-block;margin-right:10px;margin-top: 15px;">
                 <div class="table-responsive">
                  <table class="table table-middle">
                    <img src="{$AST}images/theme.png" title="{$foo['name']}" style="width: 292px;height: 192px">
                  </table>
                </div>
                            <form method="POST">
                            
                            <input type="hidden" name="id" value="{$foo['id']}"/>

                            <input type="hidden" name="name" value="{$foo['name']}"/>

                            <input class="btn btn-info" name="activate" type="submit" {if $THEME == $foo['name']} disabled="disabled" value="Activated" {else} value="Activate"{/if}/>

                            <input class="btn btn-danger" name="delete" type="submit" {if $THEME == $foo['name']} disabled="disabled" {/if} value="Delete"/>
                            
                            </form>

    </div> 
              {/foreach}
                <div class="theme-design" style="display:inline-block;margin-top: 15px;">
                  <div class="table-responsive">
                    <table class="table table-middle">
                      <a href="https://codsem.com/search?term=midfaucet" target="_blank" ><img src="{$AST}images/new-theme.png" style="width: 292px;height: 192px;"></a>
                    </table>
                 </div>
                 <div class="btn btn-info" disabled="disabled">Activate</div>
                 <div class="btn btn-danger" disabled="disabled">Delete</div>
               </div>
                                 </div>
                            </div>
                        </div>
              
              
{include file="../Layout/footer.tpl"}
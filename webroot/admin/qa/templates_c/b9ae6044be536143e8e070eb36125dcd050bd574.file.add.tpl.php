<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-07-04 11:36:20
         compiled from "/home/u377903412/domains/pro1d2.esy.es/public_html/midfaucet/webroot/template/main/Admin/Qa/add.tpl" */ ?>
<?php /*%%SmartyHeaderCode:4881668265d1de4b47a86a8-78569291%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b9ae6044be536143e8e070eb36125dcd050bd574' => 
    array (
      0 => '/home/u377903412/domains/pro1d2.esy.es/public_html/midfaucet/webroot/template/main/Admin/Qa/add.tpl',
      1 => 1562072405,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4881668265d1de4b47a86a8-78569291',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'required' => 0,
    'do_error' => 0,
    'csrfToken' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5d1de4b47e35f7_47797870',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5d1de4b47e35f7_47797870')) {function content_5d1de4b47e35f7_47797870($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('../Layout/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

            
                
                        <div class="row">

                            <div class="col-md-12">
                     <?php if ($_smarty_tpl->tpl_vars['required']->value) {?><div class="alert alert-danger">Error: All Fields Are Required!</div><?php }?>
                     <?php if ($_smarty_tpl->tpl_vars['do_error']->value) {?><div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div><?php }?>
                                <div class="card-box">
                                <?php echo $_smarty_tpl->getSubTemplate ('../Qa/menu.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="<?php echo $_smarty_tpl->tpl_vars['csrfToken']->value;?>
"/>
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
<?php echo $_smarty_tpl->getSubTemplate ('../Layout/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
<?php }} ?>

<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-07-03 11:37:20
         compiled from "/home/u377903412/domains/pro1d2.esy.es/public_html/midfaucet/webroot/template/main/Admin/Qa/claims.tpl" */ ?>
<?php /*%%SmartyHeaderCode:4313060725d1c93709898c2-66575065%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd6153be074dce92709e6ac128e53ecccc920670e' => 
    array (
      0 => '/home/u377903412/domains/pro1d2.esy.es/public_html/midfaucet/webroot/template/main/Admin/Qa/claims.tpl',
      1 => 1562072405,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '4313060725d1c93709898c2-66575065',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'deactivated' => 0,
    'activated' => 0,
    'deleted' => 0,
    'do_error' => 0,
    'claims' => 0,
    'foo' => 0,
    'ADM' => 0,
    'sumbole' => 0,
    'paging' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5d1c93709c35e7_86094680',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5d1c93709c35e7_86094680')) {function content_5d1c93709c35e7_86094680($_smarty_tpl) {?> <?php echo $_smarty_tpl->getSubTemplate ('../Layout/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
     <?php if ($_smarty_tpl->tpl_vars['deactivated']->value) {?><div class='alert alert-success'>Claim Unverified Successfully</div><?php }?>
     <?php if ($_smarty_tpl->tpl_vars['activated']->value) {?><div class='alert alert-success'>Claim Verified Successfully</div><?php }?>
     <?php if ($_smarty_tpl->tpl_vars['deleted']->value) {?><div class="alert alert-success">Claim Deleted Successfully</div><?php }?>
     <?php if ($_smarty_tpl->tpl_vars['do_error']->value) {?><div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div><?php }?>
     <?php echo $_smarty_tpl->getSubTemplate ('../Qa/menu.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-user"></i> User</th>
                                                                <th><i class="fa fa-key"></i> Key</th>
                                                                <th><i class="fa fa-money"></i> Amount</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           <?php  $_smarty_tpl->tpl_vars['foo'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['foo']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['claims']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['foo']->key => $_smarty_tpl->tpl_vars['foo']->value) {
$_smarty_tpl->tpl_vars['foo']->_loop = true;
?>
                                                            <tr>
                                                                <th scope="row"><?php echo $_smarty_tpl->tpl_vars['foo']->value['id'];?>
</th>
                                                                <td><a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
users/view/<?php echo $_smarty_tpl->tpl_vars['foo']->value['user_id'];?>
/"><button class="btn btn-info btn-xs"><i class="fa fa-user" style="font-size: 15px;"></i> <?php echo $_smarty_tpl->tpl_vars['foo']->value['username'];?>
</button></a></td>
                                                                <td><?php echo $_smarty_tpl->tpl_vars['foo']->value['verify_key'];?>
</td>
                                                                <td><?php echo $_smarty_tpl->tpl_vars['foo']->value['amount'];?>
 <b><?php echo $_smarty_tpl->tpl_vars['sumbole']->value;?>
</b></td>
                                                                <td>
                                               <?php if ($_smarty_tpl->tpl_vars['foo']->value['status']==1) {?>
                                                               <span class="badge badge-success">Verified</span>
                                               <?php } elseif ($_smarty_tpl->tpl_vars['foo']->value['status']==2) {?>
                                                               <span class="badge badge-danger">Unverified</span>
                                               <?php }?></td>
                                                                <td><?php echo $_smarty_tpl->tpl_vars['foo']->value['created'];?>
</td>
                                                                
                                                                                                                                <td>
                <?php if ($_smarty_tpl->tpl_vars['foo']->value['status']==1) {?>
                    <form method="POST">
                      <input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['foo']->value['id'];?>
"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="deactivate" value="Deactivate" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Unverify</button>
                    </form>
               <?php } elseif ($_smarty_tpl->tpl_vars['foo']->value['status']==2) {?>
                   <form method="POST">
                     <input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['foo']->value['id'];?>
"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Verify</button>
                   </form>
              <?php }?>
                    </td>
                   <td>
                     <form method="POST">
                      <input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['foo']->value['id'];?>
"> 
                      <button class="btn btn-warning btn-xs" type="submit" name="delete" value="Delete" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Delete</button>
                     </form> 
                    </td>
                                                            </tr>
                                               <?php } ?>
                                                        </tbody>
                                                    </table>
                                                </div>
                                               <?php if (!$_smarty_tpl->tpl_vars['claims']->value) {?><span class="badge badge-danger elem-center" style="margin-left: 200px;">No Qa claims was Found..</span><?php }?>
                               </div>
                            </div>
                        </div>
                        <!-- end row -->
                        <div class="row" style="text-align: center"> 
                             <ul class="pagination">
                                       <?php echo $_smarty_tpl->tpl_vars['paging']->value;?>
 
                             </ul>
                        </div>
                        <!-- end pagination -->
                       </div>


<?php echo $_smarty_tpl->getSubTemplate ('../Layout/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
<?php }} ?>

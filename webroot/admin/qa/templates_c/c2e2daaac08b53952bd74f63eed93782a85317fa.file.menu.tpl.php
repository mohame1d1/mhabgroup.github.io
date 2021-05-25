<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-07-02 13:11:29
         compiled from "/home/u377903412/domains/pro1d2.esy.es/public_html/midfaucet/webroot/template/main/Admin/Qa/menu.tpl" */ ?>
<?php /*%%SmartyHeaderCode:18999850905d1b580197ef55-67483443%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c2e2daaac08b53952bd74f63eed93782a85317fa' => 
    array (
      0 => '/home/u377903412/domains/pro1d2.esy.es/public_html/midfaucet/webroot/template/main/Admin/Qa/menu.tpl',
      1 => 1562072405,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '18999850905d1b580197ef55-67483443',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'ADM' => 0,
    'qalist' => 0,
    'claims' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5d1b5801985253_40816799',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5d1b5801985253_40816799')) {function content_5d1b5801985253_40816799($_smarty_tpl) {?>
    <div class="tab">
      <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
qa/index"><button <?php if (isset($_smarty_tpl->tpl_vars['qalist']->value)) {?> class="tablinks active"<?php }?>><i class="fa fa-question-circle"></i> QA</button></a>
      <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
qa/claims"><button <?php if (isset($_smarty_tpl->tpl_vars['claims']->value)) {?> class="tablinks active"<?php }?>><i class="fa fa-mouse-pointer left"></i> Claims</button></a>
      <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
qa/add"><button <?php if (!isset($_smarty_tpl->tpl_vars['qalist']->value)&&!isset($_smarty_tpl->tpl_vars['claims']->value)) {?> class="tablinks active"<?php }?>><i class="fa fa-plus-circle"></i> Add QA</button></a>
    </div>
    <hr><?php }} ?>

<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-07-08 13:49:36
         compiled from "/home/u377903412/domains/pro1d2.esy.es/public_html/midfaucet/webroot/template/main/Admin/Layout/header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:20146854835d1b580194fe63-21231448%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f84bec2eb572515d541e15948daaa830461ad493' => 
    array (
      0 => '/home/u377903412/domains/pro1d2.esy.es/public_html/midfaucet/webroot/template/main/Admin/Layout/header.tpl',
      1 => 1562592931,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20146854835d1b580194fe63-21231448',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5d1b58019707f9_61517451',
  'variables' => 
  array (
    'site_title' => 0,
    'AST' => 0,
    'HOST' => 0,
    'USR' => 0,
    'username' => 0,
    'ADM' => 0,
    '_HOME' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5d1b58019707f9_61517451')) {function content_5d1b58019707f9_61517451($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><?php echo $_smarty_tpl->tpl_vars['site_title']->value;?>
 - <?php echo do_config(0);?>
</title>
       
        <!-- Verification -->
        <?php echo do_config(13);?>

        
        <!-- Favicon -->
        <link rel="shortcut icon" href="<?php echo do_config(7);?>
" type="image/png">

        <!-- date range picker -->
        <link href="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
css/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

        <!-- App css -->
        <link href="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
css/core.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
css/components.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
css/icons.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
css/pages.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
css/menu.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
css/responsive.css" rel="stylesheet" type="text/css" />
		<link href="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
switchery/switchery.min.css" rel="stylesheet">

        <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <?php echo '<script'; ?>
 src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"><?php echo '</script'; ?>
>
        <![endif]-->

        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/modernizr.min.js"><?php echo '</script'; ?>
>

    </head>


    <body class="fixed-left">

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left">
                    <!-- Image logo -->
                    <a href="<?php echo $_smarty_tpl->tpl_vars['HOST']->value;?>
" class="logo">
                        <span>
                            <img src="<?php echo do_config(21);?>
" alt="<?php echo do_config(0);?>
" height="30">
                        </span>
                        <i>
                            <img src="<?php echo do_config(21);?>
" alt="<?php echo do_config(0);?>
" height="28">
                        </i>
                    </a>
                </div>

                <!-- Button mobile view to collapse sidebar menu -->
                <div class="navbar navbar-default" role="navigation">
                    <div class="container">

                        <!-- Navbar-left -->
                        <ul class="nav navbar-nav navbar-left">
                            <li>
                                <button class="button-menu-mobile open-left waves-effect">
                                    <i class="mdi mdi-menu"></i>
                                </button>
                            </li>
                              <li class="dropdown hidden-xs">
                                <a href="<?php echo $_smarty_tpl->tpl_vars['USR']->value;?>
dashboard" class="dropdown-toggle menu-item" href="#" aria-expanded="false"><div class="fa fa-dashboard"></div> User Area
                                </a>
                              </li>
                        </ul>

                        <!-- Right(Notification) -->
                        <ul class="nav navbar-nav navbar-right">

                            <li class="dropdown user-box">
                                <a href="" class="dropdown-toggle waves-effect user-link" data-toggle="dropdown" aria-expanded="true">
                                  <span class="avatar-sm-box bg-primary"><i class="fa fa-user"></i></span>
                                </a>

                                <ul class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right user-list notify-list">
                                    <li>
                                        <h5>Hi, <?php echo $_smarty_tpl->tpl_vars['username']->value;?>
</h5>
                                    </li>
                                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
options/index"><i class="fa fa-cog"></i> Options</a></li>
                                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['USR']->value;?>
password"><i class="fa fa-lock"></i> Password</a></li>
                                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['HOST']->value;?>
signout"><i class="fa fa-power-off"></i> Signout</a></li>
                                </ul>

                            </li>
                        </ul> <!-- end navbar-right -->

                    </div><!-- end container -->
                </div><!-- end navbar -->
            </div>
            <!-- Top Bar End -->


            <!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu">
                <div class="sidebar-inner slimscrollleft">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <ul>

                            <li>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
dashboard" class="waves-effect"><i class="fa fa-dashboard"></i><span> Dashboard </span></a>
                            </li>
                            <li>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
faucet/index" class="waves-effect"><i class="fa fa-mouse-pointer left"></i><span> Faucet </span></a>
                            </li>
                            <li>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
shortlinks/index" class="waves-effect"><i class="fa fa-link"></i><span> Shortlinks </span></a>
                            </li>
                            <li>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
ptc/index" class="waves-effect"><i class="fa fa-eye"></i><span> PTC </span></a>
                            </li>

                            <li>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
qa/index" class="waves-effect"><i class="fa fa-question-circle"></i><span> QA </span></a>
                            </li>
                            
                        	<li class="menu-title">Users Area </li>
                            <li>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
users/index" class="waves-effect"><i class="fa fa-users"></i><span> Users </span></a>
                            </li>
                            <li>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
withdraws/index" class="waves-effect"><i class="fa fa-dollar"></i><span> Withdrawals </span></a>
                            </li>
                            <li>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
invoices/index" class="waves-effect"><i class="fa fa-bank"></i><span> Invoices </span></a>
                            </li>
                        	<li class="menu-title">Settings </li>
                            <li class="has_sub">
                                <a href="javascript:void(0);" class="waves-effect"><i class="fa fa-code"></i><span>   Advanced  </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
ads/index"> Ads Spaces</a></li>
                                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
banlist/index"> Detected IP(s)</a></li>
                                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
testimonials/index"> Testimonials</a></li>
                                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
announcements/index"> Announcements</a></li>
                                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
pages/index"> Pages</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
options/index" class="waves-effect"><i class="fa fa-cog"></i><span> Options </span></a>
                            </li>

                        </ul>
                    </div>
                    <!-- Sidebar -->


                </div>
                <!-- Sidebar -left -->

            </div>
            <!-- Left Sidebar End -->



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">


                        <div class="row">
							<div class="col-xs-12">
								<div class="page-title-box">
                                    <h4 class="page-title"><?php echo $_smarty_tpl->tpl_vars['site_title']->value;?>
</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="<?php echo $_smarty_tpl->tpl_vars['HOST']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['_HOME']->value;?>
</a>
                                        </li>
                                        <li>
                                            <a href="<?php echo $_smarty_tpl->tpl_vars['ADM']->value;?>
dashboard">Admin</a>
                                        </li>
                                        <li class="active">
                                            <?php echo $_smarty_tpl->tpl_vars['site_title']->value;?>

                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row --><?php }} ?>

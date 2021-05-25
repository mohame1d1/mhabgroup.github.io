<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>{$site_title} - {do_config(0)}</title>
        <!-- Verification -->
        {do_config(13)}
        <!-- Favicon -->
        <link rel="shortcut icon" href="{do_config(7)}" type="image/png">

        <!-- date range picker -->
        <link href="{$AST}css/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

        <!-- App css -->
        <link href="{$AST}css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="{$AST}css/core.css" rel="stylesheet" type="text/css" />
        <link href="{$AST}css/components.css" rel="stylesheet" type="text/css" />
        <link href="{$AST}css/icons.css" rel="stylesheet" type="text/css" />
        <link href="{$AST}css/pages.css" rel="stylesheet" type="text/css" />
        <link href="{$AST}css/menu.css" rel="stylesheet" type="text/css" />
        <link href="{$AST}css/responsive.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="{$AST}switchery/switchery.min.css">

        <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script src="{$AST}js/modernizr.min.js"></script>

    </head>
<style>
    .elem-center {
    width: 735px;
    }
</style>

    <body class="fixed-left">

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left">
                    <!-- Image logo -->
                    <a href="{$HOST}" class="logo">
                        <span>
                            <img src="{do_config(21)}" alt="{do_config(0)}" height="30">
                        </span>
                        <i>
                            <img src="{do_config(21)}" alt="{do_config(0)}" height="28">
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
                            {if $role == 'admin'}
                              <li class="dropdown hidden-xs">
                                <a href="{$ADM}dashboard" class="dropdown-toggle menu-item" href="#" aria-expanded="false"><div class="fa fa-dashboard"></div> {$_ADMINISTRATION}
                                </a>
                              </li>
                            {/if}
                        </ul>

                        <!-- Right(Notification) -->
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#" class="right-menu-item dropdown-toggle" data-toggle="dropdown">
                                    <i class="mdi mdi-bell"></i>
                                    <span class="badge up bg-danger">{$notifications_num}</span>
                                </a>

                                <ul class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right dropdown-lg user-list notify-list">
                                    <li>
                                        <h5>{$_NOTIFICATIONS}</h5>
                                    </li>
                                {foreach from=$notifications item=foo}
                                    <li>
                                        <a href="{$USR}notifications#{$foo['id']}" class="user-list-item">
                                            <div class="icon bg-danger">
                                               {if $foo['type'] == 'support'}
                                                <i class="fa fa-comment"></i>
                                               {elseif $foo['type'] == 'referral'}
                                                <i class="fa fa-user-plus"></i>
                                               {elseif $foo['type'] == 'withdraw'}
                                                <i class="fa fa-location-arrow"></i>
                                               {elseif $foo['type'] == 'order'}
                                                <i class="fa fa-shopping-cart"></i>
                                               {/if}
                                            </div>
                                            <div class="user-desc">
                                                <span class="name">{$foo['title']}</span>
                                                <span class="time">{$foo['ago']}</span>
                                            </div>
                                        </a>
                                    </li>
                                {/foreach}
                                    
                                    <li class="all-msgs text-center">
                                        <p class="m-0"><a href="{$USR}notifications">{$__NOTIFICATIONS}</a></p>
                                    </li>
                                </ul>
                            </li>

                            <li class="dropdown user-box">
                                <a href="{$USR}withdraw">
                                   <span class="btn btn-primary btn-rounded w-md waves-effect waves-light m-b-5"> <i class="fa fa-bank"></i> {$balance} {$sumbole}</span>
                                </a>
                            </li>

                            <li class="dropdown user-box">
                                <a href="" class="dropdown-toggle waves-effect user-link" data-toggle="dropdown" aria-expanded="true">
                                  <span class="avatar-sm-box bg-primary"><i class="fa fa-user"></i></span>
                                </a>

                                <ul class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right user-list notify-list">
                                    <li>
                                        <h5>{$_HI}, {$username}</h5>
                                    </li>
                                    <li><a href="{$USR}settings"><i class="fa fa-cog"></i> {$_SETTINGS}</a></li>
                                    <li><a href="{$USR}password"><i class="fa fa-lock"></i> {$_PASSWORD}</a></li>
                                    <li><a href="{$USR}withdraws"><i class="fa fa-history"></i> {$_WITHDRAWALS}</a></li>
                                    <li><a href="{$HOST}signout"><i class="fa fa-power-off"></i> {$_SIGN_OUT}</a></li>
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
                                <a href="{$USR}dashboard" class="waves-effect"><i class="fa fa-dashboard"></i><span> {$_DASHBOARD} </span></a>
                            </li>
                          {if do_config(42) == 1}
                            <li>
                                <a href="{$USR}shortlinks/index" class="waves-effect"><i class="fa fa-link"></i><span> {$_SHORTLINKS} </span></a>
                            </li>
                          {/if}
                          {if do_config(41) == 1}
                            <li>
                                <a href="{$USR}faucet" class="waves-effect"><i class="fa fa-mouse-pointer left"></i><span> {$_FAUCET} </span></a>
                            </li>
                          {/if}

                            <li class="has_sub">
                                <a href="javascript:void(0);" class="waves-effect"><i class="fa fa-gift"></i><span>  {$_OFFERS} </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                  {if do_config(40) == 1}  
                                    <li><a href="{$USR}qa/index"> {$_QA}</a></li>
                                  {/if}
                                  {if do_config(39) == 1}
                                    <li><a href="{$USR}ptc/index"> {$_PTC}</a></li>
                                  {/if}
                                </ul>
                            </li>
                            <li>
                                <a href="{$USR}referrals" class="waves-effect"><i class="fa fa-users"></i><span> {$_REFERRALS} </span></a>
                            </li>
                            <li>
                                <a href="{$USR}points" class="waves-effect"><i class="fa fa-refresh"></i><span> {$_REWARDS}</span></a>
                            </li>
                        	<li class="menu-title">{$_ADVERTISER} </li>
                            <li>
                                <a href="{$USR}orders/index" class="waves-effect"><i class="fa fa-database"></i><span> {$_ORDERS} </span></a>
                            </li>
                            <li>
                                <a href="{$USR}invoices" class="waves-effect"><i class="fa fa-bank"></i><span> {$_INVOICES} </span></a>
                            </li>
                        	<li class="menu-title">{$_CONTACT} </li>
                            <li>
                                <a href="{$USR}faq" class="waves-effect"><i class="fa fa-question-circle"></i><span> {$_FAQ} </span></a>
                            </li>                     
                            <li>
                                <a href="{$USR}support" class="waves-effect"><i class="fa fa-comment"></i><span> {$_SUPPORT} </span></a>
                            </li>                     

                        </ul>
                    </div>
                    <!-- Sidebar -->
                    <div class="clearfix"></div>

                    <div class="help-box">
                        <h5 class="text-muted m-t-0">{$__SUPPORT}</h5>
                        <p class=""><span class="text-custom">{$_EMAIL}</span> {do_config(12)}</p>
                    </div>

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
                                    <h4 class="page-title">{$site_title}</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="{$HOST}">{$_HOME}</a>
                                        </li>
                                        <li>
                                            <a href="{$USR}dashboard">{$_USER}</a>
                                        </li>
                                        <li class="active">
                                            {$site_title}
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
                        
                        <!-- start ad 728x90 -->
                         <div class="ad-leader-board">
                         {do_ad_display('728x90')}
                        </div>
                        <!-- end ad 728x90 -->

                       <!-- start ad code -->
                        {ad_codes()}
                       <!-- end ad code -->
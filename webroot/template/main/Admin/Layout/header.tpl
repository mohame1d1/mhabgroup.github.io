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
		<link href="{$AST}switchery/switchery.min.css" rel="stylesheet">

        <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script src="{$AST}js/modernizr.min.js"></script>

    </head>


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
                              <li class="dropdown hidden-xs">
                                <a href="{$USR}dashboard" class="dropdown-toggle menu-item" href="#" aria-expanded="false"><div class="fa fa-dashboard"></div> User Area
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
                                        <h5>Hi, {$username}</h5>
                                    </li>
                                    <li><a href="{$ADM}options/index"><i class="fa fa-cog"></i> Options</a></li>
                                    <li><a href="{$USR}password"><i class="fa fa-lock"></i> Password</a></li>
                                    <li><a href="{$HOST}signout"><i class="fa fa-power-off"></i> Signout</a></li>
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
                                <a href="{$ADM}dashboard" class="waves-effect"><i class="fa fa-dashboard"></i><span> Dashboard </span></a>
                            </li>
                            <li>
                                <a href="{$ADM}faucet/index" class="waves-effect"><i class="fa fa-mouse-pointer left"></i><span> Faucet </span></a>
                            </li>
                            <li>
                                <a href="{$ADM}shortlinks/index" class="waves-effect"><i class="fa fa-link"></i><span> Shortlinks </span></a>
                            </li>
                            <li>
                                <a href="{$ADM}ptc/index" class="waves-effect"><i class="fa fa-eye"></i><span> PTC </span></a>
                            </li>

                            <li>
                                <a href="{$ADM}qa/index" class="waves-effect"><i class="fa fa-question-circle"></i><span> QA </span></a>
                            </li>
                            
                        	<li class="menu-title">Users Area </li>
                            <li>
                                <a href="{$ADM}users/index" class="waves-effect"><i class="fa fa-users"></i><span> Users </span></a>
                            </li>
                            <li>
                                <a href="{$ADM}withdraws/index" class="waves-effect"><i class="fa fa-dollar"></i><span> Withdrawals </span></a>
                            </li>
                            <li>
                                <a href="{$ADM}invoices/index" class="waves-effect"><i class="fa fa-bank"></i><span> Invoices </span></a>
                            </li>
                        	<li class="menu-title">Settings </li>
                            <li class="has_sub">
                                <a href="javascript:void(0);" class="waves-effect"><i class="fa fa-code"></i><span>   Advanced  </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="{$ADM}ads/index"> Ads Spaces</a></li>
                                    <li><a href="{$ADM}banlist/index"> Detected IP(s)</a></li>
                                    <li><a href="{$ADM}testimonials/index"> Testimonials</a></li>
                                    <li><a href="{$ADM}announcements/index"> Announcements</a></li>
                                    <li><a href="{$ADM}pages/index"> Pages</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="{$ADM}options/index" class="waves-effect"><i class="fa fa-cog"></i><span> Options </span></a>
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
                                    <h4 class="page-title">{$site_title}</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="{$HOST}">{$_HOME}</a>
                                        </li>
                                        <li>
                                            <a href="{$ADM}dashboard">Admin</a>
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
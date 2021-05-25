<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$site_title} - {do_config(0)}</title>
    <!-- Keywords -->
    <meta name="keywords" content="{$keywords}" />
    
    <!-- Description -->
    <meta name="description" content="{$site_description}" />
    
    <!-- Robots -->
    <meta name="robots" content="index, follow"/>
    
    <!-- Verification -->
    {do_config(13)}
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="{do_config(7)}" type="image/png">

    <!-- CSS Files-->
    <link rel="stylesheet" type="text/css" href="{$AST}landing/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="{$AST}landing/css/animate.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="{$AST}landing/fonts/font-awesome/css/font-awesome.min.css">

    <!--Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    
    <!--Custom Style -->
    <link rel="stylesheet" type="text/css" href="{$AST}landing/css/style.css">
    <link rel="stylesheet" type="text/css" href="{$AST}landing/css/responsive.css">
    
</head>
<body>

    <!-- header section START-->
    
    <header>
        
        <!-- navigation START -->
        
        <nav class="navbar navbar-expand-md bg-header navbar-light">
            <div class="container">
                <!-- Brand -->
                <a class="navbar-brand" href="#">
                    <img src="{do_config(22)}" alt="{do_config(0)}" />
                </a>

                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navbar links -->
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#home">{strtoupper($_HOME)}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#features">{strtoupper($_FEATURES)}</a>
                        </li>
                        {if $logged}
                        <li class="nav-item">
                            <a class="nav-link" href="{$HOST}{$role}/dashboard">{strtoupper($_DASHBOARD)}</a>
                        </li>
                        {else}
                        <li class="nav-item">
                            <a class="nav-link" href="{$HOST}signin">{$_SIGN_IN}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{$HOST}signup">{$_SIGN_UP}</a>
                        </li>
                        {/if}
                    </ul>
                </div> 
            </div>
        </nav>
        
        <!-- navigation END -->
        
    </header>
    
    <!-- header section END -->
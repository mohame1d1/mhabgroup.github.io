{include file="$TMP/Layout/header.tpl"}


    <!-- home section START -->

    <div id="home" class="home">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 col-xs-12 my-auto wow slideInLeft">
                    
                    <h2 class="subtitle">{$_BEST_FAUCET}</h2>
                    <h1 class="title">{$_CRYPTOCURRENCY}</h1>
                    <p class="description">{$__BEST_FAUCET}</p>
                    {if !$logged}
                     <a type="button" class="btn btn-md btn-default" href="{$HOST}signup">{$_GET_STARTED}</a>
                    {else}
                     <a type="button" class="btn btn-md btn-default" href="{$HOST}{$role}/dashboard">{$_DASHBOARD}</a>
                    {/if}
                    
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center mt-50">
                    <img src="{$AST}landing/images/signin.png" alt="{do_config(0)}">
                </div>
            </div> <!-- .row END -->
        </div> <!-- .container END -->
    </div>
    
    <!-- home section END -->
    
    <!-- intro section START -->

    <div class="intro">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12 mb-30">
                    <div class="card wow slideInUp">
                        <div class="card-body">
                            <i class="fa fa-money"></i>
                            <h3 class="title">{$_HIGHEST_RATES}</h3>
                            <p class="description">{$__HIGHEST_RATES}</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12 mb-30">
                    <div class="card wow slideInUp">
                        <div class="card-body">
                            <i class="fa fa-users"></i>
                            <h3 class="title">{$_REFERRAL_SYSTEM}</h3>
                            <p class="description">{$__REFERRAL_SYSTEM}</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="card wow slideInUp">
                        <div class="card-body">
                            <i class="fa fa-lock"></i>
                            <h3 class="title">{$_SECURE_CONNECTION}</h3>
                            <p class="description">{$__SECURE_CONNECTION}</p>
                        </div>
                    </div>
                </div>
            </div> <!-- .row END -->
        </div> <!-- .container END -->
    </div>
    
    <!-- intro section END -->
    
    <!-- video section START -->

    <div class="video">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 wow pulse">
                    <h1 class="title">{$_JOIN_US}</h1>
                    <a href="{$HOST}signup" class="btn-video">
                        <i class="fa fa-user"></i>
                    </a>
                </div>
            </div> <!-- .row END -->
        </div> <!-- .container END -->
    </div>
    
    <!-- video section END -->
    
    <!-- features section START -->
    
    <div id="features" class="features">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 text-center wow slideInLeft">
                    <img src="{$AST}landing/images/signup.png" class="phone-img" alt="">
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 my-auto mt-50 wow slideInRight">
                    <h3 class="title">{$_HOW_IT_WORK}</h3>
                    <div class="media p-3">
                        <img src="{$AST}landing/images/responsive.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                        <div class="media-body">
                            <h4>{$_CTREATE_NEW_ACCOUNT}</h4>
                            <p>{$__CTREATE_NEW_ACCOUNT}</p>      
                        </div>
                    </div>
                    <div class="media p-3">
                        <img src="{$AST}landing/images/cross.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                        <div class="media-body">
                            <h4>{$_ADD_YOUR_WALLET}</h4>
                            <p>{$__ADD_YOUR_WALLET}</p>      
                        </div>
                    </div>
                    <div class="media p-3">
                        <img src="{$AST}landing/images/code.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                        <div class="media-body">
                            <h4>{$_START_CLAIMING}</h4>
                            <p>{$__START_CLAIMING}</p>      
                        </div>
                    </div>
                </div>
            </div> <!-- .row END -->
        </div> <!-- .container END -->
    </div>
    
    <!-- features section END -->
    
   {if do_config(30) == 1}
	{if $testimonial}
    <!-- clients section START -->
    
    <div id="clients" class="clients">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h2 class="title">{$_WHAT_USERS_SAY}</h2>
                    <p class="description">{$__WHAT_USERS_SAY}</p>
                </div>
            </div> <!-- .row END -->
            <div class="row">
              {foreach from=$testimonial item=foo}

                <!--single-reviews-->
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-xs-12 mb-30">
                    <div class="card wow flipInY">
                        <div class="card-body">
                            <img src="{$foo['avatar']}" alt="{$foo['name']}" class="user-image" />
                            <h3 class="user-title">{$foo['name']}</h3>
                            <p class="user-info">{$foo['job']}</p>
                            <p class="user-description">{$foo['content']}</p>
                        </div>
                    </div>
                </div>

              {/foreach}
            </div> <!-- .row END -->
        </div> <!-- .container END -->
    </div>
    
    <!-- clients section END -->
	{/if}
   {/if}
   
    <!-- counter section START -->

    <div id="counter" class="counter">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12 mb-30">
                    <h2 class="number">{$users}</h2>
                    <p class="title">{$_USERS}</p>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12 mb-30">
                    <h2 class="number">{$claims}</h2>
                    <p class="title">{$_CLAIMS_MADE}</p>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12 mb-30">
                    <h2 class="number">{$paid}</h2>
                    <p class="title">{$_PAID_TO_USERS}</p>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <h2 class="number">{$referral_earnings}</h2>
                    <p class="title">{$_REFERRAL_EARNINGS}</p>
                </div>
            </div> <!-- .row END -->
        </div> <!-- container END -->
    </div>
    
    <!-- counter section END -->

{include file="$TMP/Layout/footer.tpl"}
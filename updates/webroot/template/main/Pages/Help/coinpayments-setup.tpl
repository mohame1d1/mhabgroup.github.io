{include file="$TMP/Layout/Pages/header.tpl"}
      
        <!-- HOME -->
        <section>
            <div class="container-alt">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="wrapper-page">
                            <img src="{$AST}images/animat-customize-color.gif" alt="" height="120">
                            <h2 class="text-uppercase text-danger">{$site_title}</h2>
                            <p class="text-muted">
                            <p>
                             To enable CoinPayments as deposit processor,
                             Go to Admin Area >> Options >> Payment Motheds  >> Deposit Processor from there select CoinPayments.
                            </p>
                            <p>
                                Add your Public and Private Keys by doing the following:
                            </p>
                            <p>1 Login To your CoinPayments account <a href="https://www.coinpayments.net/login" target="_blank">here</a></p>
                            <p>2 Go to Account > API Keys</p>
                            <p>3 Click on "Generate new key" button
                               You will get Public Key and Private Key</p>
                            <p>4 Add your merchant id and to get it navigate to Account > Account Settings > Basic Settings from there you will find the merchant Id.
                                Add your IPN Secret. you need to setup it first at your account by doing the following
                               Go to Account > Account Settings > Merchant Settings
                            </p>
                            <p>In the IPN Secret field, enter a good random string nobody can guess.
                               In the IPN Verification Method select "HMAC"
                               Click on "Update Account" button.</p>
                            </p>

                        </div>

                    </div>
                </div>
            </div>
          </section>
          <!-- END HOME -->
          
{include file="$TMP/Layout/Pages/footer.tpl"}
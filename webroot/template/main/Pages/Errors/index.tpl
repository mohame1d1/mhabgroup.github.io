{include file="$TMP/Layout/Pages/header.tpl"}


        <!-- HOME -->
        <section>
            <div class="container-alt">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="wrapper-page">
                            <img src="{$AST}images/animat-customize-color.gif" alt="" height="120">
                            <h2 class="text-uppercase text-danger">{$_CSRF_MIS}</h2>
                            <p class="text-muted">{$__CSRF_MIS}</p>

                            <a class="btn btn-success waves-effect waves-light m-t-20" href="{$HOST}"> {$_HOME}</a>
                        </div>

                    </div>
                </div>
            </div>
          </section>
          <!-- END HOME -->
          
{include file="$TMP/Layout/Pages/footer.tpl"}
{include file="$TMP/Layout/User/header.tpl"}
                        <script type="text/javascript" src="{$AST}js/progressbar.js"></script>
                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
                                <div class="text-center">
                                  <h2>{$__REDIRECTED_EXTERNAL}</h2>
                                  <h4>{$_REDIRECTED_EXTERNAL} {$url}</h4>
                                </div>
                                  <div class="ad-leader-square">
                                    {do_ad_display('300x250')}
                                    </div>
                                <div class="text-center">
                                  <div id="container"></div>
                                  {$_REDIRECTED_NOTE}
                                </div>
                               </div>
                            </div>
                        </div>
                        <!-- end row -->
                    </div> <!-- container -->
                </div> <!-- content -->
                <script type="text/javascript">
                 var bar = new ProgressBar.Line(container,{
                  strokeWidth: 1,
                  easing: 'easeInOut',
                  duration: {$timer}000,
                  color: '#ff3b00',
                  trailColor: '#f3f3f3',
                  trailWidth: 1,
                  {literal} 
                  svgStyle: {width: '380px', height: '17px'} 
                  {/literal}
                 });
                 bar.animate(1.0);  // Number from 0.0 to 1.0
                </script>
 
{include file="$TMP/Layout/User/footer.tpl"}
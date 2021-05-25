    <!-- footer section START -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <img src="{do_config(21)}" alt="{do_config(0)}" class="logo">
                    <ul class="social-links">
                        {if !empty(do_config(17))}<li>
                            <a href="{do_config(17)}">
                                <i class="fa fa-facebook"></i>
                            </a>
                        </li>{/if}
                        {if !empty(do_config(19))}<li>
                            <a href="{do_config(19)}">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </li>{/if}
                        {if !empty(do_config(18))}<li>
                            <a href="{do_config(18)}">
                                <i class="fa fa-google-plus"></i>
                            </a>
                        </li>{/if}
                    </ul>
                    <p class="copyright">{$date} &copy;  {do_config(0)}. {$_ALL_RIGHTS_RESERVED} &copy; Free Script By ThewebMaers.club </p>
                </div>
            </div> <!-- .row END -->
        </div> <!-- .container END -->
    </footer>
    
    <!-- footer section END -->

    <!--All JavaScripts-->
    <script src="{$AST}landing/js/jquery-3.3.1.min.js"></script>
    <script src="{$AST}landing/js/bootstrap.min.js"></script>
    <script src="{$AST}landing/js/wow.min.js"></script>
    <script src="{$AST}landing/js/popper.min.js"></script>
    

    <!-- Custom JS -->
    <script src="{$AST}landing/js/custom.js"></script>
    
</body>
</html>
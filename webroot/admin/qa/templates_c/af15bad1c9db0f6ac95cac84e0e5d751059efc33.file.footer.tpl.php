<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-07-02 13:11:29
         compiled from "/home/u377903412/domains/pro1d2.esy.es/public_html/midfaucet/webroot/template/main/Admin/Layout/footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:20738756385d1b5801986ee7-20115082%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'af15bad1c9db0f6ac95cac84e0e5d751059efc33' => 
    array (
      0 => '/home/u377903412/domains/pro1d2.esy.es/public_html/midfaucet/webroot/template/main/Admin/Layout/footer.tpl',
      1 => 1562072405,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20738756385d1b5801986ee7-20115082',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'APPversion' => 0,
    'date' => 0,
    'AST' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5d1b58019939d3_33067624',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5d1b58019939d3_33067624')) {function content_5d1b58019939d3_33067624($_smarty_tpl) {?>
                    </div> <!-- container -->

                </div> <!-- content -->

                <footer class="footer text-right">
                   Version <?php echo $_smarty_tpl->tpl_vars['APPversion']->value;?>
 | <?php echo $_smarty_tpl->tpl_vars['date']->value;?>
 © <?php echo do_config(0);?>

                </footer>

            </div>


            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->



        <?php echo '<script'; ?>
>
            var resizefunc = [];
        <?php echo '</script'; ?>
>

        <!-- jQuery  -->
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/jquery.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/bootstrap.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/detect.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/fastclick.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/jquery.blockUI.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/waves.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/jquery.slimscroll.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/jquery.scrollTo.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
switchery/switchery.min.js"><?php echo '</script'; ?>
>

        <!-- Counter js  -->
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
waypoints/jquery.waypoints.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
counterup/jquery.counterup.min.js"><?php echo '</script'; ?>
>

        <!-- Flot chart js -->
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
flot-chart/jquery.flot.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
flot-chart/jquery.flot.time.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
flot-chart/jquery.flot.tooltip.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
flot-chart/jquery.flot.resize.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
flot-chart/jquery.flot.pie.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
flot-chart/jquery.flot.selection.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
flot-chart/jquery.flot.crosshair.js"><?php echo '</script'; ?>
>

        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
moment/moment.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
bootstrap-daterangepicker/daterangepicker.js"><?php echo '</script'; ?>
>


        <!-- Dashboard init -->
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
pages/jquery.dashboard_2.js"><?php echo '</script'; ?>
>

        <!-- App js -->
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/jquery.core.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['AST']->value;?>
js/jquery.app.js"><?php echo '</script'; ?>
>

        <?php echo '<script'; ?>
>
            $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
            $('#reportrange').daterangepicker({
                format: 'MM/DD/YYYY',
                startDate: moment().subtract(29, 'days'),
                endDate: moment(),
                minDate: '01/01/2012',
                maxDate: '12/31/2016',
                dateLimit: {
                    days: 60
                },
                showDropdowns: true,
                showWeekNumbers: true,
                timePicker: false,
                timePickerIncrement: 1,
                timePicker12Hour: true,
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                opens: 'left',
                drops: 'down',
                buttonClasses: ['btn', 'btn-sm'],
                applyClass: 'btn-success',
                cancelClass: 'btn-default',
                separator: ' to ',
                locale: {
                    applyLabel: 'Submit',
                    cancelLabel: 'Cancel',
                    fromLabel: 'From',
                    toLabel: 'To',
                    customRangeLabel: 'Custom',
                    daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                    monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                    firstDay: 1
                }
            }, function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            });
        <?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
document.getElementById( 'showTags' ).addEventListener( 'click', function () {
document.getElementById( 'subforms' ).toggleClass( 'hide' );
}, false );
Element.prototype.toggleClass = function ( className ) {
if( this.className.split( ' ' ).indexOf( className ) == -1 ) {
 this.className = ( this.className + ' ' + className ).trim();
} else {
this.className = this.className.replace( new RegExp( '(\\s|^)' + className + '(\\s|$)' ), ' ' ).trim(); };
};

<?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
    function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

<?php echo '</script'; ?>
>
    </body>
</html><?php }} ?>

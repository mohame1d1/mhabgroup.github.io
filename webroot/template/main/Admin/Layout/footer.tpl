
                    </div> <!-- container -->

                </div> <!-- content -->

                <footer class="footer text-right">
                   Version {$APPversion} | {$date} © {do_config(0)}
                </footer>

            </div>


            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->



        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="{$AST}js/jquery.min.js"></script>
        <script src="{$AST}js/bootstrap.min.js"></script>
        <script src="{$AST}js/detect.js"></script>
        <script src="{$AST}js/fastclick.js"></script>
        <script src="{$AST}js/jquery.blockUI.js"></script>
        <script src="{$AST}js/waves.js"></script>
        <script src="{$AST}js/jquery.slimscroll.js"></script>
        <script src="{$AST}js/jquery.scrollTo.min.js"></script>
        <script src="{$AST}switchery/switchery.min.js"></script>

        <!-- Counter js  -->
        <script src="{$AST}waypoints/jquery.waypoints.min.js"></script>
        <script src="{$AST}counterup/jquery.counterup.min.js"></script>

        <!-- Flot chart js -->
        <script src="{$AST}flot-chart/jquery.flot.min.js"></script>
        <script src="{$AST}flot-chart/jquery.flot.time.js"></script>
        <script src="{$AST}flot-chart/jquery.flot.tooltip.min.js"></script>
        <script src="{$AST}flot-chart/jquery.flot.resize.js"></script>
        <script src="{$AST}flot-chart/jquery.flot.pie.js"></script>
        <script src="{$AST}flot-chart/jquery.flot.selection.js"></script>
        <script src="{$AST}flot-chart/jquery.flot.crosshair.js"></script>

        <script src="{$AST}moment/moment.js"></script>
        <script src="{$AST}bootstrap-daterangepicker/daterangepicker.js"></script>


        <!-- Dashboard init -->
        <script src="{$AST}pages/jquery.dashboard_2.js"></script>

        <!-- App js -->
        <script src="{$AST}js/jquery.core.js"></script>
        <script src="{$AST}js/jquery.app.js"></script>

        <script>
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
        </script>
<script>
document.getElementById( 'showTags' ).addEventListener( 'click', function () {
document.getElementById( 'subforms' ).toggleClass( 'hide' );
}, false );
Element.prototype.toggleClass = function ( className ) {
if( this.className.split( ' ' ).indexOf( className ) == -1 ) {
 this.className = ( this.className + ' ' + className ).trim();
} else {
this.className = this.className.replace( new RegExp( '(\\s|^)' + className + '(\\s|$)' ), ' ' ).trim(); };
};

</script>
<script>
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

</script>
    </body>
</html>
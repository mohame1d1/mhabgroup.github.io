
                        <!-- Start AD 728x90 -->
                        <div class="ad-leader-board">
                         {do_ad_display('728x90')}
                        </div> <!-- End AD 728x90 -->
                        
                    </div> <!-- container -->

                </div> <!-- content -->

                <br><footer class="footer text-right">
                   <center><a href="{$HOST}page/1/">Terms & Conditions</a> | <a href="{$HOST}page/2/">Privacy Policy</a> | <a href="{$HOST}info/withdrawals">Latest withdrawals</a></center> <br>
                   <center>{$date} © {do_config(0)} {$_ALL_RIGHTS_RESERVED}.</center>
                </footer>

            </div>


            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

        <!-- footer code -->
        {do_config(14)}

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

    </body>
</html>
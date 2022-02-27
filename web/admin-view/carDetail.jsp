<%-- 
    Document   : carDetail
    Created on : Dec 5, 2019, 12:53:11 AM
    Author     : Danish
--%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="Model.Vehicle"%>
<%@page import="java.util.List"%>
<%@page import="DataAccessor.VehicleDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

  <head>
    <title>Cars Detail</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="http://localhost:8080/MotokarIP/admin-view/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="http://localhost:8080/MotokarIP/admin-view/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="http://localhost:8080/MotokarIP/admin-view/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="http://localhost:8080/MotokarIP/admin-view/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="http://localhost:8080/MotokarIP/admin-view/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="http://localhost:8080/MotokarIP/admin-view/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="http://localhost:8080/MotokarIP/admin-view/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="http://localhost:8080/MotokarIP/admin-view/plugins/summernote/summernote-bs4.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <link rel="stylesheet" href="http://localhost:8080/MotokarIP/admin-view/dist/css/datepicker.css">
    
    <style type="text/css">
    	b { font-weight: bold; }
    	.car-table th { width: 30px; }
    	table { border-collapse:collapse;
                margin-bottom: 0 !important;
        }
    	ul {list-style: none;}
        
        .mytr {
            color: white;
            border-bottom: 1px solid white;
        }
        .btn-primary{
            border: 0 !important; 
            border-radius: 0 !important; 
            background: #03a1a4 !important;
        }
        .wrapper {
            max-width: 560px;
            margin: 100px auto;
        }
          label {
            position: relative;
            display: block;
          }
          label > input {
            position: relative;
            background-color: transparent;
            border: none;
            border-bottom: 1px solid #9e9e9e;
            border-radius: 0;
            outline: none;
            height: 45px;
            width: 100%;
            font-size: 16px;
            margin: 0 0 30px 0;
            padding: 0;
            box-shadow: none;
            box-sizing: content-box;
            transition: all .3s;
          }
          label > input:valid + span {
            transform: translateY(-25px) scale(0.8);
            transform-origin: 0;
          }
          label > input:valid {
            border-bottom: 1px solid #3F51B5;
            box-shadow: 0 1px 0 0 #3F51B5;
          }
          label > span {
            color: #9e9e9e;
            position: absolute;
            top: 0;
            left: 0;
            font-size: 16px;
            cursor: text;
            transition: .2s ease-out;
          }
          label > input:focus + span {
            transform: translateY(-25px) scale(0.8);
            transform-origin: 0;
            color: #3F51B5;
          }
          label > input:focus {
            border-bottom: 1px solid #3F51B5;
            box-shadow: 0 1px 0 0 #3F51B5;
          }




          /*Bootstrap Calendar*/
          .datepicker {
              border-radius: 0;
              padding: 0;
          }
          .datepicker-days table thead, .datepicker-days table tbody, .datepicker-days table tfoot {
              padding: 10px;
              display: list-item;
          }
          .datepicker-days table thead, .datepicker-months table thead, .datepicker-years table thead, .datepicker-decades table thead, .datepicker-centuries table thead {
              background: #3546b3;
              color: #ffffff;
              border-radius: 0;
          }
          .datepicker-days table thead tr:nth-child(2n+0) td, .datepicker-days table thead tr:nth-child(2n+0) th {
              border-radius: 3px;
          }
          .datepicker-days table thead tr:nth-child(3n+0) {
              text-transform: uppercase;
              font-weight: 300 !important;
              font-size: 12px;
              color: rgba(255, 255, 255, 0.7);
          }
          .table-condensed > tbody > tr > td, .table-condensed > tbody > tr > th, .table-condensed > tfoot > tr > td, .table-condensed > tfoot > tr > th, .table-condensed > thead > tr > td, .table-condensed > thead > tr > th {
              padding: 11px 13px;
          }
          .datepicker-months table thead td, .datepicker-months table thead th, .datepicker-years table thead td, .datepicker-years table thead th, .datepicker-decades table thead td, .datepicker-decades table thead th, .datepicker-centuries table thead td, .datepicker-centuries table thead th {
              border-radius: 0;
          }
          .datepicker td, .datepicker th {
              border-radius: 50%;
              padding: 0 12px;
          }
          .datepicker-days table thead, .datepicker-months table thead, .datepicker-years table thead, .datepicker-decades table thead, .datepicker-centuries table thead {
              background: #3546b3;
              color: #ffffff;
              border-radius: 0;
          }
          .datepicker table tr td.active, .datepicker table tr td.active:hover, .datepicker table tr td.active.disabled, .datepicker table tr td.active.disabled:hover {
              background-image: none;
          }
          .datepicker .prev, .datepicker .next {
              color: rgba(255, 255, 255, 0.5);
              transition: 0.3s;
              width: 37px;
              height: 37px;
          }
          .datepicker .prev:hover, .datepicker .next:hover {
              background: transparent;
              color: rgba(255, 255, 255, 0.99);
              font-size: 21px;
          }
          .datepicker .datepicker-switch {
              font-size: 24px;
              font-weight: 400;
              transition: 0.3s;
          }
          .datepicker .datepicker-switch:hover {
              color: rgba(255, 255, 255, 0.7);
              background: transparent;
          }
          .datepicker table tr td span {
              border-radius: 2px;
              margin: 3%;
              width: 27%;
          }
          .datepicker table tr td span.active, .datepicker table tr td span.active:hover, .datepicker table tr td span.active.disabled, .datepicker table tr td span.active.disabled:hover {
            background-color: #3546b3;
            background-image: none;
          }
          .dropdown-menu {
              border: 1px solid rgba(0,0,0,.1);
              box-shadow: 0 6px 12px rgba(0,0,0,.175);
          }
          .datepicker-dropdown.datepicker-orient-top:before {
              border-top: 7px solid rgba(0,0,0,.1);
          }
        h1{
            font-size: 2.2rem !important;
        }
    </style>

  </head>

  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" style="background: #121212;">

    <jsp:useBean id="vehicle" class="Model.Vehicle" scope="request"/>
    <jsp:include page="inc/sidebar.jsp" />
    <jsp:include page="inc/navbar.jsp" />
    
    <div class="content-wrapper" style="background: #121212 !important">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
              <h1 class="text-white">${vehicle.vehicle_name}</h1> 
          </div><!-- /.col -->

        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
	          	<div class="col-lg-4 col-md-6 car-details-left">
                                <div class="row">
                                    
                                    <div class="card" style="width: 24rem; margin: 0 0 20px 20px">
                                        <img class="card-img-top" src="http://localhost:8080/MotokarIP/admin-view/${vehicle.vehicle_picture}" />
                                        <div class="card-body" >
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item">Owned By: ${vehicle.user_id}</li>
                                                <li class="list-group-item">Doors: ${vehicle.doors} Doors</li>
                                                <li class="list-group-item">Seats: ${vehicle.seats} Seats</li>
                                                <li class="list-group-item">Transmission : ${vehicle.transmission}</li>
                                                <li class="list-group-item">Mileage: < ${vehicle.mileage}KM</li>
                                            </ul>
                                            <br>
                                        </div>
                                    </div>
                                </div>
	          	</div>
	          	<div class="col-lg-8 col-md-6 car-details-right">
                            <form action="VehicleRentController" method="post" autocomplete="off">  
                                
                                <%
                                    Calendar calendar = Calendar.getInstance();
                                    Date today = calendar.getTime();

                                    calendar.add(Calendar.DAY_OF_YEAR, 1);
                                    Date tomorrow = calendar.getTime();
                                    
                                    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
                                    date.setTimeZone(TimeZone.getTimeZone("GMT+8"));

                                    String vehicleDateStartStringVar = date.format(today);
                                    String vehicleDateEndStringVar = date.format(tomorrow); 
                                %>
                                
                                <input type="hidden" name="module" value="addVehicleRent" />
                                <input type="hidden" name="user_id" value="${user_id}" />
                                <input type="hidden" name="vehicle_id" value="${vehicle.vehicle_id}" />
                                <input type="hidden" name="vehicleRateDay" value="${vehicle.vehicleRateDay}" />
                                <input type="hidden" name="rent_desc" value="" />

	          		<div class="row">
	          			<div class="col-lg-12 col-md-12">
	          				<table class="table car-table table-borderless" cellspacing="0" cellpadding="0">
							  <tbody>
							    <tr class="mytr">
							      <th scope="row"><i class="fas fa-money-check-alt"></i></th>
							      <td>
                                                                  <b>Vehicle Rates (D/W/M/Y):</b> <br>
							      	<table class="table table-borderless table-rate">
									    <tbody style="color: white">
									      <tr>
									        <th scope="row">Day</th>
									        <td width="10px">:</td>
									        <td>RM ${vehicle.vehicleRateDay}</td>
									      </tr>
									      <tr>
									        <th scope="row">Week</th>
									        <td width="10px">:</td>
									        <td>RM ${vehicle.vehicleRateWeek}</td>
									      </tr>
									      <tr>
									        <th scope="row">Month</th>
									        <td width="10px">:</td>
									        <td>RM ${vehicle.vehicleRateMonth}</td>
									      </tr>
									      <tr>
									        <th scope="row">Year</th>
									        <td width="10px">:</td>
									        <td>RM ${vehicle.vehicleRateYear}</td>
									      </tr>
									    </tbody>
									</table>
							      </td>
							    </tr>

                                                            <tr class="mytr">
							      <th scope="row"><i class="fas fa-info-circle"></i></th>
							      <td ><b>Description:</b><br>
                                                              ${vehicle.vehicle_desc}
                                                              </td>
							    </tr>
                                                            
                                                            <tr class="mytr">
							      <th scope="row"><i class="fas fa-money-check-alt"></i></th>
							      <td>
                                                                  <b>Trip Dates:</b> <br>
							      	<table class="table table-borderless table-rate">
									    <tbody style="color: white">
									      <tr>
									        <th scope="row">Start</th>
									        <td width="10px">:</td>
									        <td><input type='text' id="start_date" name="start_date" class='datepicker-here' data-language='en' /></td>
									      </tr>
									      <tr>
									        <th scope="row">End</th>
									        <td width="10px">:</td>
									        <td><input type='text' id="end_date" name="end_date" class='datepicker-here' data-language='en' /></td>
									      </tr>
									    </tbody>
									</table>
							      </td>
							    </tr>
                                                            
                                                            <tr class="mytr">
                                                                <th scope="row"><i class="fas fa-info-circle"></i></th>
                                                                <td><b>Price:</b><br>
                                                                <p id="shownPrice">RM 0</p>
                                                                </td>
							    </tr>
							  </tbody>
							</table>
	          			</div>
	          		</div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <br>
                                        <button type="submit" class="btn btn-primary" style="float: right;">Book Vehicle</button>
                                    </div>
                                </div>
                            </form>
	          	</div>
          	</div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
                                                                         
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/jquery/jquery.min.js"></script>
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script>
      $.widget.bridge('uibutton', $.ui.button)
    </script>
    <!-- Bootstrap 4 -->
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- ChartJS -->
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/chart.js/Chart.min.js"></script>
    <!-- Sparkline -->
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/sparklines/sparkline.js"></script>
    <!-- JQVMap -->
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/jquery-knob/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/moment/moment.min.js"></script>
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Summernote -->
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/summernote/summernote-bs4.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="http://localhost:8080/MotokarIP/admin-view/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="http://localhost:8080/MotokarIP/admin-view/dist/js/adminlte.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="http://localhost:8080/MotokarIP/admin-view/dist/js/pages/dashboard.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="http://localhost:8080/MotokarIP/admin-view/dist/js/demo.js"></script>
    
    <script src="http://localhost:8080/MotokarIP/admin-view/dist/js/datepicker.js"></script>
    <script src="http://localhost:8080/MotokarIP/admin-view/dist/js/i18n/datepicker.en.js"></script>

    <script>

        $(".datepicker-here").datepicker({
            onSelect: function(dateText) {
                var start_date = $("#start_date").val();
                var end_date = $("#end_date").val();
                var rate = '${vehicle.vehicleRateDay}';
                var shownPrice = $("#shownPrice").text(); 

                if(start_date && end_date){
                    
                    var date1 = new Date(start_date);
                    var date2 = new Date(end_date);
                    var diffTime = Math.abs(date2 - date1);
                    var diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
                    
                    $("#shownPrice").text("RM " + (rate * diffDays));
                }
                    
            }
        });
        
    </script>
    
  </body>

</html>


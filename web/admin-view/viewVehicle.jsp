<%-- 
    Document   : carDetail
    Created on : Dec 5, 2019, 12:53:11 AM
    Author     : rohai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <link href="https://fonts.googleapis.com/css?family=DM+Sans:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <script src="https://kit.fontawesome.com/c617c1fba4.js" crossorigin="anonymous"></script>

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

    <style type="text/css">
    	b { font-weight: bold; }
    	.car-table th { width: 30px; }
    	table { border-collapse:collapse; }
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

	          		<div class="row">
	          			<div class="col-lg-12 col-md-12">
	          				<table class="table car-table table-borderless" cellspacing="0" cellpadding="0">
							  <tbody>
							    <tr class="mytr">
							      <th scope="row"><i class="fas fa-money-check-alt"></i></th>
							      <td>
                                                                  <b>Vehicle Rates (D/W/M/Y):</b> <br>
							      	<table class="table table-borderless table-rate">
									    <tbody>
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
							  </tbody>
							</table>
	          			</div>
	          		</div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <br>
                                        <c:if test="${user_id == vehicle.user_id}">
                                            <a href="http://localhost:8080/MotokarIP/VehicleController?module=editVehicle&vehicle_id=${vehicle.vehicle_id}" class="btn btn-primary trigger-btn" style="float: right">Edit Vehicle</a>
                                        </c:if>		      
                                        </div>
                                </div>
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

  </body>

</html>


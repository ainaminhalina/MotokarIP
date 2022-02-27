<%-- 
    Document   : editCar
    Created on : Dec 27, 2019, 4:39:47 PM
    Author     : Imran Syah Othman
--%>

<%@page import="Model.Vehicle"%>
<%@page import="java.util.List"%>
<%@page import="DataAccessor.VehicleDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Vehicle Properties</title>
        
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
        .form-control {
            float: right;
            width: 200px !important;
            border-radius: 0 !important;
            background-clip: initial;
        }
        h1{
            font-size: 2.2rem !important;
        }
    </style>
    </head>
    <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" style="background: #121212;">
        
        <jsp:useBean id="vehicle" class= "Model.Vehicle" scope="request"/>
        <jsp:include page="inc/sidebar.jsp" />
        <jsp:include page="inc/navbar.jsp" />
        
    <div class="content-wrapper" style="background: #121212 !important">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
              <h1 class="text-white">Edit Vehicle</h1> 
          </div><!-- /.col -->

        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
            <form action="VehicleController"  method="post"> 
                <input type="hidden" name="module" value="updateVehicle" />
                <input type="hidden" name="vehicle_id" value="${vehicle.vehicle_id}" />
                <div class="row">
	          	<div class="col-lg-4 col-md-6 car-details-left">
                                <div class="row">
                                    <div class="card" style="width: 24rem; margin: 0 0 20px 20px">
                                        <img class="card-img-top" style="cursor: pointer;" src="http://localhost:8080/MotokarIP/admin-view/${vehicle.vehicle_picture}" onclick="addImage()" />
                                        <div class="card-body" >
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item">Vehicle Name: <input class="form-control" type="text" name="vehicle_name" value="${vehicle.vehicle_name}" /></li>
                                                <li class="list-group-item">Doors: <input class="form-control" type="text" name="doors" value="${vehicle.doors}" /></li>
                                                <li class="list-group-item">Seats: <input class="form-control" type="text" name="seats" value="${vehicle.seats}" /></li>
                                                <li class="list-group-item">Transmission : <input class="form-control" type="text" name="transmission" value="${vehicle.transmission}" /></li>
                                                <li class="list-group-item">Mileage: <input class="form-control" type="text" name="mileage" value="${vehicle.mileage}" /></li>
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
									        <td>RM <input type="text" name="vehicleRateDay" value="${vehicle.vehicleRateDay}" /></td>
									      </tr>
									      <tr>
									        <th scope="row">Week</th>
									        <td width="10px">:</td>
									        <td>RM <input type="text" name="vehicleRateWeek" value="${vehicle.vehicleRateWeek}" /></td>
									      </tr>
									      <tr>
									        <th scope="row">Month</th>
									        <td width="10px">:</td>
									        <td>RM <input type="text" name="vehicleRateMonth" value="${vehicle.vehicleRateMonth}" /></td>
									      </tr>
									      <tr>
									        <th scope="row">Year</th>
									        <td width="10px">:</td>
									        <td>RM <input type="text" name="vehicleRateYear" value="${vehicle.vehicleRateYear}" /></td>
									      </tr>
									    </tbody>
									</table>
							      </td>
							    </tr>

                                                            <tr class="mytr">
							      <th scope="row"><i class="fas fa-info-circle"></i></th>
							      <td ><b>Description:</b><br>
                                                                  <textarea type="text" name="vehicle_desc" class="form-control" rows="7" style="width: 100% !important;">${vehicle.vehicle_desc}</textarea>
                                                              </td>
							    </tr>
							  </tbody>
							</table>
	          			</div>
	          		</div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <input type="file" id="vehicle_picture" name="vehicle_picture" accept="image/png, image/jpeg" style="visibility: hidden;">
                                        <button type="submit" class="btn btn-primary trigger-btn" style="float: right">Submit</button>	
                                    </div>
                                </div>
	          	</div>
                </div>
            </form>
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
    
    <script>
        function addImage(){
            document.getElementById("vehicle_picture").click();
        }
    </script>
    </body>
</html>

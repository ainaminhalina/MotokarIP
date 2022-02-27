<%-- 
    Document   : cars
    Created on : Dec 3, 2019, 10:00:14 AM
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
    <title>Garage - UTM Car Rental Service </title>
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

<style type="text/css">

	.modal-confirm {		
		color: #636363;
		width: 400px;
	}
	.modal-confirm .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
        text-align: center;
		font-size: 14px;
	}
	.modal-confirm .modal-header {
		border-bottom: none;   
        position: relative !important;
	}
	.modal-confirm h4 {
		text-align: center;
		font-size: 26px;
		margin: 30px 0 -10px !important;
	}
	.modal-confirm .close {
        position: absolute;
		top: -5px;
		right: -2px;
	}
	.modal-confirm .modal-body {
		color: #999;
	}
	.modal-confirm .modal-footer {
		border: none;
		text-align: center;		
		border-radius: 5px;
		font-size: 13px;
		padding: 10px 15px 25px;
	}
	.modal-confirm .modal-footer a {
		color: #999;
	}		
	.modal-confirm .icon-box {
		width: 80px;
		height: 80px;
		margin: 0 auto;
		border-radius: 50%;
		z-index: 9;
		text-align: center;
		border: 3px solid #f15e5e;
	}
	.modal-confirm .icon-box i {
		color: #f15e5e;
		font-size: 46px;
		display: inline-block;
		margin-top: 14px;
                margin-left: -9px;
	}
    .modal-confirm .btn {
        color: #fff;
        border-radius: 4px;
		background: #60c7c1;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
		min-width: 120px;
        border: none;
		min-height: 40px;
		border-radius: 3px;
		margin: 0 5px;
		outline: none !important;
    }
	.modal-confirm .btn-info {
        background: #c1c1c1;
    }
    .modal-confirm .btn-info:hover, .modal-confirm .btn-info:focus {
        background: #a8a8a8;
    }
    .modal-confirm .btn-danger {
        background: #f15e5e;
    }
    .modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
        background: #ee3535;
    }
    .trigger-btn {
            display: inline-block;

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

  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

      <jsp:include page="inc/sidebar.jsp" />
      <jsp:include page="inc/navbar.jsp" />
      
      <div class="content-wrapper" style="background: #121212 !important">
            <!-- Content Header (Page header) -->
            <div class="content-header">
              <div class="container-fluid">
                <div class="row mb-2">
                  <div class="col-sm-6">
                    <h1 class="text-white">Garage</h1>
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

                    <c:forEach var="vehicle" items="${vehicleList}"> 

                        <div class="card" style="width: 24rem; margin: 0 0 20px 20px">
                            <img class="card-img-top" src="<c:out value="http://localhost:8080/MotokarIP/admin-view/${vehicle.vehicle_picture}" />" />
                            <div class="card-body" >
                            <h5 class="card-title"><c:out value="${vehicle.vehicle_name}" /></h5><br>
                            <p class="card-text">RM<c:out value="${vehicle.vehicleRateDay}" />/day</p>
                            <ul class="list-group list-group-flush">
                            <li class="list-group-item">${vehicle.doors} Doors</li>
                            <li class="list-group-item">${vehicle.seats} Seats</li>
                            <li class="list-group-item">Transmission : ${vehicle.transmission}</li>
                            <li class="list-group-item">Mileage < ${vehicle.mileage}KM</li>
                            </ul><br>
                            <a href="http://localhost:8080/MotokarIP/VehicleController?module=viewVehicle&vehicle_id=<c:out value="${vehicle.vehicle_id}" />" class="btn btn-primary trigger-btn">View</a> &nbsp
                            <a href="#myModal<c:out value="${vehicle.vehicle_id}" />" data-toggle="modal" class="btn btn-primary trigger-btn">Delete</a>
                            </div>
                        </div>

                        <div id="myModal<c:out value="${vehicle.vehicle_id}" />" class="modal fade">
                            <div class="modal-dialog modal-confirm">
                                <div class="modal-content">
                                                <div class="modal-body">
                                                 <div class="icon-box">
                                                <i class="material-icons">X</i>
                                            </div>
                                                <h4>Are you sure?</h4> </br>
                                                <p>Do you really want to delete these records? This process cannot be undone.</p>
                                            </div>
                                    <button type="button" class="btn btn-danger" onclick="window.location.href='http://localhost:8080/MotokarIP/VehicleController?module=deleteVehicle&vehicle_id=<c:out value="${vehicle.vehicle_id}" />'">Delete</button>
                                    <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button></br>

                                </div>
                            </div>
                        </div> 
                    </c:forEach>
                </div>  
                <div class="row">
                    <div class="col-sm-12">
                    <a href="http://localhost:8080/MotokarIP/VehicleController?module=addVehicle" class="btn btn-primary trigger-btn">Add Vehicle</a>
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

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
    <script>
        
        var added = '${added}';
        var edited = '${edited}';
        var deleted = '${deleted}';

        if(added == 1){
            
            Swal.fire({
                title: 'Success',
                text: "Vehicle added successfully!",
                icon: 'success',
              }).then((result) => {
                if (result.value) {
                  window.location.replace("http://localhost:8080/MotokarIP/VehicleController?module=garage");  
                }
              })
    
        }
        
        if(edited == 1){
            
            Swal.fire({
                title: 'Success',
                text: "Vehicle updated successfully!",
                icon: 'success',
              }).then((result) => {
                if (result.value) {
                  window.location.replace("http://localhost:8080/MotokarIP/VehicleController?module=garage");  
                }
              })
    
        }

        if(deleted == 1){
            
            Swal.fire({
                title: 'Success',
                text: "Vehicle deleted successfully!",
                icon: 'success',
              }).then((result) => {
                if (result.value) {
                  window.location.replace("http://localhost:8080/MotokarIP/VehicleController?module=garage");  
                }
              })
    
        }
        
    </script>
  </body>

</html>



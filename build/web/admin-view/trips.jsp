<%-- 
    Document   : cars
    Created on : Dec 3, 2019, 10:00:14 AM
    Author     : Danish
--%>

<%@page import="Model.VehicleRent"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Vehicle"%>
<%@page import="java.util.List"%>
<%@page import="DataAccessor.VehicleDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

  <head>
    <title>Cars - UTM Car Rental Service </title>
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
    <style>
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
            <h1 class="text-white">My Trips</h1>
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
            
            <% 
                Calendar calendar = Calendar.getInstance();
                Date today = calendar.getTime();

                calendar.add(Calendar.DAY_OF_YEAR, 1);
                Date tomorrow = calendar.getTime();
                
                SimpleDateFormat output = new SimpleDateFormat("E, d MMM yyyy");
                output.setTimeZone(TimeZone.getTimeZone("GMT+8"));
                
                for(VehicleRent vehicle: (List<VehicleRent>)request.getAttribute("vehicleRentList")){
                
                    String status = (vehicle.getRent_status() == 1) ? "Booked" : "Completed";
                    
                    out.println("<div class=\"card\" style=\"width: 24rem; margin: 0 0 20px 20px\">");
                    out.println("<img class=\"card-img-top\" src=\"http://localhost:8080/MotokarIP/admin-view/" + vehicle.getVehicle_picture() + "\" />");
                    out.println("<div class=\"card-body\">");
                    out.println("<h5 class=\"card-title\">" + vehicle.getVehicle_name() + "</h5><br>");
                    out.println("<ul class=\"list-group list-group-flush\">");
                    out.println("<li class=\"list-group-item\">Start Date: " + output.format(vehicle.getStart_date()) + "</li>");
                    out.println("<li class=\"list-group-item\">End Date: " + output.format(vehicle.getEnd_date()) + "</li>");
                    out.println("<li class=\"list-group-item\">Total Price: RM " + vehicle.getRent_price() + "</li>");
                    out.println("<li class=\"list-group-item\">Status: " + status + "</li>");
                    out.println("</ul><br>");
                    out.println("<a href=\"http://localhost:8080/MotokarIP/VehicleController?module=viewVehicle&vehicle_id=" + vehicle.getVehicle_id() + "\" class=\"btn btn-primary\">Vehicle details</a>");
                    out.println("</div>");
                    out.println("</div>");
                }
            %>

        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
       
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
        
        var rented = '${rented}';

        if(rented == 1){
            
            Swal.fire({
                title: 'Vehicle rent successful!',
                text: "You have rented the vehicle successfully, a notification is sent to the vehicle owner, please wait for the response.",
                icon: 'success',
              }).then((result) => {
                if (result.value) {
                  window.location.replace("http://localhost:8080/MotokarIP/VehicleController?module=getVehicle&vehicle_id=0");  
                }
              })
    
      
            
        }
        
    </script>
    
  </body>

</html>



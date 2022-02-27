<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MotoKar - User Profile</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">

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
    .form-control {
        border: 0 !important;
        border-radius: 0 !important;
    }
    
    label {
        color: white;
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
<body data-spy="scroll" data-target=".navbar-collapse">

<jsp:useBean id="userList" class="Model.User" scope="request"/>
<jsp:include page="inc/sidebar.jsp" />
<jsp:include page="inc/navbar.jsp" />

<div class="content-wrapper" style="background: #121212 !important">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="text-white">My Profile</h1>
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
		<div class="col-md-3 col-xs-12">
                    <div class="card" style="width: 100%;">

                        <div class="card-body" >
                            <img class="card-img-top" src="http://localhost:8080/MotokarIP/admin-view/images/blank_profile.png"/>
                            <ul class="list-group list-group-flush">
                            <li class="list-group-item">Name: <jsp:getProperty name="userList" property="first_name" /> ${userList.last_name}</li>
                            <li class="list-group-item">Username: <jsp:getProperty name="userList" property="username" /></li>
                            <li class="list-group-item">Phone Number: <jsp:getProperty name="userList" property="phone_num" /></li>
                            </ul><br>
                        </div>
                    </div>
                    
                </div>
                <div class="col-md-9 col-xs-12">
                    <div class="row">
                        <div class="card" style="width: 100%;">
                            <div class="card-body" >
                                <h5 class="card-title">PERSONAL DETAILS</h5><br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">First Name: <jsp:getProperty name="userList" property="first_name" /></li>
                                    <li class="list-group-item">Last Name: ${userList.last_name}</li>
                                    <li class="list-group-item">Username: <jsp:getProperty name="userList" property="username" /></li>
                                    <li class="list-group-item">Email: <jsp:getProperty name="userList" property="email" /></li>
                                    <li class="list-group-item">Phone Number: <jsp:getProperty name="userList" property="phone_num" /></li>
                                </ul>
                                <br>
                                <h5 class="card-title">DESCRIPTION</h5><br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><i>A student at UTM wanting to earn some extra buck. I'm very good at keeping and taking care of other people's property. Will negotiate for a reasonable price.</i></li>    
                                </ul>
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="float: right !important;">
                        <button type="submit" onclick="window.location.href='UserController?module=editProfile'" class="btn btn-primary">Edit Profile</button>
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

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
    <script>

        var edited = '${edited}';

        if(edited == 1){
            
            Swal.fire({
                title: 'Success',
                text: "Account updated successfully!",
                icon: 'success',
              }).then((result) => {
                if (result.value) {
                  window.location.replace("http://localhost:8080/MotokarIP/UserController?module=viewProfile");  
                }
              })
    
        }
        
    </script>
</body>
</html>
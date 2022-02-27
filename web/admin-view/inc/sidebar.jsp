<%-- 
    Document   : sidebar
    Created on : Dec 3, 2019, 11:06:58 AM
    Author     : rohai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title></title>

</head>
    <body>
<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="http://localhost:8080/MotokarIP/admin-view/images/motokaricon.png" class="brand-image img-circle"
           style="opacity: .8">
      <span class="brand-text font-weight-light">MotoKar</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <!-- <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/admin-user.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Administrator</a>
        </div>
      </div> -->

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="http://localhost:8080/MotokarIP/VehicleController?module=getVehicle&vehicle_id=0" class="nav-link">
                <i class="nav-icon fas fa-list-ul"></i>
                <p>Car Listings</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="http://localhost:8080/MotokarIP/VehicleController?module=garage" class="nav-link">
                <i class="nav-icon fas fa-car"></i>
                <p>My Garage</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="http://localhost:8080/MotokarIP/VehicleRentController?module=getTrips" class="nav-link">
                <i class="nav-icon fas fa-map-marker-alt"></i>
                <p>My Trips</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="http://localhost:8080/MotokarIP/UserController?module=viewProfile" class="nav-link">
                <i class="nav-icon fas fa-user-circle"></i>
                <p>Profile</p>
            </a>
          </li>
          
          <li class="nav-item">
          <a href="http://localhost:8080/MotokarIP/UserController?module=logout" class="nav-link">
              <i class="nav-icon fas fa-power-off"></i>
              <p>
                Logout
              </p>
            </a>
          </li>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
    </body>
</html>

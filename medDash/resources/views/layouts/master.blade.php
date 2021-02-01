<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <title>Douray Service</title>

<link rel="stylesheet" href="{{asset('css/app.css')}}">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper" id="app">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
  
     
    </ul>

    <!-- SEARCH FORM -->
    <div class="input-group input-group-sm">
      <input class="form-control form-control-navbar" @keyup="searchit" v-model="search" type="search" placeholder="Search" aria-label="Search">
      <div class="input-group-append">
        <button class="btn btn-navbar" @click="searchit">
          <i class="fa fa-search"></i>
        </button>
      </div>
    </div>

    
   
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar paneel elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="../img/tech.png" alt="Douray Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Douray Service</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../img/boss.png" class="img-circle elevation-2" alt="User">
        </div>
        <div class="info">
          <a href="#" class="d-block">
         {{Auth::user()->name }}  </a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
      
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
              <li class="nav-item">
               <router-link to="/dashboard" class="nav-link">
                <i class="nav-icon fas fa-th"></i>
                 <p>
                    Dashboard
            
                  </p>
                </router-link>
              </li>
              <li class="nav-item">
               <router-link to="/profile" class="nav-link">
                <i class="nav-icon fas fa-user"></i>
                 <p>
                    Profile
            
                  </p>
                </router-link>
              </li>
          <li class="nav-item has-treeview menu">
            <a href="#" class="nav-link ">
              <i class="nav-icon fas fa-gear"></i>
              <p>
                Manager
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <router-link to="/sales" class="nav-link active">
               
                  <i class="fa fa-shopping-cart "></i>
                  <p>Commandes</p>
                </router-link>
                </a>
              </li>
             @can('isAdmin')
              <li class="nav-item">
                <router-link to="/user" class="nav-link">
                  <i class="fas fa-users "></i>
                  <p>personnelle</p>
                </router-link>
              </li>
              @endcan
            </ul>
          </li>
         
          <li class="nav-item">
              <a class="nav-link" href="{{ route('logout') }}"
                   onclick="event.preventDefault();
                         document.getElementById('logout-form').submit();">
                           <i class="nav-icon fas fa-power-off"></i>
                       <p>  {{ __('Logout') }}</p>
                         </a>

                          <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            @csrf
                           </form>
                  
            
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
           
          </div><!-- /.col -->
          <div class="col-sm-6">
          
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
      <!-- set router view -->
      <router-view></router-view>
       <!-- set progressbar -->
      <vue-progress-bar></vue-progress-bar>
     
        
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->

</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/js/app.js"></script>
</body>
</html>

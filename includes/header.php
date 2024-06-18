<?php
//session_start();
include("admin/conexion.php");
$nombre = $_SESSION['usuario'];

?>
	<link href="../css/estilo_button.css">
	<header id="header"><!--header-->
		<div class="header_top"><!--header de arriba-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> +573182672892</a></li>
								<li><a href="mailto:jtoroblandon@gmail.com"><i class="fa fa-envelope"></i> jtoroblandon@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="https://www.facebook.com/profile.php?id=100089940437960"><i class="fa fa-facebook"></i></a></li>
								<li><a href="https://www.twitter.com/rescatandocult3"><i class="fa fa-twitter"></i></a></li>
								<li><a href="https://www.instagram.com/rescatandoculturas1101"><i class="fa fa-instagram"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-->
		
		<div class="header-middle"><!--header central-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="inicio.php"><img src="images/home/logo.png" alt="" width="100px" height="50px" /></a>
						</div>
						
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
						<li>
                            <a href="perfil.php"><i class="fa fa-fw fa-user"></i>Usuario:<b style="color:green;"> <?php  echo $nombre; ?></b></a>
                        </li>
							    <li><a href="login/login.php"><i class="fa fa-lock"></i> Administración</a></li>
							    <li><a href="login/logout2.php"><i class="fa fa-power-off"></i> Salir</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-->
	
		<div class="header-bottom"><!--header de abajo-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="inicio.php" class="active">Inicio</a></li>
								<li class="dropdown"><a href="#">Libros<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="libros_programacion.php">Historia</a></li>
										<li><a href="libros_informatica.php">Ficcion</a></li> 
										<li><a href="libros_sistemas.php">Programacion</a></li> 
										<li><a href="libros_bd.php">Base de Datos</a></li> 
										<li><a href="libros_web.php">Diseño Web</a></li> 
                                    </ul>
                                </li> 
								<li class="dropdown"><a href="#">Servicios<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="prestamos.php">Prestamos de Libros</a></li>
                                    </ul>
                                </li> 
								<li><a href="contacto.php">Contacto</a></li>
								<li><a href="busqueda.php">Buscar un Libro</a></li>
								<li><input type="checkbox" id="toggle"><label for="toggle" class="button"></label></li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</div><!--/header-->
	</header><!--/ fin del header-->
<?php
// Inicia una sesión para mantener la información del usuario logueado.
session_start();

// Incluye el archivo de conexión a la base de datos.
include("admin/conexion.php");

// Verifica si existe una sesión de usuario iniciada.
if(isset($_SESSION['usuario']))
 {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="biblioteca virtual UNI">
    <title>Libros Web</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">     
    <link rel="shortcut icon" href="images/iconolibreria.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<!--barra de correo, telefono y login-->
<?php include ('includes/header.php');?>
<!--slider de imagenes-->
<?php //include ('includes/slider.php');?>	
	<br>
			<div class="container">
			     <div class="row">

			         <div class="col-md-7">
			          <img src="images/home/87294-media.jpg" width="600" height="300">
			         </div>

			         <div class="col-md-5">
			            <h3>Mision y Vision</h3>
                        <p><h2>Mision</h2></p>
			            <p>
                        La Biblioteca de la Institución Educativa Barrio Santa Margarita garantiza la recuperación, preservación y acceso a la memoria colectiva de la Institución, representada por el patrimonio bibliográfico y hemerográfico en cualquier soporte físico. 
			            </p>
                        <p><h2>Vision</h2></p>
                        <p>
                        Nuestra visión para el año 2023 es lograr que la institución cuente con una política y una legislación adecuada que respalde con institucionalidad y recursos la recuperación, conservación, organización y acceso al patrimonio bibliográfico y documental, en cualquier soporte y en cualquier lugar del territorio institucional.  
                        </p>
			         </div>

			     </div>
			</div>
	<br>
	<br>
	<!--pie de pagina-->
<?php include ('includes/footer.php');?>
	 <!--Librerias de Jquery, Bootstrap y otras mas--> 
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>

<?php include "log.php"; ?>
<?php
}else{
	// Si no hay sesión de usuario iniciada, redirecciona a la página de inicio de sesión
    echo '<script> alert("primero debes iniciar sesión")</script>';
    echo '<script> window.location="index.php"; </script>';
}
?>
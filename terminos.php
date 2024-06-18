<?php
// Inicia la sesión para permitir el acceso a $_SESSION.
session_start();

// Incluye el archivo de conexión a la base de datos.
include("admin/conexion.php");

// Verifica si el usuario ha iniciado sesión.
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
			          <img src="images/prestamos.jpg" width="600" height="300">
			         </div>

			         <div class="col-md-5">
			            <h3>Términos de uso</h3>
			            <p>
                        Los contenidos publicados en el Repositorio Temático de la Biblioteca de SaluDerecho pueden ser consultados, descargados, guardados e impresos, siempre que no sea a título comercial ni con fines de lucro. Sólo se permiten tales usos con propósitos académicos, educativos, de investigación científica o de uso personal exclusivo, conforme con los usos honrados, en la medida justificada por el fin perseguido y dentro del marco legal aplicable. Es obligatorio el reconocimiento de los créditos de la obra, sin que esto implique que el autor apoya el uso que se esté haciendo de la misma. 
			            	
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
	// Si el usuario no ha iniciado sesión, redirige a la página de inicio de sesión.
	echo '<script> alert("primero debes iniciar sesión")</script>';
    echo '<script> window.location="index.php"; </script>';
}
?>
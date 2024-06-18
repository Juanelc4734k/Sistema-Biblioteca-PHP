<?php
// Inicia una sesión para mantener la información del usuario logueado.
session_start();

// Incluye el archivo de conexión a la base de datos.
include("admin/conexion.php");

// Verifica si existe una sesión de usuario iniciada.
if(isset($_SESSION['usuario']))
 {
?>
<?php include ('admin/conexion.php');

	//consulta para extraer la informacion de los libros en la base de datos
	$consulta=mysqli_query($con, "select * from libros where id_categoria = 12 limit 0,6");
	$nro_reg=mysqli_num_rows($consulta);
	if ($nro_reg==0){
	echo 'No Tienes Productos en la Base de Datos';
	}

    //consulta para contar las visitas de la pagina almacenadas en la base de datos
	$result=mysqli_query($con, "SELECT count(utc) as visitas from visitas");
  	$row = mysqli_fetch_array($result);
    $numero_visitas = $row["visitas"];

    //consulta para contar las visitas del dia de hoy
	$result2=mysqli_query($con, "SELECT count(utc) as visitas from visitas WHERE fecha_visita = CURDATE( )");
   	$row2 = mysqli_fetch_array($result2);
    $visitas_hoy = $row2["visitas"];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="biblioteca virtual UNI">
    <title>Libros Sistemas</title>
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
			          <img src="images/sistemas.jpg" width="600" height="300">
			         </div>

			         <div class="col-md-5">
			            <h3>Libros sobre Ingeniería de sistemas</h3>
			            <p>
						Estos son algunos de los Libros que puedes aprender a desarrollar programas, aplicaciones móviles, aplicaciones de escritorio, sitios web dinámicos, sistemas de información empresariales, entre otras cosas, el stock actual de libros es poco, pero a medida que pase el tiempo se irán agregando más libros en esta biblioteca.
			            </p>
			         </div>

			     </div>
			</div>
	<br>
	<br>
	<section>
		<div class="container">
			<div class="row">
			<!--Menu lateral Izquierdo-->
				<?php //include ('includes/sidebarIzquierdo.php'); ?>
				<div class="col-sm-9 padding-right">
					
					<!--Contenido Central donde se muestran los libros-->
					<!--Cuadros con los libros obtenidos de la base de datos-->
                    <div class="features_items">
						<h2 class="title text-center">Libros Disponibles</h2>
						 <?php
						// Se inicia un bucle while para recorrer los resultados de la consulta.
						// La variable $filas contiene los datos de cada fila obtenida de la base de datos.
						while($filas=mysqli_fetch_array($consulta)){

						// Se extraen los valores de cada columna de la fila actual y se almacenan en variables.
    					// Por ejemplo, $id contendrá el valor de la columna 'id_libro' de la fila actual.
						$id=$filas['id_libro'];
						$foto=$filas['foto'];
						$nombre=$filas['nombre'];
						$descripcion=$filas['descripcion'];
						?>
						<!-- Contenedor del botón Prestar -->
<div class="col-sm-3">
    <div class="product-image-wrapper">
        <div class="single-products">
            <div class="productinfo text-center">
                <img src="admin/<?php echo $foto ?>" width="50" height="180">
                <p><?php echo $nombre ?></p>
                <p><?php //echo $descripcion ?></p>
            </div>
            <div class="product-overlay">
                <div class="overlay-content">
                    <img src="admin/<?php echo $foto ?>" width="150" height="150">
                    <p><?php echo $nombre ?></p>
                    <!-- Cambiar el texto del botón a "Prestar" -->
                    <button class="btn btn-default prestar-btn" data-nombre="<?php echo $nombre ?>">Prestar</button>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Modal para mostrar el código QR -->
<div class="modal fade" id="codigoQRModal" tabindex="-1" role="dialog" aria-labelledby="codigoQRModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="codigoQRModalLabel">Código QR</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="location.reload()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="codigo-qr-container">
                <!-- Aquí se mostrará el código QR -->
            </div>
        </div>
    </div>
</div>	
									     	<?php } ?>
						
					</div><!--Datos obtenidos de la base de datos-->
					<!--Tabs-->
			     	<?php // include ('includes/tabs.php');?> 
					<!--slider de abajo-->
					<?php //include ('includes/sliderInferior.php');?> 					
				</div>
			</div>
		</div>
	</section>
	<!--pie de pagina-->
<?php include ('includes/footer.php');?>
	 <!--Librerias de Jquery, Bootstrap y otras mas--> 
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
	<!-- Script para manejar el clic en el botón "Prestar" -->
	<script>
    $(document).ready(function() {
        $(".prestar-btn").on("click", function() {
            var nombre_libro = $(this).data("nombre");
            var nombre_usuario = "<?php echo $_SESSION['usuario']; ?>";

			// Agregar un parámetro único para evitar caché
            var uniqueParam = new Date().getTime();
            var url = "codigo_qr.php?timestamp=" + uniqueParam;

            // Realizar la petición AJAX para generar el código QR
            $.ajax({
                type: "POST",
                url: "generar_qr.php", // Archivo PHP para generar el QR
                data: { nombre_usuario: nombre_usuario, nombre_libro: nombre_libro },
                success: function(data) {
                    // Mostrar el código QR en la ventana modal
                    $("#codigo-qr-container").html(data);
                    $("#codigoQRModal").modal("show");
                },
                error: function(xhr, status, error) {
                    console.log("Error en la petición AJAX:", xhr.responseText, status, error);
                    alert("Error al generar el código QR.");
                }
            });
        });
    });
</script>
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
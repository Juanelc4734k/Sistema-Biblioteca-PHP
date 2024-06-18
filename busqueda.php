<?php
// Inicia una sesión para mantener la información del usuario logueado.
session_start();

// Incluye el archivo de conexión a la base de datos.
include("admin/conexion.php");

// Verifica si existe una sesión de usuario iniciada.
if(isset($_SESSION['usuario']))
 {


	// Consulta para obtener los 6 primeros libros de la base de datos.
    $consulta=mysqli_query($con, "select * from libros limit 0,6");

	// Obtener el número de libros encontrados.
    $nro_reg=mysqli_num_rows($consulta);
    if ($nro_reg==0){
	echo 'No Tienes Productos en la Base de Datos';
	}

    // Consultas para obtener el número total de visitas y el número de visitas de hoy.
	$result=mysqli_query($con, "SELECT count(utc) as visitas from visitas");
    $row = mysqli_fetch_array($result);
    $numero_visitas = $row["visitas"];
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
    <title>Biblioteca-11 | Inicio</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">     
    <link rel="shortcut icon" href="images/iconolibreria.ico">
</head>
<body>
            <?php include ('includes/header.php');?>	
<section>
          <div class="container">
		     <div class="row">
		     	       <br>
						<div class="col-md-3">
					     <form name="busqueda" method="get" action="busqueda.php">				
							<div class="search_box pull-right">
								<input type="text" placeholder="Buscar" name="buscar" required="true" />
							</div>	
						</div>
						<div class="col-md-1">
						<input type="submit" name="enviar" value="Buscar Libro" class="btn btn-success">
					    </div>	
					     </form>
					<div class="col-md-2">
						<a href="busqueda.php"><button class="btn btn-danger">Ver Todos</button></a>
					    </div>	
              </div> 

                <div class="features_items">
                	<br><br>
				<h2 class="title text-center">Listado de Libros</h2>
			   <?php

        if (isset($_GET['enviar'])) {
         $busqueda=$_GET['buscar']; // Obtener la palabra clave de búsqueda del formulario
         $query=mysqli_query($con, "select * from libros where nombre like '%$busqueda%' and estado='si'");
		if (mysqli_num_rows($query) < 1) {
        // Si no se encontraron libros que coincidan con la búsqueda, mostrar mensaje de advertencia.
		//echo "<script>alert('No tenemos libros con esa categoria')</script>";
		 echo "<div class='col-sm-3'>";  
		 echo "<p style='color:red;'><b>No tenemos libros que coincidan con este nombre</b></p>"; 
		 echo "</div>";   	
		}
		else{
        // Mostrar los libros que coinciden con la búsqueda.
		while($row=mysqli_fetch_array($query)){
			
		        $id=$row['id_libro'];
				$foto=$row['foto'];
				$nombre=$row['nombre'];
				$descripcion=$row['descripcion']; 	
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
                    <a class="btn btn-default add-to-cart prestar-btn" data-nombre="<?php echo $nombre ?>" data-toggle="modal" data-target="#codigoQRModal<?php echo $id; ?>">Prestar</a>
                </div>
            </div>
        </div>
    </div>
</div>
         <?php } } ?>
         <?php	
        }
        else{
        $query=mysqli_query($con, "select * from libros where estado='si'");
           while($row=mysqli_fetch_array($query)){
			
		        $id=$row['id_libro'];
				$foto=$row['foto'];
				$nombre=$row['nombre'];
				$descripcion=$row['descripcion']; 	
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
                    <button class="btn btn-default prestar-btn" data-nombre="<?php echo $nombre ?>" data-toggle="modal" data-target="#codigoQRModal<?php echo $id; ?>">Prestar</button>
                </div>
            </div>
        </div>
    </div>
</div>
			   <!-- Modal para mostrar el código QR -->
<div class="modal fade" id="codigoQRModal<?php echo $id; ?>" tabindex="-1" role="dialog" aria-labelledby="codigoQRModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="codigoQRModalLabel">Código QR</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="location.reload()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="codigo-qr-container<?php echo $id; ?>">
                <!-- Aquí se mostrará el código QR -->
            </div>
        </div>
    </div>
</div>
         <?php
        }}
		
  ?>
             
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
	<script>
    $(document).ready(function() {
        $(".prestar-btn").on("click", function() {
            var nombre_libro = $(this).data("nombre");
            var nombre_usuario = "<?php echo $_SESSION['usuario']; ?>";

            // Obtener el ID del libro
            var id_libro = $(this).data("target").replace("#codigoQRModal", "");

            // Realizar la petición AJAX para generar el código QR
            $.ajax({
                type: "POST",
                url: "generar_qr.php", // Utilizar la URL con el ID del libro
                data: { nombre_usuario: nombre_usuario, nombre_libro: nombre_libro },
                success: function(data) {
                    // Mostrar el código QR en el contenedor del modal correspondiente
                    $("#codigo-qr-container" + id_libro).html(data);
                    $("#codigoQRModal" + id_libro).modal("show");
                },
                error: function(xhr, status, error) {
                    console.log("Error en la petición AJAX:", xhr.responseText, status, error);
                    alert("Error al generar el código QR.");
                }
            });
        });
		// Recargar la página después de cerrar la ventana modal
        $("#codigoQRModal").on("hidden", function() {
            location.reload();
        });
    });
</script>
</body>
</html>
<?php include "log.php"; ?>
<?php
}else{
    echo '<script> alert("primero debes iniciar sesión")</script>';
    echo '<script> window.location="index.php"; </script>';
}
?>
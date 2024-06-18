<?php
// Iniciar sesión de PHP para manejar información del usuario logueado.
session_start();

// Incluir archivo de conexión a la base de datos.
include("admin/conexion.php");

// Verificar si el usuario está logueado.
if(isset($_SESSION['usuario']))
 {
    $nombreUsuario = $_SESSION['usuario'];

    // Consulta SQL para obtener el idvisitante del usuario logueado
    $consulta = "SELECT idvisitante FROM visitantes WHERE usuario = '$nombreUsuario'";

    // Ejecutar la consulta
    $resultado = mysqli_query($con, $consulta);

    // Verificar si la consulta fue exitosa
    if ($resultado) {
        // Obtener el resultado de la consulta
        $fila = mysqli_fetch_assoc($resultado);

        // El valor de idvisitante se encuentra en $fila['idvisitante']
        $idVisitante = $fila['idvisitante'];
    }

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
    $fechaMensaje =date("Y-m-d");
	$result2=mysqli_query($con, "SELECT count(utc) as visitas from visitas WHERE fecha_visita = '".$fechaMensaje."'");
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
<!--barra de correo, telefono y login-->
<?php include ('includes/header.php');?>
<!--slider de imagenes-->
<?php include ('includes/slider.php');?>	
<section>
   <div class="container">
		<div class="row">
		<!--Menu lateral Izquierdo-->
			<?php //include ('includes/sidebarIzquierdo.php'); ?>
			<div class="col-sm-3"> <!--/Inicio de barra lateral izquierda-->
	<div class="left-sidebar">				
	    <div class="brands_products"><!--brands_products-->
			<h2>Categorías</h2>
			<div class="brands-name">
				<ul class="nav nav-pills nav-stacked">
			  
				<?php
							$caq=mysqli_query($con,"select * from categorias");
							while($catrow=mysqli_fetch_array($caq)){
								?>
								<li class="divider"></li>
								<li><a href="inicio.php?cat=<?php echo $catrow['id_categoria']; ?>"><?php echo $catrow['nombre_categoria']; ?></a></li>
								<?php
							}
						
						?>
				</ul>
			</div>
		</div><!--/brands_products-->
		    <div class="price-range"><!--price-range-->
				<h2>Visitas</h2>
				<div class="col-md-4">
				    <img src="images/home/visitas.png" width="60" height="60">
				</div>
				<div class="col-md-8">
					<h5><b><?php  echo $numero_visitas;?> Visitas Totales</b></h5>
					<h6><b><?php  echo $visitas_hoy;?> Visitas Hoy</b></h6>
				</div>
			</div><!--/price-range-->					
	</div>
</div> <!--fin de barra lateral izquierda-->
			<div class="col-sm-9 padding-right">
				<!--Contenido Central donde se muestran los libros-->
				<!--Cuadros con los libros obtenidos de la base de datos-->
                <div class="features_items">
				<h2 class="title text-center">Listado de Libros</h2>
			   <?php
                // Verificar si se ha seleccionado una categoría específica mediante GET.
                if (isset($_GET['cat'])) {
                $cat=$_GET['cat'];
                }
                else{
                $cat = "1";	// Categoría predeterminada si no se ha seleccionado ninguna.
            // echo "<script>alert('No tenemos libros con esa categoria')</script>";
                }

                // Consulta para obtener los libros de la categoría seleccionada.
                $query=mysqli_query($con,"select * from libros where id_categoria='$cat'");
                if (mysqli_num_rows($query) < 1) {
                // Si no hay libros en la categoría seleccionada, mostrar un mensaje de advertencia.
                //echo "<script>alert('No tenemos libros con esa categoria')</script>";
                echo "<div class='col-sm-3'>";  
                echo "<p style='color:red;'><b>No tenemos Libros para esta Categoria</b></p>"; 
                echo "</div>";   	
                }
                else{
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
                    <button class="btn btn-default prestar-btn" data-idlibro="<?php echo $id; ?>" data-nombre="<?php echo $nombre ?>">Prestar</button>
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

         <?php } } ?>
         <br>
					<!--Tabs-->
			     <div class="row">	<?php // include ('includes/tabs.php');?> </div>
					<!--slider de abajo-->
					<?php //include ('includes/sliderInferior.php');?> 
					<?php //include ('includes/tabs.php');?> 					
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
        var id_libro = $(this).data("idlibro"); // Agrega esta línea para obtener el id_libro
        var id_usuario = "<?php echo $idVisitante; ?>";
        
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

        // Resto del código para insertar el préstamo en la tabla prestamos
        $.ajax({
            type: "POST",
            url: "insertar_prestamo.php", // Archivo PHP para insertar el préstamo
            data: { idLibro: id_libro, idVisitante: id_usuario }, // Ajusta los valores según tu estructura de datos
            success: function(response) {
                // Mostrar un mensaje de éxito o error
                console.log(response); // Puedes quitar esta línea, se usa para depuración
                // Actualizar el estado del libro a "no"
                $.ajax({
                    type: "POST",
                    url: "actualizar_estado.php", // Archivo PHP para actualizar el estado
                    data: { idLibro: id_libro, estado: "no" }, // Ajusta los valores según tu estructura de datos
                    success: function(response) {
                        // Mostrar un mensaje de éxito o error para la actualización del estado
                        console.log(response); // Puedes quitar esta línea, se usa para depuración
                    },
                    error: function(xhr, status, error) {
                        console.log("Error en la petición AJAX:", xhr.responseText, status, error);
                        alert("Error al actualizar el estado del libro.");
                    }
                });
            },
            error: function(xhr, status, error) {
                console.log("Error en la petición AJAX:", xhr.responseText, status, error);
                alert("Error al registrar el préstamo.");
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
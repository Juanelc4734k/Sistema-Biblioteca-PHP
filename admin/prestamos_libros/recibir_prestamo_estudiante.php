<?php
require_once '../conexion.php';

$id=$_POST["id"];
$fecha1=$_POST["fecha1"];
$fecha2=$_POST["fecha2"];
$estudiante=$_POST["estudiante"]; 
$estado="libre";

$sql = "INSERT INTO prestamo_libro (fecha_prestamo, fecha_entrega, id_libro, idvisitante, estado) VALUES('$fecha1','$fecha2','$id','$estudiante', 'prestado')";

    mysqli_query($con,$sql);
	$peticion2 = "UPDATE libros SET estado = 'no' WHERE id_libro = '".$_POST['id']."'";
    $resultado2 = mysqli_query($con, $peticion2);

			if($resultado2){ 
			    echo '<script> alert("Prestamo Exitoso.");</script>';
			   echo '<script> window.location="../prestar_libro.php"; </script>';

				
				}else {
					echo '<script> alert("Error al procesar el prestamo.");</script>';
					echo '<script> window.location="../prestar_libro.php"; </script>';
					}
?>

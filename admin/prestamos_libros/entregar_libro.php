<?php include "../conexion.php" ?>
<?php

$peticion = "UPDATE prestamo_libro SET estado= 'libre' WHERE id_prestamo = '".$_GET['id']."'";
$resultado = mysqli_query($con, $peticion);

if (isset($_GET['id'])) {
  $id_prestamo = $_GET['id'];

  // Obtener el ID del libro asociado con el préstamo
  $consulta_libro = "SELECT id_libro FROM prestamo_libro WHERE id_prestamo = '$id_prestamo'";
  $resultado_libro = mysqli_query($con, $consulta_libro);

  if ($resultado_libro && mysqli_num_rows($resultado_libro) > 0) {
      $fila_libro = mysqli_fetch_assoc($resultado_libro);
      $id_libro = $fila_libro['id_libro'];

      // Actualizar el estado del libro
      $peticion2 = "UPDATE libros SET estado = 'si' WHERE id_libro = '$id_libro'";
      $resultado2 = mysqli_query($con, $peticion2);

      if ($resultado2) {
          echo '<script> alert("Estado del libro actualizado correctamente.");</script>';
      } else {
          echo '<script> alert("Error al actualizar el estado del libro: ' . mysqli_error($con) . '");</script>';
      }
  } else {
      echo '<script> alert("No se encontró un libro asociado con el ID de préstamo ' . $id_prestamo . '");</script>';
  }
} else {
  echo '<script> alert("Falta el ID del préstamo en la URL.");</script>';
}


  echo '<script> alert("Se ha devuelto el libro.");</script>';
    echo '<script> window.location="../Lista_prestamos_libros.php"; </script>';
?>

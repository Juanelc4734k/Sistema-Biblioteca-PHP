<?php
// Incluir archivo de conexión a la base de datos.
include("admin/conexion.php");

// Obtener el id del libro y el nuevo estado del POST
$idLibro = $_POST['idLibro'];
$estado = $_POST['estado']; // Este valor debe ser "no" según tu requerimiento.

// Consulta SQL para actualizar el estado del libro.
$query = "UPDATE libros SET estado = '$estado' WHERE id_libro = $idLibro";

// Ejecutar la consulta
$result = mysqli_query($con, $query);

if ($result) {
    // Éxito al actualizar el estado del libro.
    echo "El estado del libro se actualizó correctamente a '$estado'";
} else {
    // Error al actualizar el estado del libro.
    echo "Error al actualizar el estado del libro.";
}
?>

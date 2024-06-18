<?php
// Incluir archivo de conexión a la base de datos.
include("admin/conexion.php");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Obtener los datos del formulario AJAX
    $idLibro = $_POST["idLibro"];
    $idVisitante = $_POST["idVisitante"];
    $fechaPrestamo = date("Y-m-d");
    
    // Calcular la fecha de entrega (una semana después)
    $fechaEntrega = date("Y-m-d", strtotime("+1 week", strtotime($fechaPrestamo)));
    
    // Consulta para insertar el préstamo en la tabla prestamos
    $consulta = "INSERT INTO prestamo_libro (fecha_prestamo, fecha_entrega, id_libro, idvisitante, estado) VALUES ('$fechaPrestamo', '$fechaEntrega', '$idLibro', '$idVisitante', 'prestado')";
    
    // Ejecutar la consulta
    if (mysqli_query($con, $consulta)) {
        echo "Préstamo registrado con éxito. Fecha de entrega: $fechaEntrega";
    } else {
        echo "Error al registrar el préstamo: " . mysqli_error($con);
    }
}

// Cerrar la conexión a la base de datos
mysqli_close($con);
?>

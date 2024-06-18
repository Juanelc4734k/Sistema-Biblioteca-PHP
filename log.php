
<?php 
// Se incluye el archivo de conexión a la base de datos (admin/conexion.php).
include ('admin/conexion.php');

// Se construye la consulta SQL para insertar los datos de la visita en la tabla 'visitas'.
// Se utilizan diferentes variables del entorno del servidor ($_SERVER) para obtener información sobre la visita.
$peticion = "INSERT INTO visitas VALUES (
'".date('U')."',
'".date('Y-m-d h:i:s')."',
'".$_SERVER['REMOTE_ADDR']."', 
'".$_SERVER['HTTP_USER_AGENT']."',
'".$_SERVER['REQUEST_URI']."'
)";

// Se ejecuta la consulta en la base de datos mediante la función mysqli_query().
$resultado = mysqli_query($con, $peticion);

// Se cierra la conexión a la base de datos para liberar recursos.
$con->close();

//'".$_SERVER['REMOTE_ADDR']."',  Dirección IP del visitante.
//'".$_SERVER['HTTP_USER_AGENT']."', User-Agent del navegador del visitante.
//'".$_SERVER['REQUEST_URI']."'"     URL de la página visitada.
?>



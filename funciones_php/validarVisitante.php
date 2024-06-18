<?php 
// Inicia una sesión para mantener la información del usuario logueado.
include ('../admin/conexion.php');
?>

<?php 
//obtiene los datos ingresados en el login.
$nombre = $_POST['nombre'];
$email = $_POST['email'];
$telefono = $_POST['telefono'];
$direccion = $_POST['direccion'];
$alias = $_POST['alias'];
$pass = $_POST['pass'];
$edad = $_POST['edad'];
$sexo = $_POST['sexo'];
$pais = $_POST['pais'];
$id_rol = "2";

// Prepara la consulta SQL para insertar los datos
$sql = "INSERT INTO visitantes (nombreCompleto, usuario, pass, email, telefono, direccion, alias, edad, sexo, pais, estado, fechaRegistro, id_rol)
VALUES ('$nombre', '$alias', '$pass', '$email', '$telefono', '$direccion', '$alias', '$edad', '$sexo', '$pais', '1', CURRENT_TIMESTAMP, '$id_rol')";

// Ejecuta la consulta.
$res = mysqli_query($con, $sql);

// Si la consulta es validad envia una alerta afirmativa, sino una alerta negativa
if ($res) {
    echo '<script> alert("Gracias por inscribirte a nuestra pagina. \n Ya puedes ingresar con tus datos de acceso.");</script>';
    echo '<script> window.location="../index.php"; </script>';
} else {
    echo '<script> alert("Lo sentimos no pudimos agregarte. Inténtalo más tarde");</script>';
    echo '<script> window.location="../index.php"; </script>';
}
?>

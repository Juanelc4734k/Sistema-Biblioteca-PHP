<?php
session_start();
include("admin/conexion.php");

// Verificar si el usuario está autenticado antes de permitir el acceso a la página
if (!isset($_SESSION['usuario'])) {
    // Redirigir a la página de inicio de sesión o mostrar un mensaje de error
    echo '<script> alert("primero debes iniciar sesión")
                    window.location = "index.php";        
    </script>';
    
    exit();
}

$nombreActual = $_SESSION['usuario'];

$query = "SELECT * FROM visitantes WHERE usuario = '$nombreActual'";
$resultado = mysqli_query($con, $query);

if (!$resultado) {
    die("Error al ejecutar la consulta: " . mysqli_error($con));
}

if (mysqli_num_rows($resultado) !== 1) {
    die("Usuario no encontrado en la base de datos.");
}

$row = mysqli_fetch_assoc($resultado);
$id = $row['idvisitante'];
$nombre = $row['nombreCompleto'];
$pass = $row['pass'];
$email = $row['email'];
$telefono = $row['telefono'];
$direccion = $row['direccion'];
$alias = $row['alias'];
$edad = $row['edad'];
$sexo = $row['sexo'];
$pais = $row['pais'];
$estado = $row['estado'];

// Procesar el formulario de actualización
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validar y filtrar los datos ingresados por el usuario
    $nuevoNombre = mysqli_real_escape_string($con, $_POST['nombre']);
    $nuevaPass = mysqli_real_escape_string($con, $_POST['pass']);
    $nuevoEmail = mysqli_real_escape_string($con, $_POST['email']);
    $nuevoTelefono = mysqli_real_escape_string($con, $_POST['telefono']);
    $nuevaDireccion = mysqli_real_escape_string($con, $_POST['direccion']);
    $nuevoAlias = mysqli_real_escape_string($con, $_POST['alias']);
    $nuevaEdad = mysqli_real_escape_string($con, $_POST['edad']);
    $nuevoSexo = mysqli_real_escape_string($con, $_POST['sexo']);
    $nuevoPais = mysqli_real_escape_string($con, $_POST['pais']);

    // Validar que los campos obligatorios no estén vacíos antes de la actualización
    if (empty($nuevoNombre) || empty($nuevoEmail) || empty($nuevoTelefono)) {
        die("Nombre, Email y Teléfono son campos obligatorios.");
    }

    // Actualizar la información del usuario en la base de datos utilizando una sentencia preparada
    $actualizarQuery = "UPDATE visitantes SET nombreCompleto = ?, pass = ?, email = ?, telefono = ?, direccion = ?, alias = ?, edad = ?, sexo = ?, pais = ? WHERE idvisitante = ?";
    $stmt = mysqli_prepare($con, $actualizarQuery);
    mysqli_stmt_bind_param($stmt, "sssssssssi", $nuevoNombre, $nuevaPass, $nuevoEmail, $nuevoTelefono, $nuevaDireccion, $nuevoAlias, $nuevaEdad, $nuevoSexo, $nuevoPais, $id);

    if (mysqli_stmt_execute($stmt)) {
        // Actualización exitosa, actualizar $_SESSION con los nuevos valores
        $_SESSION['usuario'] = $nuevoAlias;
        // Puedes actualizar más datos en $_SESSION si es necesario
        // ...
        $mensaje = "Informacion actualizada correctamente";
        echo "<script>alert('$mensaje');</script>";
        // Redirigir o mostrar un mensaje de éxito
        header("Location: perfil.php"); // Redirigir a la misma página para mostrar los cambios actualizados
        exit();
    } else {
        $mensaje = "Informacion NO actualizada";
        // Registra el error en el servidor
        error_log("Error al actualizar la información: " . mysqli_stmt_error($stmt));
    }

    // Cerrar la declaración preparada después de usarla
    mysqli_stmt_close($stmt);
}
// Realizar una nueva consulta para obtener los datos actualizados
$query = "SELECT * FROM visitantes WHERE usuario = '$nombreActual'";
$resultado = mysqli_query($con, $query);

if (!$resultado) {
    die("Error al ejecutar la consulta: " . mysqli_error($con));
}

$row = mysqli_fetch_assoc($resultado);
$id = $row['idvisitante'];
$nombre = $row['nombreCompleto'];
$pass = $row['pass'];
$email = $row['email'];
$telefono = $row['telefono'];
$direccion = $row['direccion'];
$alias = $row['alias'];
$edad = $row['edad'];
$sexo = $row['sexo'];
$pais = $row['pais'];
$estado = $row['estado'];
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
    <?php include('includes/header.php'); ?>
    <center>
        <h1>Perfil de Usuario</h1>
    </center>
    <div class="container">
        <form method="POST">
            <input type="hidden" class="form-control" name="id" value="<?php echo $id; ?>">

            <div class="form-floating mb-3">
            <label for="nombre">Nombre</label>
              <input type="text" class="form-control" name="nombre" placeholder="nombre" value="<?php echo $nombre; ?>">
            </div><br>

            <div class="mb-3">
              <label for="" class="form-label">Email</label>
              <input type="email" class="form-control" name="email" aria-describedby="emailHelpId" placeholder="abc@mail.com" value="<?php echo $email; ?>">
            </div><br>
        
            <div class="form-floating mb-3">
            <label for="formId1">Teléfono</label>
              <input type="text" class="form-control" name="telefono" placeholder="teléfono" value="<?php echo $telefono; ?>">
            </div><br>

            <div class="form-floating mb-3">
            <label for="formId1">Dirección</label>
              <input type="text" class="form-control" name="direccion" placeholder="dirección" value="<?php echo $direccion; ?>">
            </div><br>
        
            <div class="form-floating mb-3">
            <label for="formId1">Alias</label>
              <input type="text" class="form-control" name="alias" placeholder="Alias" value="<?php echo $alias; ?>">
            </div><br>
        
            <div class="form-floating mb-3">
            <label for="formId1">Fecha nacimiento</label>
              <input type="text" class="form-control" name="edad" placeholder="Fecha de nacimiento" value="<?php echo $edad; ?>">
            </div><br>
        
            <div class="form-floating mb-3">
            <label for="formId1">Sexo</label>
              <input type="text" class="form-control" name="sexo" placeholder="Sexo" value="<?php echo $sexo; ?>">
            </div><br>
        
            <div class="form-floating mb-3">
            <label for="formId1">País</label>
              <input type="text" class="form-control" name="pais" placeholder="País" value="<?php echo $pais; ?>">
            </div><br>


            <br>
            <br>
            <br>

            
                <h3>Cambiar la contraseña</h3>
                <div class="mb-3">
                  <label for="" class="form-label">contraseña nueva</label>
                  <input type="text" class="form-control" name="pass" placeholder="contraseña" value="<?php echo $pass; ?>" >
                </div>
            

            <br>
            <br>
            <br>
        
            <button type="submit" class="btn btn-success">actualizar información</button>
        </form>
        <br>
        <br>

    </div>

        <?php 
            include('includes/footer.php');
        ?>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>

</body>

</html>
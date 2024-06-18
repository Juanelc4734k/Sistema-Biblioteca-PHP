<?php
// Inicia una sesión para mantener la información del usuario logueado.
session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Validando...</title>
    <meta charset="utf-8">
</head>
<body>
    <?php
        // Incluye el archivo de conexión a la base de datos.
        include '../admin/conexion.php';
        if(isset($_POST['login'])){

            // Obtiene la informacion ingresada a traves del metodo "POST".
            $usuario = $_POST['username'];
            $pw = $_POST['password'];

            // Consulta preparada con marcadores de posición (?)
            $query = "SELECT * FROM visitantes WHERE usuario = ? AND pass = ? AND estado = '1'";
            $stmt = mysqli_prepare($con, $query);
            mysqli_stmt_bind_param($stmt, "ss", $usuario, $pw);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);

            // Si el resultado coincide con la informacion dada inicia sesion.
            if(mysqli_num_rows($result) > 0) {
                $row = mysqli_fetch_array($result);
                
                // Si id_rol es igual a 1 ingresa como administrador
                if ($row['id_rol'] == 1) {
                    $_SESSION["user"] = $row['usuario'];
                    header("Location: ../admin/inicio.php");
                } else if ($row['id_rol'] == 2) {
                    // De lo contrario ingresa como usuario o cliente
                    $_SESSION["usuario"] = $row['usuario'];
                    header("Location: ../inicio.php");
                } else {
                    // Si id_rol no existe enviar un mensaje alerta 
                    echo '<script> alert("Rol desconocido.");</script>';
                    echo '<script> window.location="../index.php"; </script>';
                    exit();
                }
                exit();
            } else {
                // Sino lanza una alerta diciendo "Usuario o contraseña incorrectos".
                echo '<script> alert("Usuario o contraseña incorrectos.");</script>';
                echo '<script> window.location="../index.php"; </script>';
                exit();
            }
        }
    ?>
</body>
</html>

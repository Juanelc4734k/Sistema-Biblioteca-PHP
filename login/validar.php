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

            // Consulta preparada con marcadores de posición (?) esto para prevenir (SQL Injection).
            $query = "SELECT * FROM administrador_biblioteca WHERE user = ? AND pass = ?";
            $stmt = mysqli_prepare($con, $query);
            mysqli_stmt_bind_param($stmt, "ss", $usuario, sha1($pw));
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);

            // Si el resultado coincide con la informacion dada inicia sesion.
            if(mysqli_num_rows($result) > 0) {
                $row = mysqli_fetch_array($result);
                $_SESSION["user"] = $row['user'];
                echo 'Iniciando sesión para '.$_SESSION['user'].' <p>';
                header("Location: ../admin/inicio.php");
                exit();
            } else {
                // Sino lanza una alerta diciendo "Usuario o contraseña incorrectos".
                echo '<script> alert("Usuario o contraseña incorrectos.");</script>';
                echo '<script> window.location="login.php"; </script>';
                exit();
            }
        }
    ?>
</body>
</html>

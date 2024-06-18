<?php
// Inicia una sesión para mantener la información del usuario logueado.
session_start();

// Se destruye la sesión creada
session_destroy();

// Crea una alerta y redirige el usuario a la pagina del login
echo '<script> alert("Has cerrado tu sesion.");</script>';
echo '<script> window.location="../index.php"; </script>';
?>

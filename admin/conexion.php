<?php
$servername = "localhost";
$username = "admin";
$password = "admin";
$db = "bibliotecauni";

$con = mysqli_connect($servername, $username, $password,$db);

if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
?>

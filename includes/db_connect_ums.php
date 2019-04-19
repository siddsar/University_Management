<?php


include_once 'ums-config.php';   // Needed because functions.php is not included

$mysqli_ums = new mysqli(HOST, USER, PASSWORD, DATABASE);
if ($mysqli_ums->connect_error) {
    header("Location: ../error.php?err=Unable to connect to MySQL");
    exit();
}
?>


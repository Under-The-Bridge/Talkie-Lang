<?php

require "connection-db.php";

$login = $_POST["login"];
$email = $_POST["email"];
$password = $_POST["password"];

$usercheck = mysqli_query($conn, "select * from users where user_login = '$login' or user_email = '$email'");

if (mysqli_num_rows($usercheck) == 0) {
    $sql = "insert into `users`(`user_login`,`user_email`,`user_password`) values ('$login','$email','$password')";
    $result = mysqli_query($conn, $sql);
}else{
    echo "занято";
}
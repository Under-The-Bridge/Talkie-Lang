<?php
session_start();
require "../connection-db.php";

$lang = $_POST["lang"] ?? false;
$login = $_POST["login"] ?? false;
$email = $_POST["email"] ?? false;
$password = $_POST["password"] ?? false;

$usercheck = mysqli_query($conn, "select * from users where user_login = '$login' or user_email = '$email'");
if (mysqli_num_rows($usercheck) == 0) {
    $sql = "insert into `users`(`user_login`,`user_email`,`user_password`) values ('$login','$email','$password')";
    $result = mysqli_query($conn, $sql);
    $user = mysqli_fetch_assoc(mysqli_query($conn, "select * from users where user_login = '$login' or user_email = '$email'"));
    $_SESSION["id"] = $user["user_id"];
    echo "    <script>
        alert('Вы зарегистрировались');
        location.href = '/?lang=$lang';
    </script>";
}else{
    echo "    <script>
        alert('Логин или почта занята');
        window.history.back();
    </script>";
}
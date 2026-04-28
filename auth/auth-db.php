<?php
session_start();
require "../connection-db.php";

$login = $_POST["login"] ?? false;
$password = $_POST["password"] ?? false;

$usercheck = mysqli_query($conn, "select * from users where user_login = '$login' or user_email = '$login'");

if (mysqli_num_rows($usercheck) != 0) {
    $user = mysqli_fetch_assoc($usercheck);
    if ($user["user_password"] == $password) {
        $_SESSION["id"] = $user["user_id"];
                        echo "    <script>
        alert('Вы вошли');
        location.href = '/';
    </script>";
    } else {
                echo "    <script>
        alert('Неправильный пароль');
        location.href = '/auth/';
    </script>";
    }
} else {
        echo "    <script>
        alert('Пользователя с таким логином/почтой нет');
        location.href = '/auth/';
    </script>";
}
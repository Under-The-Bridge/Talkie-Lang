<?php
session_start();
require "../connection-db.php";

$lang = $_POST["lang"] ?? false;
$login = $_POST["login"] ?? false;
$password = $_POST["password"] ?? false;

$usercheck = mysqli_query($conn, "select * from users where user_login = '$login' or user_email = '$login'");

if (mysqli_num_rows($usercheck) != 0) {
    $user = mysqli_fetch_assoc($usercheck);
    if ($user["user_password"] == $password) {
        $_SESSION["id"] = $user["user_id"];
        if($user["user_role"] == "admin"){
            echo "    <script>
location.href = '/admin';
</script>";
        }else{
            echo "    <script>
alert('Вы вошли');
location.href = '/?lang=$lang';
</script>";
        }
    } else {
                echo "    <script>
        alert('Неправильный пароль');
        window.history.back();
    </script>";
    }
} else {
        echo "    <script>
        alert('Пользователя с таким логином/почтой нет');
        window.history.back();
    </script>";
}
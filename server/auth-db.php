<?php
require "../connection-db.php";

$lang = $_POST["lang"] ?? false;
$login = $_POST["login"] ?? false;
$password = $_POST["password"] ?? false;

$usercheck = mysqli_query($conn, "select * from users where user_login = '$login' or user_email = '$login'");

if (mysqli_num_rows($usercheck) != 0) {
    $user = mysqli_fetch_assoc($usercheck);
    if ($user["user_banned"] >= 1) {
        echo "    <script>
        alert('Аккаунт заблокирован');
        window.history.back();
    </script>";
    exit;
    }
    if (password_verify($password,$user['user_password'])) {
        $_SESSION["id"] = $user["user_id"];
        if ($user["user_role"] == "admin") {
            echo "    <script>
location.href = '/admin';
</script>";
exit;
        } else {
            echo "    <script>
alert('Вы вошли');
location.href = '/?lang=$lang';
</script>";
exit;
        }
    } else {
        echo "    <script>
        alert('Неправильный пароль');
        window.history.back();
    </script>";
    exit;
    }
} else {
    echo "    <script>
        alert('Пользователя с таким логином/почтой нет');
        window.history.back();
    </script>";
    exit;
}
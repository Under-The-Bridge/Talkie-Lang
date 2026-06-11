<?php
require "../connection-db.php";
if (isset($_POST["btnLogin"])) {
    $login = trim($_POST["login"]);
    if (empty($login)) {
        echo "<script>
        alert('Пустое поле!')
        location.href='/profile';
        </script>";
        exit;
    }
    $usercheck = mysqli_query($conn, "select * from users where user_login = '$login'");
    if (mysqli_num_rows($usercheck) == 0) {
        $sql = "UPDATE `users` SET `user_login`='$login' WHERE `user_id` = '$id'";
        mysqli_query($conn, $sql);
        echo "<script>
        alert('Логин изменен!')
        location.href='/profile';
        </script>";
    } else {
        echo "<script>
        alert('Логин занят!')
        location.href='/profile';
        </script>";
    }
} else if (isset($_POST["btnEmail"])) {
    $email = trim($_POST["email"]);
    if (empty($email)) {
        echo "<script>
        alert('Пустое поле!')
        location.href='/profile';
        </script>";
        exit;
    }
    $usercheck = mysqli_query($conn, "select * from users where user_email = '$email'");
    if (mysqli_num_rows($usercheck) == 0) {
        $sql = "UPDATE `users` SET `user_email`='$email' WHERE `user_id` = '$id'";
        mysqli_query($conn, $sql);
        echo "<script>
        alert('Почта изменена!')
        location.href='/profile';
        </script>";
    } else {
        echo "<script>
        alert('Почта занята!')
        location.href='/profile';
        </script>";

    }
} else if (isset($_POST["btnPassword"])) {
    $currentPassword = trim($_POST["currentPassword"]);
    $newPassword = trim($_POST["newPassword"]);
    if (empty($currentPassword) || empty($newPassword)) {
        echo "<script>
        alert('Пустое поле!')
        location.href='/profile';
        </script>";
        exit;
    }
    $usercheck = mysqli_query($conn, "select * from users WHERE `user_id` = '$id'");

    if (mysqli_num_rows($usercheck) != 0) {
        $user = mysqli_fetch_assoc($usercheck);
        if ($user["user_password"] == $currentPassword) {
            $sql = "UPDATE `users` SET `user_password`='$newPassword' WHERE `user_id` = '$id'";
            mysqli_query($conn, $sql);
            echo "<script>
        alert('Пароль изменен изменена!')
        location.href='/profile';
        </script>";
        } else {
            echo "<script>
        alert('Неверный пароль!')
        location.href='/profile';
        </script>";
        }
    }
}
?>
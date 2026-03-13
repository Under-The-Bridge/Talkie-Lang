<?php

require "connection-db.php";

$user = $_POST["user"];
$password = $_POST["password"];

$usercheck = mysqli_query($conn, "select * from users where user_login = '$user' or user_email = '$user'");

if (mysqli_num_rows($usercheck) != 0) {
    $user = mysqli_fetch_assoc($usercheck);
    if($user["user_password"] == $password){
        setcookie("user", $user["user_login"], time()+3600);
        echo "вошли";
    }else{
        echo "неправильный пароль";
    }
}else{
    echo "такого пользователя нет";
}
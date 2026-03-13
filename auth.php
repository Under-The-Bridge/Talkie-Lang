<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    include "components/header.php";
    ?>
    <form action="reg-db.php" method="post">
        <label for="login">Логин</label>
        <input type="text" id="login" name="login">
        <label for="email">Email</label>
        <input type="text" id="email" name="email">
        <label for="password">Пароль</label>
        <input type="password" id="password" name="password">
        <button name="regBtn">Зарегать</button>
    </form>
    <form action="auth-db.php" method="post">
        <label for="user">Логин/Email</label>
        <input type="text" id="user" name="user">
        <label for="password">Пароль</label>
        <input type="password" id="password" name="password">
        <button name="regBtn">Войти</button>
    </form>
</body>

</html>
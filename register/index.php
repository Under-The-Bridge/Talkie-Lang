<?php session_start();?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../css/bootstrap-reboot.css.map">
    <link rel="stylesheet" href="../css/bootstrap-utilities.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../assets/js/bootstrap.bundle.min.js" async defer></script>
    <script src="../assets/js/jquery-4.0.0.js" async defer></script>
    <style>
        label{
            font-weight: 900;
            color: #e0834d;
        }
        .btn{
            background: #e0834d;
            color: white;
            box-sizing: border-box;
            border:2px #e0834d solid;
            font-weight: 900;
        }
        .btn:hover{
            border:2px #e0834d solid;
            color: #e0834d;
        }
    </style>
    <title>Talkie Lang</title>
</head>

<body>
    <?php
    include "../components/header.php";
    ?>
    <main class="container">
        <form method="post" action="reg-db.php">
            <div class="mb-3">
                <label for="login" class="form-label">Логин</label>
                <input type="text" class="form-control" id="login" aria-describedby="login" name="login">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Почта</label>
                <input type="email" class="form-control" id="email" aria-describedby="email" name="email">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Пароль</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <button type="submit" class="btn">Зарегистрировать</button>
        </form>
    </main>
</body>

</html>
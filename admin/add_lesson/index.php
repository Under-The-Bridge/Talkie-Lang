<!DOCTYPE html>
<html lang="en">


<?php include "../../components/head.php"; ?>

<body>
    <?php include "../../components/header-admin.php"; ?>
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
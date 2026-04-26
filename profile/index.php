<?php
session_start();
require "connection-db.php";
$id = $_SESSION["id"];
$user = mysqli_fetch_assoc(mysqli_query($conn, "select * from users where user_id = $id"));
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../components/head.php"; ?>

<body>
    <?php include "../components/header.php"; ?>
    <main class="container">
        <h4>Привет, <?=$user["user_login"]?></h4>
        <a href="logout.php">Выйти из профиля</a>
    </main>
</body>

</html>
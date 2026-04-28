<?php
session_start();
require "../connection-db.php";
$id = $_SESSION["id"];
$user = mysqli_fetch_assoc(mysqli_query($conn, "select * from users where user_id = $id"));
$progresses = mysqli_fetch_all(mysqli_query($conn,"select * from user_lang_progress where user_id = $id"));
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../components/head.php"; ?>

<body>
    <?php include "../components/header.php"; ?>
    <main class="container">
        <h4>Привет, <?=$user["user_login"]?></h4>
        <a href="logout.php">Выйти из профиля</a>
        <?php foreach($progresses as $progress):
            $lessons = mysqli_num_rows(mysqli_query($conn,"select * from lesson where lesson_language = ".$progress[2]));
            ?>
        <div class="card mb-3">
            <div class="row g-0 d-flex justify-content-between align-items-center">
                <div class="col-md-4"  style="height: 125px; max-width:125px">
                    <h1>🍔</h1>
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <div class="d-flex g-1">
                            <h2 class="card-title">Английский язык</h2>
                            <h2 class="card-title ms-3"><?=(int)round(100*$progress[3]/$lessons)."%"?></h2>
                        </div>
                    <p class="card-text">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                            <div class="progress-bar" style="width: calc(100%*<?=$progress[3]?>/<?=$lessons?>)"></div>
                        </div>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <?php endforeach;?>
    </main>
</body>

</html>
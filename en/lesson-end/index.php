<?php
session_start();
//http://talkie-lang/en/lesson/index.php?id=1&prog=9&mistakes=5
require "../../connection-db.php";
$mistakes = $_SESSION["mistakes"] ?? 0;
$progress = $_GET["prog"] ?? 0;
$lesson_id = $_GET["id"] ?? 1;

$lesson = $_SESSION["lesson"];

$all = [];
for ($i = 0; $i < count($lesson); $i++) {
    $wq = $lesson[$i][0];
    $aq = $lesson[$i][1];
    $wq = mysqli_fetch_assoc(mysqli_query($conn, "Select * from words where word_id = $wq"));
    $aq = mysqli_fetch_assoc(mysqli_query($conn, "Select * from words where word_id = $aq"));

    $temp = [$wq, $aq];
    array_push($all, $temp);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <script src="../../assets/js/bootstrap.bundle.min.js" async defer></script>
    <title>Document</title>
    <link rel="stylesheet" href="../../lesson_tests/temp.css">
</head>
<!-- <?php //include "../../lesson_tests/test-$rand.php" ?> -->

<body>
    <main class="container">
        <div>
            <a href="/en/">Вернуться на главную</a>
            <h4>Вы закончили урок</h4>
            <h5 class="mb-4">Количество ошибок: <?= $mistakes ?></h5>
            <h5>Ваши результаты</h5>
            <div class="row row-cols-1 row-cols-md-2 g-4">
                <?php foreach ($all as $al): ?>
                    <div class="col">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-text">Слово:<?= $al[0]["word_name"] ?></p>
                                <p class="card-text">Ваш ответ:<?= $al[1]["word_translate"] ?></p>
                                <p class="card-text">
                                    <?php if ($al[0]["word_id"] == $al[1]["word_id"]): ?>
                                        <small class="text-body-secondary">Всё верно!</small>
                                    <?php else: ?>
                                        <small class="text-body-secondary">Правильный
                                            ответ: <?= $al[0]["word_translate"] ?></small>
                                    <?php endif; ?>
                                </p>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </main>
</body>

</html>
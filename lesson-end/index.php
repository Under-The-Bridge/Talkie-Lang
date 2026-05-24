<?php
session_start();
//http://talkie-lang/en/lesson/index.php?id=1&prog=9&mistakes=5
require "../connection-db.php";

$xp = 1000;

$mistakes = $_SESSION["mistakes"] ?? 0;
$prog = $_SESSION["progress"] ?? 0;
$c = $_SESSION["lesson_count"];
$time = $_SESSION["lesson_time"];
if (!isset($_SESSION["current_time"])) {
    $_SESSION["current_time"] = time();
}
$current_time = $_SESSION["current_time"];

$xp = $xp - ($current_time - $time) - ($mistakes * 150);
$lesson_id = $_GET["id"] ?? 1;
$id = $_SESSION["id"];

$lang = mysqli_fetch_array(mysqli_query($conn, "select lesson_language from lesson"))[0];

$nums = mysqli_num_rows(mysqli_query($conn, "select * from completed_lessons where lesson_id = $lesson_id and user_id = $id"));

$count = mysqli_fetch_assoc(mysqli_query($conn, "select * from completed_lessons where user_id = $id and lesson_id = $lesson_id"))["count"];

if (round($prog * 0.25) >= $mistakes) {
    if ($count == 3 && $c == 3) {
        $lessons_count = mysqli_fetch_array(mysqli_query($conn, "SELECT COUNT(*) FROM `lesson` WHERE lesson_id <= $lesson_id and lesson_language = 1"))[0];
        $les_id = mysqli_fetch_array(mysqli_query($conn, "SELECT * from lesson where lesson_language = 1 LIMIT 1 OFFSET $lessons_count"))[0];
        mysqli_query($conn, "INSERT INTO `completed_lessons`(`user_id`, `lesson_id`) VALUES ('$id','$les_id')");
        $progress = mysqli_fetch_array(mysqli_query($conn, "select progress from user_lang_progress where lang_id = $lang and user_id = $id"))[0];
        $progress++;
        mysqli_query($conn, "UPDATE `user_lang_progress` SET `progress`='$progress' where lang_id = $lang and user_id = $id");
        $count++;
        $sql = "UPDATE `completed_lessons` SET `count`='$count' where user_id = $id and lesson_id = $lesson_id";
        $query = mysqli_query($conn, $sql);
        $exp = $user["user_weekly_xp"] + $xp;
        mysqli_query($conn, "UPDATE `users` SET `user_weekly_xp`='$exp' WHERE user_id = $id");
    } else if ($c == $count) {
        $exp = $user["user_weekly_xp"] + $xp;
        mysqli_query($conn, "UPDATE `users` SET `user_weekly_xp`='$exp' WHERE user_id = $id");
        $count++;
        $sql = "UPDATE `completed_lessons` SET `count`='$count' where user_id = $id and lesson_id = $lesson_id";
        $query = mysqli_query($conn, $sql);
    }
}

$lesson = $_SESSION["lesson"];
$all = [];
for ($i = 0; $i < count($lesson); $i++) {
    if ($lesson[$i][2] == "list") {
        $temp = [[$lesson[$i][0], $lesson[$i][2]]];
        array_push($all, $temp);
        continue;
    }
    $wq = $lesson[$i][0];
    $aq = $lesson[$i][1];
    $wq = mysqli_fetch_assoc(mysqli_query($conn, "Select * from words where word_id = $wq"));
    $aq = mysqli_fetch_assoc(mysqli_query($conn, "Select * from words where word_id = $aq"));
    $temp = [$wq, $aq, $lesson[$i][2]];
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
            <a href="/?lang=<?=$_SESSION["lang"]?>">Вернуться на главную</a>
            <h4>Вы закончили урок</h4>
            <h5 class="mb-4">Время прохождения: <?= date("i:s", $current_time - $time) ?></h5>
            <h5 class="mb-4">Количество ошибок: <?= $mistakes ?></h5>
            <h5 class="mb-4">Полученный опыт: <?= $xp?></h5>
            <h5 class="mb-4">Решено: <?= $prog - $mistakes ?>/<?= $prog ?></h5>
            <h5>Ваши результаты</h5>
            <div class="grid">
                <?php foreach ($all as $al):
                    $l = $al[0][1] ?? false ?>
                    <? if ($l): ?>
                        <div class="answers end">
                            <button class="good">
                                <div>
                                    <p class="card-text">Ваш ответ:
                                        <?= $al[0]["0"] ?>
                                    </p>
                                </div>
                            </button>
                        </div>
                    <?php else: ?>
                        <div class="answers end">
                            <button class="<?= ($al[0]["word_id"] == $al[1]["word_id"]) ? "good" : "bad" ?>">
                                <div>
                                    <?php if ($al[2] == "toRu"): ?>
                                        <p class="card-text">Слово:<?= $al[0]["word_name"] ?></p>
                                        <p class="card-text">Ваш ответ:<?= $al[1]["word_translate"] ?></p>
                                        <p class="card-text">
                                            <?php if ($al[0]["word_id"] != $al[1]["word_id"]): ?>
                                                <!-- <small class="text-body-secondary">Всё верно!</small> -->
                                                <small class="text-body-secondary">Верный
                                                    ответ: <?= $al[0]["word_translate"] ?></small>
                                            <?php endif; ?>
                                        </p>
                                    <?php elseif ($al[2] == "toEn"): ?>
                                        <p class="card-text">Слово:
                                            <?= $al[0]["word_translate"] ?>
                                        </p>
                                        <p class="card-text">Ваш ответ:
                                            <?= $al[1]["word_name"] ?>
                                        </p>
                                        <p class="card-text">
                                            <?php if ($al[0]["word_id"] != $al[1]["word_id"]): ?>
                                                <small class="text-body-secondary">Верный
                                                    ответ:
                                                    <?= $al[0]["word_name"] ?>
                                                </small>
                                            <?php endif; ?>
                                        </p>
                                    <?php endif; ?>
                                </div>
                            </button>
                        </div>
                    <?php endif; ?>

                <?php endforeach; ?>
            </div>
        </div>
    </main>
</body>

</html>
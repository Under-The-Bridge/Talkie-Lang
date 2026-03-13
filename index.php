<?php
require "connection-db.php";
$lessons = mysqli_fetch_all(mysqli_query($conn, "select * from lessons"));
?>
<!DOCTYPE html>
<html lang="en">


<?php include "components/head.php"; ?>

<body>
    <?php include "components/header.php"; ?>
    <main>
        <div class="container">
            <div class="lesson">
                <div class="lesson-bg">
                    <a href="" class="lesson-emoji">👋🏻<p>Начать урок</p>
                    </a>
                    <div class="lesson-info">
                        <p class="title1">Урок 1: Приветствие</p>
                        <p class="title2">Какое-то описание урока</p>
                    </div>
                </div>
            </div>
            <div class="lesson">
                <div class="lesson-bg">
                    <a href="" class="lesson-emoji">👨🏻‍✈️<p>Начать урок</p></a>
                    <div class="lesson-info">
                        <p class="title1">Урок 2: Аэропорт</p>
                        <p class="title2">Какое-то описание урока</p>
                    </div>
                </div>
            </div>
            <div class="lesson">
                <div class="lesson-bg">
                    <a href="" class="lesson-emoji">☕<p>Начать урок</p></a>
                    <div class="lesson-info">
                        <p class="title1">Урок 3: Кофейня</p>
                        <p class="title2">Какое-то описание урока</p>
                    </div>
                </div>
            </div>
            <div class="lesson">
                <div class="lesson-bg">
                    <a href="" class="lesson-emoji">👋🏻<p>Начать урок</p></a>
                    <div class="lesson-info">
                        <p class="title1">Урок 1: Приветствие</p>
                        <p class="title2">Какое-то описание урока</p>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <h1><?= isset($_COOKIE["user"]) ? $_COOKIE["user"] : "re" ?></h1>
    <?php foreach ($lessons as $lesson): ?>
        <a href="lesson.php?lesson_id=<?= $lesson[0] ?>">lesson <?= $lesson[1] ?></a>
    <?php endforeach; ?>
</body>

</html>
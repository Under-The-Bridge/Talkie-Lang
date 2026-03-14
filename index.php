<?php
require "connection-db.php";

$langs = mysqli_fetch_all(mysqli_query($conn, "select * from langs"));

$selected_lang = isset($_GET["lang_id"]) ? $_GET["lang_id"] : 0;
$modules = mysqli_fetch_all(mysqli_query($conn, "select * from modules where lang_id = $selected_lang"));


$selected_module = isset($_GET["module_id"]) ? $_GET["module_id"] : $modules[0][0];
$lessons = mysqli_fetch_all(mysqli_query($conn, "select * from lessons where module_id = $selected_module"));
?>
<!DOCTYPE html>
<html lang="en">


<?php include "components/head.php"; ?>

<body>
    <?php include "components/header.php"; ?>
    <main>
        <aside>
            <form id="lang">
                <p class="title1 mb-3">Выберите язык</p>
                <select name="lang_id">
                    <?php foreach ($langs as $lang): ?>
                        <option value="<?= $lang[0] ?>" <?= ($lang[0] == $selected_lang) ? "selected" : "" ?>><?= $lang[1] ?>
                        </option>
                    <?php endforeach ?>
                </select>
            </form>
            <ul>
                <?php foreach ($modules as $module): ?>
                    <li><a href="?lang_id=<?= $selected_lang ?>&module_id=<?= $module[0] ?>" class="title3"><?= $module[1] ?></a></li>
                <?php endforeach ?>
            </ul>
        </aside>
        <div class="container">
            <?php foreach ($lessons as $lesson): ?>
                    <div class="lesson">
                        <div class="lesson-bg">
                            <a href="" class="lesson-emoji">👋🏻<p>Начать урок</p>
                            </a>
                            <div class="lesson-info">
                                <p class="title1"><?=$lesson[1]?></p>
                                <p class="title2"><?=$lesson[2]?></p>
                            </div>
                        </div>
                    </div>
            <?php endforeach ?>
            <!-- <div class="lesson">
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
            </div> -->
        </div>
    </main>
    <!-- <h1><?= isset($_COOKIE["user"]) ? $_COOKIE["user"] : "re" ?></h1>
    <?php foreach ($lessons as $lesson): ?>
        <a href="lesson.php?lesson_id=<?= $lesson[0] ?>">lesson <?= $lesson[1] ?></a>
    <?php endforeach; ?> -->
</body>
<script>
    let lang = document.querySelector("#lang>select");
    lang.addEventListener("change", () => {
        lang.parentNode.submit();
    })
</script>

</html>
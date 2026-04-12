<?php
require "connection-db.php";

$langs = mysqli_fetch_all(mysqli_query($conn, "select * from langs"));

$selected_lang = isset($_GET["lang_id"]) ? $_GET["lang_id"] : 1;
$modules = mysqli_fetch_all(mysqli_query($conn, "select * from modules where lang_id = $selected_lang"));


$selected_module = isset($_GET["module_id"]) ? $_GET["module_id"] : $modules[0][0];
$lessons = mysqli_fetch_all(mysqli_query($conn, "select * from lessons where module_id = $selected_module"));
?> 
<!DOCTYPE html>
<html lang="en">

<style>
    header>*{
        width: 100% !important;
        height: 100% !important;
    }
    .nav-bar{
        width: 100% !important;
        height: 100% !important;
        position: relative !important;
        div, div>div{
            display: flex;
            flex-direction: column;
        }
    }
    body{
        display: flex;
    }
</style>
<?php include "components/head.php"; ?>

<body>
    <?php include "components/header.php"; ?>
    <main>
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
        </div>
    </main>
</body>

</html>
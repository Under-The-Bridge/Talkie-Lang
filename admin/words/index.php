<?php
require "../../connection-db.php";

if (isset($_POST["add"])) {
    $name = trim($_POST["name"]);
    $transcription = trim($_POST["transcription"]);
    $translate = trim($_POST["translate"]);
    $lang = $_POST["lang"];
    $check = [$name, $transcription, $translate, $lang];
    foreach ($check as $c) {
        if (empty($c)) {
            echo "<script>
            alert('Пустые поля');
            back();
            </script>";
            break;
        }
    }
    $sql = "INSERT INTO `words`(`word_name`, `word_transcription`, `word_translate`, `lang_id`) VALUES ('$name','[$transcription]','$translate','$lang')";
    $query = mysqli_query($conn, $sql);
    if($query){
        echo "<script>
                alert('Добавлено');
                </script>";
    }else{
        echo "<script>
                alert('Ошибка');
                </script>";
    }
}

$filter = $_POST["filter"] ?? -1;
$sql = "select * from words join langs on langs.lang_id = words.lang_id where 1";
if ($filter != -1)
    $sql .= " and words.lang_id = $filter";
$words = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);
$langs = mysqli_fetch_all(mysqli_query($conn, "select * from langs"));


?>
<!DOCTYPE html>
<html lang="en">


<?php include "../../components/head.php"; ?>

<body>
    <?php include "../../components/header-admin.php"; ?>
    <main class="container">
        <form action="" method="post">
            <div class="mb-2">
                <label for="login" class="form-label">Слово</label>
                <input type="text" class="form-control" id="login" aria-describedby="login" name="name">
            </div>
            <div class="mb-2">
                <label for="email" class="form-label">Транскрипция</label>
                <input type="text" class="form-control" id="email" aria-describedby="email" name="transcription">
            </div>
            <div class="mb-2">
                <label for="password" class="form-label">Перевод</label>
                <input type="text" class="form-control" id="password" name="translate">
            </div>
            <select name="lang" id="lang" class="form-select mb-2">
                <?php foreach ($langs as $lang): ?>
                    <option value="<?= $lang[0] ?>">
                        <?= $lang[1] ?>
                    </option>
                <?php endforeach; ?>
            </select>
            <button name="add" type="submit" class="btn">Добавить</button>
        </form>
        <form action="" method="post">
            <label for="filter">Язык</label>
            <select name="filter" id="filter" class="form-select">
                <option value="-1" <?= $filter == -1 ? "selected" : "" ?>>Все</option>
                <?php foreach ($langs as $lang): ?>
                    <option value="<?= $lang[0] ?>" <?= $filter == $lang[0] ? "selected" : "" ?>><?= $lang[1] ?></option>
                <?php endforeach; ?>
            </select>
        </form>
        <div>
            <?php foreach ($words as $word): ?>
                <div class="word">
                    <p>Слово: <?= $word["word_name"] ?></p>
                    <p>Транскрипция:<?= $word["word_transcription"] ?></p>
                    <p>Перевод: <?= $word["word_translate"] ?></p>
                    <p>Язык: <?= $word["lang_name"] ?></p>
                </div>
            <?php endforeach; ?>
        </div>
    </main>
    <script>
        let filter = document.querySelector("#filter");
        filter.addEventListener("change", () => {
            filter.parentNode.submit();
        })
    </script>
</body>

</html>
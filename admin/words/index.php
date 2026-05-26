<?php
require "../../connection-db.php";

$filter = $_POST["filter"] ?? -1;
$sql = "select * from words join langs on langs.lang_id = words.lang_id where 1";
if ($filter != -1){
    $sql .= " and words.lang_id = $filter";
}
$sql .= " order by words.lang_id ASC, word_id DESC";
$words = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);
$langs = mysqli_fetch_all(mysqli_query($conn, "select * from langs"));


?>
<!DOCTYPE html>
<html lang="en">


<?php include "../../components/head.php"; ?>

<body>
    <?php include "../../components/header-admin.php"; ?>
    <main class="container">
        <form action="addWord.php" method="post">
            <div class="mb-3">
                <label for="login" class="form-label">Слово</label>
                <input type="text" class="form-control" id="login" aria-describedby="login" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Транскрипция</label>
                <input type="text" class="form-control" id="email" aria-describedby="email" name="transcription" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Перевод</label>
                <input type="text" class="form-control" id="password" name="translate" required>
            </div>
            <div class="mb-3">
                <label for="lang" class="form-label">Язык</label>
                <select name="lang" id="lang" class="form-select">
                    <?php foreach ($langs as $lang): ?>
                        <option value="<?= $lang[0] ?>">
                            <?= $lang[1] ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <button name="add" type="submit" class="btn">Добавить</button>
        </form>
        <form action="" method="post" class="mt-5">
            <label for="filter">Язык</label>
            <select name="filter" id="filter" class="form-select">
                <option value="-1" <?= $filter == -1 ? "selected" : "" ?>>Все</option>
                <?php foreach ($langs as $lang): ?>
                    <option value="<?= $lang[0] ?>" <?= $filter == $lang[0] ? "selected" : "" ?>><?= $lang[1] ?></option>
                <?php endforeach; ?>
            </select>
        </form>
        <!-- <div>
            <?php foreach ($words as $word): ?>
                <div class="word">
                    <p>Слово: <?= $word["word_name"] ?></p>
                    <p>Транскрипция:<?= $word["word_transcription"] ?></p>
                    <p>Перевод: <?= $word["word_translate"] ?></p>
                    <p>Язык: <?= $word["lang_name"] ?></p>
                </div>
            <?php endforeach; ?>
        </div> -->
        <table class="table table-striped-columns">
            <?php foreach ($words as $word): ?>
                <tr>
                    <td>Слово: <?= $word["word_name"] ?></td>
                    <td>Транскрипция:<?= $word["word_transcription"] ?></td>
                    <td>Перевод: <?= $word["word_translate"] ?></td>
                    <td>Язык: <?= $word["lang_name"] ?></td>
                    <td><a href="del.php?id=<?= $word["word_id"] ?>">Удалить</a></td>
                </tr>
            <?php endforeach; ?>
        </table>
    </main>
    <script>
        let filter = document.querySelector("#filter");
        filter.addEventListener("change", () => {
            filter.parentNode.submit();
        })
    </script>
</body>

</html>
<?php
require "../../connection-db.php";
$sql = "select * from words join langs on langs.lang_id = words.lang_id where words.lang_id = 1";
$words = mysqli_fetch_all(mysqli_query($conn, $sql));
$langs = mysqli_fetch_all(mysqli_query($conn, "select * from langs"));
$lessons = mysqli_fetch_all(mysqli_query($conn, "select * from lesson join langs on langs.lang_id = lesson.lesson_language order by lang_id ASC, lesson_id DESC"), MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../../components/head-admin.php"; ?>

<body>
    <?php include "../../components/header-admin.php"; ?>
    <main class="container">
        <form method="post" action="addLesson.php">
            <div class="mb-3">
                <label for="name" class="form-label">Название урока</label>
                <input type="text" class="form-control" id="name" aria-describedby="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="lang">Язык</label>
                <select name="lang" id="lang" class="form-select">
                    <?php foreach ($langs as $lang): ?>
                        <option value="<?= $lang[0] ?>"><?= $lang[1] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <button class="btn mb-3 add-word-btn">Добавить слово</button>
            <div class="words mb-3 border rounded-4 p-3">
            </div>
            <button type="submit" class="btn">Добавить</button>
        </form>
        <table class="table table-striped-columns mt-5">
            <?php foreach ($lessons as $lesson): ?>
                <tr>
                    <td><?= $lesson["lesson_name"] ?></td>
                    <td>Язык: <?= $lesson["lang_name"] ?></td>
                    <td>
                        <?php 
                        $ws = mysqli_fetch_all(mysqli_query($conn,"select * from lessons_words join words on words.word_id = lessons_words.word_id where lesson_id =".$lesson["lesson_id"]),MYSQLI_ASSOC);
                        foreach ($ws as $w):
                            echo $w["word_name"]." | ";
                        endforeach; ?>
                    </td>
                    <td>
                        <a href="del.php?id=<?= $lesson["lesson_id"] ?>">Удалить</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>
    </main>
    <script>
        let btn = document.querySelector(".add-word-btn");
        let count = 0;
        document.addEventListener('DOMContentLoaded', () => {
            getWords(lang.value);
            count++;
            let input_word = `
                <div class="mb-3 word-panel">
                    <label for="word" class="form-label">Слово</label>
                    <select name="word${count}" id="word" class="form-select mb-3 word">
                        <?php foreach ($words as $word): ?>
                            <option value="<?= $word[0] ?>"><?= $word[1] ?> | <?= $word[3] ?></option>
                        <?php endforeach; ?>
                    </select>
                    <button class="btn del-word-btn">Удалить слово</button>
                </div>`;
            document.querySelector(".words").innerHTML += input_word;
            let del_btn = document.querySelectorAll(".del-word-btn");
            del_btn.forEach(element => {
                element.addEventListener("click", (e) => {
                    e.preventDefault();
                    element.parentNode.remove();
                    count++;
                });
            });
        })
        btn.addEventListener("click", (e) => {
            getWords(lang.value);
            e.preventDefault();
            count++;
            let input_word = `
                <div class="mb-3 word-panel">
                    <label for="word" class="form-label">Слово</label>
                    <select name="word${count}" id="word" class="form-select mb-3 word">
                        <?php foreach ($words as $word): ?>
                            <option value="<?= $word[0] ?>"><?= $word[1] ?> | <?= $word[3] ?></option>
                        <?php endforeach; ?>
                    </select>
                    <button class="btn del-word-btn">Удалить слово</button>
                </div>`;
            document.querySelector(".words").innerHTML += input_word;
            let del_btn = document.querySelectorAll(".del-word-btn");
            del_btn.forEach(element => {
                element.addEventListener("click", (e) => {
                    e.preventDefault();
                    element.parentNode.remove();
                    count++;
                });
            });
        })
        let lang = document.querySelector("#lang");
        lang.addEventListener("click", () => {
            getWords(lang.value);
        })

        function getWords(id) {
            fetch("getWords.php?id=" + id)
                .then(res => res.text())
                .then(options => {
                    let selects = document.querySelectorAll(".word");
                    selects.forEach(select => {
                        select.innerHTML = options;
                    });

                });
        }
    </script>
</body>

</html>
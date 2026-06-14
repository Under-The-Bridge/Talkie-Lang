<?php
require "../../connection-db.php";

$sql = "select * from words join langs on langs.lang_id = words.lang_id where words.lang_id = 1";
$words = mysqli_fetch_all(mysqli_query($conn, $sql));
$langs = mysqli_fetch_all(mysqli_query($conn, "select DISTINCT lang_id, lang_name from langs join lesson on langs.lang_id = lesson.lesson_language"));
$lessons = mysqli_fetch_all(mysqli_query($conn, "select * from lesson join langs on langs.lang_id = lesson.lesson_language order by lang_id ASC, lesson_id DESC"), MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../../components/head-admin.php"; ?>

<body>
    <?php include "../../components/header-admin.php"; ?>
    <main class="container">

        <div class="dash-header">
            <div>
                <h1 class="dash-title">Уроки</h1>
                <p class="dash-subtitle">Управление уроками платформы</p>
            </div>
        </div>

        <div class="dash-card" style="margin: 0 10px 20px 10px;">
            <h2 class="dash-card-title">Добавить урок</h2>
            <form method="post" action="addLesson.php" class="lesson-form">
                <div class="lesson-form-row">
                    <div class="form-field">
                        <label for="name" class="field-label">Название урока</label>
                        <div class="search-box">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
                            <input type="text" id="name" name="name" placeholder="Например: Приветствия" required>
                        </div>
                    </div>
                    <div class="form-field form-field-lang">
                        <label for="lang" class="field-label">Язык</label>
                        <select name="lang" id="lang" class="lang-select">
                            <?php foreach ($langs as $lang): ?>
                                <option value="<?= $lang[0] ?>"><?= $lang[1] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>

                <div class="words-block">
                    <div class="words-block-head">
                        <span class="field-label">Слова урока</span>
                        <button type="button" class="add-word-btn">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                            Добавить слово
                        </button>
                    </div>
                    <div class="words">
                    </div>
                </div>

                <button type="submit" class="search-btn submit-lesson-btn">Добавить урок</button>
            </form>
        </div>

        <div class="dash-card" style="margin: 0 10px 30px 10px;">
            <h2 class="dash-card-title">Список уроков</h2>

            <?php if (empty($lessons)): ?>
                <div class="no-results">
                    <div class="icon">
                        <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="var(--gray-color)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
                    </div>
                    <p>Уроков пока нет</p>
                </div>
            <?php else: ?>
                <div class="table-scroll">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>Урок</th>
                                <th>Язык</th>
                                <th>Слова</th>
                                <th>Действие</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($lessons as $lesson): ?>
                                <tr>
                                    <td style="font-weight: 800; color: #222;"><?= htmlspecialchars($lesson["lesson_name"]) ?></td>
                                    <td>
                                        <span class="role-badge role-user"><?= htmlspecialchars($lesson["lang_name"]) ?></span>
                                    </td>
                                    <td class="muted-cell" style="max-width: 320px; white-space: normal;">
                                        <?php
                                        $ws = mysqli_fetch_all(mysqli_query($conn, "select * from lessons_words join words on words.word_id = lessons_words.word_id where lesson_id =" . $lesson["lesson_id"]), MYSQLI_ASSOC);
                                        if (empty($ws)) {
                                            echo '—';
                                        } else {
                                            $names = array_map(fn($w) => htmlspecialchars($w["word_name"]), $ws);
                                            echo implode(', ', $names);
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <a href="del.php?id=<?= $lesson["lesson_id"] ?>" class="ban-btn" onclick="return confirm('Удалить урок «<?= htmlspecialchars(addslashes($lesson["lesson_name"])) ?>»?')">Удалить</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>

    </main>
    <script>
        let btn = document.querySelector(".add-word-btn");
        let count = 0;

        function addWordPanel() {
            count++;
            let input_word = `
                <div class="word-panel">
                    <select name="word${count}" class="lang-select word">
                        <?php foreach ($words as $word): ?>
                            <option value="<?= $word[0] ?>"><?= $word[1] ?> | <?= $word[3] ?></option>
                        <?php endforeach; ?>
                    </select>
                    <button type="button" class="del-word-btn" title="Удалить слово">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
                    </button>
                </div>`;
            document.querySelector(".words").insertAdjacentHTML('beforeend', input_word);

            let del_btns = document.querySelectorAll(".del-word-btn");
            del_btns.forEach(element => {
                element.onclick = (e) => {
                    e.preventDefault();
                    element.parentNode.remove();
                };
            });
        }

        document.addEventListener('DOMContentLoaded', () => {
            getWords(lang.value);
            addWordPanel();
        });

        btn.addEventListener("click", (e) => {
            e.preventDefault();
            getWords(lang.value);
            addWordPanel();
        });

        let lang = document.querySelector("#lang");
        lang.addEventListener("change", () => {
            getWords(lang.value);
        });

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
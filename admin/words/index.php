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


<?php include "../../components/head-admin.php"; ?>

<body>
    <?php include "../../components/header-admin.php"; ?>
    <main class="container">

        <div class="dash-header">
            <div>
                <h1 class="dash-title">Слова</h1>
                <p class="dash-subtitle">Управление словарём платформы</p>
            </div>
        </div>

        <div class="dash-card" style="margin: 0 10px 20px 10px;">
            <h2 class="dash-card-title">Добавить слово</h2>
            <form action="addWord.php" method="post" class="word-form">
                <div class="word-form-row">
                    <div class="form-field">
                        <label for="name" class="field-label">Слово</label>
                        <div class="search-box">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="4 7 4 4 20 4 20 7"/><line x1="9" y1="20" x2="15" y2="20"/><line x1="12" y1="4" x2="12" y2="20"/></svg>
                            <input type="text" id="name" name="name" placeholder="Например: Hello" required>
                        </div>
                    </div>
                    <div class="form-field">
                        <label for="transcription" class="field-label">Транскрипция</label>
                        <div class="search-box">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z"/><path d="M19 10v2a7 7 0 0 1-14 0v-2"/><line x1="12" y1="19" x2="12" y2="23"/></svg>
                            <input type="text" id="transcription" name="transcription" placeholder="Например: [həˈloʊ]" required>
                        </div>
                    </div>
                    <div class="form-field">
                        <label for="translate" class="field-label">Перевод</label>
                        <div class="search-box">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
                            <input type="text" id="translate" name="translate" placeholder="Например: Привет" required>
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
                <button name="add" type="submit" class="search-btn submit-lesson-btn">Добавить слово</button>
            </form>
        </div>

        <div class="dash-card" style="margin: 0 10px 30px 10px;">
            <div class="words-list-head">
                <h2 class="dash-card-title" style="margin-bottom: 0 !important;">Список слов</h2>
                <form action="" method="post" class="filter-form">
                    <select name="filter" id="filter" class="lang-select">
                        <option value="-1" <?= $filter == -1 ? "selected" : "" ?>>Все языки</option>
                        <?php foreach ($langs as $lang): ?>
                            <option value="<?= $lang[0] ?>" <?= $filter == $lang[0] ? "selected" : "" ?>><?= $lang[1] ?></option>
                        <?php endforeach; ?>
                    </select>
                </form>
            </div>

            <?php if (empty($words)): ?>
                <div class="no-results">
                    <div class="icon">
                        <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="var(--gray-color)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="4 7 4 4 20 4 20 7"/><line x1="9" y1="20" x2="15" y2="20"/><line x1="12" y1="4" x2="12" y2="20"/></svg>
                    </div>
                    <p>Слов пока нет</p>
                </div>
            <?php else: ?>
                <div class="table-scroll">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>Слово</th>
                                <th>Транскрипция</th>
                                <th>Перевод</th>
                                <th>Язык</th>
                                <th>Действие</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($words as $word): ?>
                                <tr>
                                    <td style="font-weight: 800; color: #222;"><?= htmlspecialchars($word["word_name"]) ?></td>
                                    <td class="muted-cell"><?= htmlspecialchars($word["word_transcription"]) ?></td>
                                    <td><?= htmlspecialchars($word["word_translate"]) ?></td>
                                    <td>
                                        <span class="role-badge role-user"><?= htmlspecialchars($word["lang_name"]) ?></span>
                                    </td>
                                    <td>
                                        <a href="del.php?id=<?= $word["word_id"] ?>" class="ban-btn" onclick="return confirm('Удалить слово «<?= htmlspecialchars(addslashes($word["word_name"])) ?>»?')">Удалить</a>
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
        let filter = document.querySelector("#filter");
        filter.addEventListener("change", () => {
            filter.parentNode.submit();
        })
    </script>
</body>

</html>
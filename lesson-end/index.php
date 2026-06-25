<?php
require "../connection-db.php";
$xp = 1000;

$mistakes = $_SESSION["mistakes"] ?? 0;
$prog = $_SESSION["progress"] ?? 0;
$c = $_SESSION["lesson_count"];
$time = $_SESSION["lesson_time"];
$lesson_id = $_GET["id"] ?? 1;
if (!isset($_SESSION["current_time"])) {
    $_SESSION["current_time"] = time();
}
$current_time = $_SESSION["current_time"];

if (!isset($_SESSION["fail"])) {
    $xp = $xp - ($current_time - $time) - ($mistakes * 150);
    $id = $_SESSION["id"];

    $lang = mysqli_fetch_array(mysqli_query($conn, "select lesson_language from lesson where lesson_id = $lesson_id"))[0];

    $nums = mysqli_num_rows(mysqli_query($conn, "select * from completed_lessons where lesson_id = $lesson_id and user_id = $id"));

    $count = mysqli_fetch_assoc(mysqli_query($conn, "select * from completed_lessons where user_id = $id and lesson_id = $lesson_id"))["count"];
    if ($count == 3 && $c == 3) {
        $lessons_count = mysqli_fetch_array(mysqli_query($conn, "SELECT COUNT(*) FROM `lesson` WHERE lesson_id <= $lesson_id and lesson_language = $lang"))[0];
        $les_id = mysqli_fetch_array(mysqli_query($conn, "SELECT * from lesson where lesson_language = $lang LIMIT 1 OFFSET $lessons_count"))[0];
        mysqli_query($conn, "INSERT INTO `completed_lessons`(`user_id`, `lesson_id`) VALUES ('$id','$les_id')");
        $progress = mysqli_fetch_array(mysqli_query($conn, "select progress from user_lang_progress where lang_id = $lang and user_id = $id"))[0];
        $progress++;
        mysqli_query($conn, "UPDATE `user_lang_progress` SET `progress`='$progress' where lang_id = $lang and user_id = $id");
        $count++;
        $sql = "UPDATE `completed_lessons` SET `count`='$count' where user_id = $id and lesson_id = $lesson_id";
        $query = mysqli_query($conn, $sql);
    } else if ($c == $count) {
        $count++;
        $sql = "UPDATE `completed_lessons` SET `count`='$count' where user_id = $id and lesson_id = $lesson_id";
        $query = mysqli_query($conn, $sql);
    }
    $exp = $user["user_weekly_xp"] + $xp;
    mysqli_query($conn, "UPDATE `users` SET `user_weekly_xp`='$exp' WHERE user_id = $id");

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
}
?>
<!DOCTYPE html>
<html lang="en">

<?php include "../components/head.php"; ?>

<body style="background:white">
    <?php if (!isset($_SESSION["fail"])): ?>
        <main class="results-container">
            <div class="stats-card">
                <div class="stats-header">
                    <h4>Урок завершён</h4>
                    <a href="/?lang=<?= $_SESSION["lang"] ?>" class="back-link">← Вернуться на главную</a>
                </div>
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-label">⏱ Время</div>
                        <div class="stat-value"><?= date("i:s", $current_time - $time) ?></div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">Ошибки</div>
                        <div class="stat-value mistakes"><?= $mistakes ?></div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">Опыт</div>
                        <div class="stat-value xp">+<?= $xp ?> xp</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">Решено</div>
                        <div class="stat-value score"><?= $prog - $mistakes ?>/<?= $prog ?></div>
                    </div>
                </div>
            </div>

            <div class="section-title">Детализация ответов</div>
            <div class="answers-grid">
                <?php foreach ($all as $al):
                    $l = $al[0][1] ?? false ?>
                    <? if ($l): ?>
                        <div class="answer-card">
                            <div class="answer-header">
                                <span>Список слов</span>
                                <span class="badge-status badge-correct">✔ Освоено</span>
                            </div>
                            <div class="answer-content">
                                <div class="pair-row">
                                    <span class="pair-label">Тема:</span>
                                    <span class="pair-value"><?= htmlspecialchars($al[0]["0"]) ?></span>
                                </div>
                                <br>
                            </div>
                        </div>
                    <?php else: ?>
                        <?php
                        $isCorrect = ($al[0]["word_id"] == $al[1]["word_id"]);
                        $badgeClass = $isCorrect ? "badge-correct" : "badge-wrong";
                        $badgeText = $isCorrect ? "✓ Верно" : "✗ Ошибка";
                        ?>
                        <div class="answer-card">
                            <div class="answer-header">
                                <span class="badge-status <?= $badgeClass ?>"><?= $badgeText ?></span>
                            </div>
                            <div class="answer-content">
                                <div class="word-pair">
                                    <?php if ($al[2] == "toRu"): ?>
                                        <div class="pair-row">
                                            <span class="pair-label">Слово:</span>
                                            <span class="pair-value"><?= htmlspecialchars($al[0]["word_name"]) ?></span>
                                        </div>
                                        <div class="pair-row">
                                            <span class="pair-label">Ваш ответ:</span>
                                            <span class="pair-value"><?= htmlspecialchars($al[1]["word_translate"]) ?></span>
                                        </div>
                                        <?php if (!$isCorrect): ?>
                                            <div class="correct-answer">
                                                ✔ Правильно: <?= htmlspecialchars($al[0]["word_translate"]) ?>
                                            </div>
                                        <?php endif; ?>
                                    <?php elseif ($al[2] == "toEn"): ?>
                                        <div class="pair-row">
                                            <span class="pair-label">Слово:</span>
                                            <span class="pair-value"><?= htmlspecialchars($al[0]["word_translate"]) ?></span>
                                        </div>
                                        <div class="pair-row">
                                            <span class="pair-label">Ваш ответ:</span>
                                            <span class="pair-value"><?= htmlspecialchars($al[1]["word_name"]) ?></span>
                                        </div>
                                        <?php if (!$isCorrect): ?>
                                            <div class="correct-answer">
                                                ✔ Правильно: <?= htmlspecialchars($al[0]["word_name"]) ?>
                                            </div>
                                        <?php endif; ?>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                <?php endforeach; ?>
            </div>
        </main>
    <?php else: ?>
        <main class="results-container">
            <div class="stats-card">
                <div class="stats-header">
                    <h4>Урок не пройден :(</h4>
                    <div>
                        <a href="/?lang=<?= $_SESSION["lang"] ?>" class="back-link">← Вернуться на главную</a>
                        <a href="/lesson/?id=<?= $lesson_id ?>&c=<? $c ?>" class="back-link restart">Попробовать снова</a>
                    </div>
                </div>
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-label">⏱ Время</div>
                        <div class="stat-value"><?= date("i:s", $current_time - $time) ?></div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">Ошибки</div>
                        <div class="stat-value mistakes"><?= $mistakes ?></div>
                    </div>
                </div>
            </div>
        </main>
    <?php endif; ?>
</body>

</html>
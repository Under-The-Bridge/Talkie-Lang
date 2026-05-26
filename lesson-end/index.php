<?php
session_start();
//http://talkie-lang/en/lesson/index.php?id=1&prog=9&mistakes=5
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

    $lang = mysqli_fetch_array(mysqli_query($conn, "select lesson_language from lesson"))[0];

    $nums = mysqli_num_rows(mysqli_query($conn, "select * from completed_lessons where lesson_id = $lesson_id and user_id = $id"));

    $count = mysqli_fetch_assoc(mysqli_query($conn, "select * from completed_lessons where user_id = $id and lesson_id = $lesson_id"))["count"];
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

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <script src="../../assets/js/bootstrap.bundle.min.js" async defer></script>
    <title>Результаты урока — Talkie Lang</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,600;14..32,700;14..32,800;14..32,900&display=swap"
        rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(145deg, #f8f9fc 0%, #f1f3f8 100%);
            font-family: 'Inter', sans-serif;
            padding: 1.5rem;
            min-height: 100vh;
        }

        .results-container {
            max-width: 1400px;
            margin: 0 auto;
            animation: fadeSlideUp 0.5s cubic-bezier(0.2, 0.9, 0.4, 1.1) forwards;
        }

        @keyframes fadeSlideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Карточка результатов */
        .stats-card {
            background: white;
            border-radius: 2rem;
            padding: 2rem 2rem 1.8rem 2rem;
            margin-bottom: 2.5rem;
            box-shadow: 0 20px 35px -12px rgba(0, 0, 0, 0.08), 0 1px 2px rgba(0, 0, 0, 0.02);
            transition: transform 0.2s, box-shadow 0.2s;
            border: 1px solid rgba(224, 131, 77, 0.15);
        }

        .stats-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 1.8rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f0eae4;
        }

        .stats-header h4 {
            font-size: 1.8rem;
            font-weight: 800;
            background: linear-gradient(135deg, #e0834d, #c06b3a);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            margin: 0;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
            font-weight: 600;
            color: #e0834d;
            background: #fff5ef;
            padding: 0.6rem 1.2rem;
            border-radius: 40px;
            transition: all 0.2s;
            font-size: 0.9rem;
        }

        .back-link.restart {
            background: #e0834d;
            color: #fff5ef;
        }

        .back-link:hover {
            background: #e0834d;
            color: white;
            transform: translateX(-4px);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 1.5rem;
            margin-top: 1rem;
        }

        .stat-item {
            text-align: center;
            padding: 1rem;
            background: #fefaf7;
            border-radius: 1.5rem;
            transition: all 0.2s;
        }

        .stat-label {
            font-size: 0.85rem;
            text-transform: uppercase;
            font-weight: 700;
            letter-spacing: 1px;
            color: #a38a7a;
            margin-bottom: 0.6rem;
        }

        .stat-value {
            font-size: 2.4rem;
            font-weight: 800;
            color: #2c3e4e;
            line-height: 1;
        }

        .stat-value.xp {
            background: linear-gradient(135deg, #4de06d, #2db64b);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
        }

        .stat-value.mistakes {
            color: #e0524d;
        }

        .stat-value.score {
            color: #e0834d;
        }

        /* Заголовок результатов */
        .section-title {
            font-size: 1.6rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: #2c3e4e;
        }

        .section-title:before {
            font-size: 1.8rem;
        }

        /* Сетка ответов */
        .answers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 1.5rem;
        }

        .answer-card {
            background: white;
            border-radius: 1.5rem;
            overflow: hidden;
            box-shadow: 0 8px 20px -6px rgba(0, 0, 0, 0.05);
            transition: all 0.25s;
            border: 1px solid #f0eae4;
        }

        .answer-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 30px -12px rgba(0, 0, 0, 0.12);
        }

        .answer-header {
            padding: 1rem;
            font-weight: 700;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            background: #fefaf7;
            border-bottom: 1px solid #f0eae4;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .badge-status {
            padding: 0.25rem 0.8rem;
            border-radius: 40px;
            font-size: 0.7rem;
            font-weight: 800;
        }

        .badge-correct {
            background: #e8f5e9;
            color: #2e7d32;
        }

        .badge-wrong {
            background: #ffebee;
            color: #c62828;
        }

        .answer-content {
            padding: 1.2rem;
        }

        .word-pair {
            display: flex;
            flex-direction: column;
            gap: 0.8rem;
        }

        .pair-row {
            display: flex;
            align-items: baseline;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .pair-label {
            font-weight: 700;
            color: #a38a7a;
            min-width: 70px;
            font-size: 0.85rem;
        }

        .pair-value {
            font-weight: 600;
            color: #2c3e4e;
            word-break: break-word;
            flex: 1;
        }

        .correct-answer {
            margin-top: 0.6rem;
            padding-top: 0.6rem;
            border-top: 1px dashed #e0d6ce;
            font-size: 0.85rem;
            color: #4de06d;
            font-weight: 600;
        }

        hr {
            margin: 0.75rem 0;
            border-color: #f0eae4;
        }

        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }

            .stats-card {
                padding: 1.5rem;
            }

            .stat-value {
                font-size: 1.8rem;
            }

            .answers-grid {
                grid-template-columns: 1fr;
            }

            .section-title {
                font-size: 1.3rem;
            }
        }
    </style>
</head>

<body>
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
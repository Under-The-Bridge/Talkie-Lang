<?php
session_start();
require "../connection-db.php";

if (!isset($_SESSION["id"])) {
    echo "<script>alert('Войдите в профиль'); location.href = '/welcome/';</script>";
    exit;
}

$id = $_SESSION["id"];
$user = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM users WHERE user_id = $id"));
$progresses = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM user_lang_progress JOIN langs ON langs.lang_id = user_lang_progress.lang_id WHERE user_id = $id"), MYSQLI_ASSOC);

// Подсчет общей статистики
$totalLessons = 0;
$totalProgress = 0;
foreach ($progresses as $progress) {
    $lessonsCount = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) as count FROM lesson WHERE lesson_language = " . $progress["lang_id"]))['count'];
    $totalLessons += $lessonsCount;
    $totalProgress += $progress['progress'];
}
$overallProgress = $totalLessons > 0 ? round(100 * $totalProgress / $totalLessons) : 0;
?>

<!DOCTYPE html>
<html lang="ru">
<?php include "../components/head.php"; ?>

<body>
    <?php include "../components/header.php"; ?>
    
    <main class="container">
        <!-- Welcome Banner -->
        <div class="welcome-banner">
            <div class="welcome-content">
                <div class="welcome-text">
                    <h1>С возвращением, <?= htmlspecialchars($user["user_login"]) ?>!</h1>
                    <p>Продолжай изучать языки и достигать новых вершин</p>
                </div>
                <div class="welcome-stats">
                    <div class="stat-card">
                        <div class="stat-value"><?= count($progresses) ?></div>
                        <div class="stat-label">Изучаемых языков</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-value"><?= $overallProgress ?>%</div>
                        <div class="stat-label">Общий прогресс</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Languages Grid -->
        <div class="languages-section">
            <div class="section-header">
                <h2>Мои курсы</h2>
            </div>
            
            <div class="languages-grid">
                <?php foreach ($progresses as $progress):
                    $lessonsCount = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) as count FROM lesson WHERE lesson_language = " . $progress["lang_id"]))['count'];
                    $percent = $lessonsCount > 0 ? round(100 * $progress['progress'] / $lessonsCount) : 0;
                ?>
                <div class="lang-card">
                    <div class="lang-card-header">
                        <h3 class="lang-name"><?= $progress["lang_name"] ?></h3>
                    </div>
                    <div class="lang-card-body">
                        <div class="progress-stats">
                            <div class="progress-percent"><?= $percent ?>%</div>
                            <div class="progress-bar-custom">
                                <div class="progress-fill" style="width: <?= $percent ?>%;"></div>
                            </div>
                            <div class="progress-details">
                                <span>Пройдено: <?= $progress['progress'] ?> из <?= $lessonsCount ?> разделов</span>
                            </div>
                        </div>
                        <a href="/?lang=<?= $progress["lang_id"] ?>" class="continue-btn">
                            Продолжить обучение →
                        </a>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </main>
</body>
</html>
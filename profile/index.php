<?php
session_start();
require "../connection-db.php";

if (!isset($_SESSION["id"])) {
    echo "<script>alert('Войдите в профиль'); location.href = '/welcome/';</script>";
    exit;
}

$myAcc = true;
$id = $_SESSION["id"];
$sql = "SELECT * FROM users WHERE user_id = $id";
if (isset($_GET["user"])) {
    $name = $_GET["user"];
    $id = mysqli_fetch_assoc(mysqli_query($conn, "select * from users join leagues on leagues.league_id = users.user_league where user_login = '$name'"))["user_id"];
    $myAcc = false;
    $sql = "SELECT * FROM users WHERE user_login = '$name'";
}
$user = mysqli_fetch_assoc(mysqli_query($conn, $sql));
$progresses = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM user_lang_progress JOIN langs ON langs.lang_id = user_lang_progress.lang_id WHERE user_id = $id"), MYSQLI_ASSOC);

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
        <div class="welcome-banner <?php if (!$myAcc)
            echo "d-flex pb-4" ?>">
                <div class="profile-part">
                    <div class="pfp">
                    <?php if ($myAcc): ?>
                        <div class="dropdown">
                            <?php if (empty($user["user_pfp"])): ?>
                                <div class="empty-pfp" data-bs-toggle="dropdown"><?= $user["user_login"][0] ?></div>
                            <?php else: ?>
                                <img class="pfp" src="/images/<?= $user["user_pfp"] ?>" alt="">
                            <?php endif; ?>
                            <ul class="dropdown-menu">
                                <li>
                                    <form action="edit.php" method="post" enctype="multipart/form-data">
                                        <label for="pfp" class="dropdown-item">Добавить фото</label>
                                        <input type="file" class="dropdown-item" id="pfp" name="pfp" hidden>
                                    </form>
                                </li>
                                <li><a class="dropdown-item" href="edit.php?clear">Очистить аватарку</a></li>
                            </ul>
                        </div>
                    <?php else: ?>
                        <?php if (empty($user["user_pfp"])): ?>
                            <div class="empty-pfp" data-bs-toggle="dropdown"><?= $user["user_login"][0] ?></div>
                        <?php else: ?>
                            <img class="pfp" src="/images/<?= $user["user_pfp"] ?>" alt="">
                        <?php endif; ?>
                    <?php endif; ?>
                </div>
                <div class="edit"></div>
            </div>
            <div class="welcome-content" <?php if (!$myAcc)
                echo "style='flex-direction:column; justify-content:center; gap:0px; align-items:start;'" ?>>
                    <div class="welcome-text">
                    <?php if ($myAcc): ?>
                        <h1>С возвращением, <?= htmlspecialchars($user["user_login"]) ?>!</h1>
                        <p>Продолжай изучать языки и достигать новых вершин</p>
                    <?php else: ?>
                        <h1>Пользователь, <?= htmlspecialchars($user["user_login"]) ?></h1>
                    <?php endif; ?>
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

        <div class="languages-section">
            <div class="section-header">
                <?php if ($myAcc): ?>
                    <h2>Мои курсы</h2>
                <?php else: ?>
                    <h2>Курсы</h2>
                <?php endif; ?>
            </div>

            <?php if(count($progresses) != 0):?>
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
                            <?php if ($myAcc): ?>
                                <a href="/?lang=<?= $progress["lang_id"] ?>" class="continue-btn">
                                    Продолжить обучение →
                                </a>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
            <?php else:?>
                <h5>Похоже этот пользователь ещё не начал изучать языки :(</h5>
            <?php endif;?>
        </div>
    </main>
    <script>
        let input = document.querySelector("#pfp");
        input.addEventListener('input', () => {
            input.parentNode.submit();
        });
    </script>
</body>

</html>
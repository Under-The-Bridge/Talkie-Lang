<?php
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

$success_message = '';
$error_message = '';
if (isset($_GET['success'])) {
    $success_message = htmlspecialchars($_GET['success']);
}
if (isset($_GET['error'])) {
    $error_message = htmlspecialchars($_GET['error']);
}
?>

<!DOCTYPE html>
<html lang="ru">
<?php include "../components/head.php"; ?>

<body>
    <?php include "../components/header.php"; ?>
    <main class="container">
        <?php if ($success_message): ?>
            <div class="alert alert-success" style="background: #d4edda; color: #155724; padding: 12px 20px; border-radius: 12px; margin-bottom: 20px; border-left: 4px solid #28a745;">
                <?= $success_message ?>
            </div>
        <?php endif; ?>
        <?php if ($error_message): ?>
            <div class="alert alert-error" style="background: #f8d7da; color: #721c24; padding: 12px 20px; border-radius: 12px; margin-bottom: 20px; border-left: 4px solid #dc3545;">
                <?= $error_message ?>
            </div>
        <?php endif; ?>

        <div class="profile-layout">
            <!-- Левая часть - Редактирование профиля -->
            <?php if ($myAcc): ?>
                <div class="profile-left">
                    <div class="edit-block">
                        <div class="edit-header">
                            <h3>Редактирование профиля</h3>
                        </div>

                        <!-- Аватарка -->
                        <div class="avatar-section">
                            <div class="avatar-wrapper">
                                <?php if (empty($user["user_pfp"])): ?>
                                    <div class="avatar-placeholder"><?= $user["user_login"][0] ?></div>
                                <?php else: ?>
                                    <img class="avatar-image" src="/images/<?= $user["user_pfp"] ?>" alt="Аватар">
                                <?php endif; ?>
                            </div>
                            <div class="avatar-actions">
                                <form action="edit.php" method="post" enctype="multipart/form-data" class="avatar-form">
                                    <label for="pfp" class="avatar-btn avatar-upload">Загрузить фото</label>
                                    <input type="file" id="pfp" name="pfp" hidden>
                                </form>
                                <a href="edit.php?clear" class="avatar-btn avatar-clear">Очистить</a>
                            </div>
                        </div>

                        <!-- Формы редактирования -->
                        <div class="edit-forms">
                            <div class="edit-section">
                                <div class="edit-section-header">
                                    <h4>Смена логина</h4>
                                </div>
                                <form action="profile-update.php" method="post" class="inline-form">
                                    <input type="text" name="login" placeholder="Новый логин" value="<?= htmlspecialchars($user["user_login"]) ?>">
                                    <button name="btnLogin" type="submit" class="btn-edit">Сохранить</button>
                                </form>
                            </div>

                            <div class="edit-section">
                                <div class="edit-section-header">
                                    <h4>Смена email</h4>
                                </div>
                                <form action="profile-update.php" method="post" class="inline-form">
                                    <input type="email" name="email" placeholder="Новый email" value="<?= htmlspecialchars($user["user_email"]) ?>">
                                    <button name="btnEmail" type="submit" class="btn-edit">Сохранить</button>
                                </form>
                            </div>

                            <div class="edit-section">
                                <div class="edit-section-header">
                                    <h4>Смена пароля</h4>
                                </div>
                                <form action="profile-update.php" method="post" class="inline-form password-form">
                                    <input type="password" name="currentPassword" placeholder="Текущий пароль">
                                    <input type="password" name="newPassword" placeholder="Новый пароль">
                                    <button name="btnPassword" type="submit" class="btn-edit">Сохранить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            <?php else: ?>
                <div class="profile-left profile-left-guest">
                    <div class="edit-block guest-block">
                        <div class="avatar-section">
                            <div class="avatar-wrapper">
                                <?php if (empty($user["user_pfp"])): ?>
                                    <div class="avatar-placeholder"><?= $user["user_login"][0] ?></div>
                                <?php else: ?>
                                    <img class="avatar-image" src="/images/<?= $user["user_pfp"] ?>" alt="Аватар">
                                <?php endif; ?>
                            </div>
                            <h3 class="guest-name"><?= htmlspecialchars($user["user_login"]) ?></h3>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <!-- Правая часть - Приветствие и статистика -->
            <div class="profile-right">
                <div class="welcome-banner">
                    <!-- Декоративные фигуры фона -->
                    <div class="banner-orb banner-orb-1"></div>
                    <div class="banner-orb banner-orb-2"></div>
                    <div class="banner-orb banner-orb-3"></div>

                    <div class="welcome-content">
                        <div class="welcome-text">
                            <?php if ($myAcc): ?>
                                <h1>С возвращением,<br><span class="welcome-username"><?= htmlspecialchars($user["user_login"]) ?></span></h1>
                                <p>Продолжай изучать языки и достигать новых вершин</p>
                            <?php else: ?>
                                <h1>Профиль<br><span class="welcome-username"><?= htmlspecialchars($user["user_login"]) ?></span></h1>
                            <?php endif; ?>
                        </div>

                        <div class="welcome-right">
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
                            <?php if ($overallProgress > 0): ?>
                            <div class="banner-progress">
                                <div class="banner-progress-label">
                                    <span>Общий прогресс</span>
                                    <span><?= $overallProgress ?>%</span>
                                </div>
                                <div class="banner-progress-bar">
                                    <div class="banner-progress-fill" style="width: <?= $overallProgress ?>%"></div>
                                </div>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Курсы -->
        <div class="languages-section">
            <div class="section-header">
                <?php if ($myAcc): ?>
                    <h2>Мои курсы</h2>
                <?php else: ?>
                    <h2>Курсы</h2>
                <?php endif; ?>
            </div>

            <?php if (count($progresses) != 0): ?>
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
                                        <div class="progress-fill" style="width: <?= $percent ?>%; background: var(--green-color);"></div>
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
            <?php else: ?>
                <div class="empty-state">
                    <div class="empty-icon">📚</div>
                    <h3>Еще нет курсов</h3>
                    <p>Начните изучать новый язык прямо сейчас!</p>
                    <?php if ($myAcc): ?>
                        <a href="/" class="start-btn">Выбрать язык</a>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
        </div>
    </main>

    <script>
        let input = document.querySelector("#pfp");
        if (input) {
            input.addEventListener('change', () => {
                input.parentNode.submit();
            });
        }

        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(alert => {
            setTimeout(() => {
                alert.style.opacity = '0';
                setTimeout(() => {
                    if (alert.parentNode) alert.remove();
                }, 300);
            }, 5000);
        });

        const forms = document.querySelectorAll('.inline-form');
        forms.forEach(form => {
            form.addEventListener('submit', (e) => {
                const loginInput = form.querySelector('input[name="login"]');
                const emailInput = form.querySelector('input[name="email"]');
                const currentPass = form.querySelector('input[name="currentPassword"]');
                const newPass = form.querySelector('input[name="newPassword"]');

                if (loginInput) {
                    const val = loginInput.value.trim();
                    if (!val) {
                        e.preventDefault();
                        alert('Введите новый логин');
                    } else if (val.length < 3 || val.length > 20) {
                        e.preventDefault();
                        alert('Логин должен быть от 3 до 20 символов');
                    } else if (!/^[a-zA-Z0-9_-]+$/.test(val)) {
                        e.preventDefault();
                        alert('Логин может содержать только буквы, цифры, _ и -');
                    }
                }

                if (emailInput) {
                    const val = emailInput.value.trim();
                    if (!val) {
                        e.preventDefault();
                        alert('Введите новый email');
                    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(val)) {
                        e.preventDefault();
                        alert('Введите корректный email');
                    }
                }

                if (currentPass && newPass) {
                    if (!currentPass.value || !newPass.value) {
                        e.preventDefault();
                        alert('Заполните все поля');
                    } else if (newPass.value.length < 6) {
                        e.preventDefault();
                        alert('Новый пароль должен быть минимум 6 символов');
                    }
                }
            });
        });
    </script>
</body>

</html>
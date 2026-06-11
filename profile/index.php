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

// Обработка сообщений об успехе/ошибке
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
        <!-- Баннер сообщений -->
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

        <div class="welcome-banner <?php if (!$myAcc) echo "d-flex pb-4" ?>">
            <div class="profile-info-wrapper">
                <div class="profile-part d-flex">
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
                                <div class="empty-pfp"><?= $user["user_login"][0] ?></div>
                            <?php else: ?>
                                <img class="pfp" src="/images/<?= $user["user_pfp"] ?>" alt="">
                            <?php endif; ?>
                        <?php endif; ?>
                    </div>
                    
                    <?php if ($myAcc): ?>
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
                    <?php endif; ?>
                </div>
                <div class="welcome-content" <?php if (!$myAcc) echo "style='flex-direction:column; justify-content:center; gap:0px; align-items:start;'" ?>>
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
        </div>

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

    <style>
        .profile-info-wrapper {
            width: 100%;
        }

        .profile-part {
            display: flex;
            gap: 30px;
            align-items: flex-start;
            padding: 20px 40px 0px 40px;
            border-radius: 24px 24px 0px 0px;
        }

        .edit-forms {
            flex: 1;
            background: rgba(255, 255, 255, 0.95);
            padding: 15px 20px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .edit-section {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e0e0e0;
        }

        .edit-section:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }

        .edit-section-header {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 10px;
        }

        .edit-icon {
            font-size: 16px;
        }

        .edit-section h4 {
            margin: 0;
            font-size: 14px;
            color: var(--main-color);
            font-weight: 700;
        }

        .inline-form {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }

        .inline-form input {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 13px;
            flex: 1;
            min-width: 140px;
            font-family: inherit;
            transition: all 0.2s;
        }

        .inline-form input:focus {
            outline: none;
            border-color: var(--main-color);
            box-shadow: 0 0 0 3px rgba(224, 131, 77, 0.1);
        }

        .btn-edit {
            background: var(--main-color);
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.2s ease;
            box-shadow: 0 3px 0 var(--main-color-shadow);
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            background: var(--main-color-light);
            box-shadow: 0 5px 0 var(--main-color-shadow);
        }

        .btn-edit:active {
            transform: translateY(2px);
            box-shadow: 0 1px 0 var(--main-color-shadow);
        }

        .password-form input {
            min-width: 120px;
        }

        /* Адаптивность */
        @media (max-width: 768px) {
            .profile-part {
                flex-direction: column;
                align-items: center;
                padding: 20px 20px 0px 20px;
            }
            
            .edit-forms {
                width: 100%;
            }
            
            .inline-form {
                flex-direction: column;
                align-items: stretch;
            }
            
            .inline-form input {
                width: 100%;
            }
            
            .btn-edit {
                width: 100%;
                padding: 10px;
            }

            .password-form {
                gap: 8px;
            }
        }

        /* Анимация для форм */
        .edit-section {
            animation: fadeInUp 0.3s ease-out;
            animation-fill-mode: both;
        }

        .edit-section:nth-child(1) { animation-delay: 0s; }
        .edit-section:nth-child(2) { animation-delay: 0.05s; }
        .edit-section:nth-child(3) { animation-delay: 0.1s; }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .alert {
            animation: slideIn 0.3s ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>

    <script>
        let input = document.querySelector("#pfp");
        if (input) {
            input.addEventListener('change', () => {
                input.parentNode.submit();
            });
        }

        // Автоматическое скрытие сообщений через 5 секунд
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(alert => {
            setTimeout(() => {
                alert.style.opacity = '0';
                setTimeout(() => {
                    if (alert.parentNode) alert.remove();
                }, 300);
            }, 5000);
        });

        // Валидация всех форм
        const forms = document.querySelectorAll('.inline-form');
        forms.forEach(form => {
            form.addEventListener('submit', (e) => {
                const action = form.querySelector('input[name="action"]')?.value;
                
                if (action === 'change_login') {
                    const newLogin = form.querySelector('input[name="new_login"]').value.trim();
                    if (!newLogin) {
                        e.preventDefault();
                        alert('Введите новый логин');
                    } else if (newLogin.length < 3 || newLogin.length > 20) {
                        e.preventDefault();
                        alert('Логин должен быть от 3 до 20 символов');
                    } else if (!/^[a-zA-Z0-9_-]+$/.test(newLogin)) {
                        e.preventDefault();
                        alert('Логин может содержать только буквы, цифры, _ и -');
                    }
                }
                
                if (action === 'change_email') {
                    const newEmail = form.querySelector('input[name="new_email"]').value.trim();
                    if (!newEmail) {
                        e.preventDefault();
                        alert('Введите новый email');
                    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(newEmail)) {
                        e.preventDefault();
                        alert('Введите корректный email');
                    }
                }
                
                if (action === 'change_password') {
                    const currentPass = form.querySelector('input[name="current_password"]').value;
                    const newPass = form.querySelector('input[name="new_password"]').value;
                    const confirmPass = form.querySelector('input[name="confirm_password"]').value;
                    
                    if (!currentPass || !newPass || !confirmPass) {
                        e.preventDefault();
                        alert('Заполните все поля');
                    } else if (newPass.length < 4) {
                        e.preventDefault();
                        alert('Новый пароль должен быть минимум 4 символа');
                    } else if (newPass !== confirmPass) {
                        e.preventDefault();
                        alert('Пароли не совпадают');
                    }
                }
            });
        });
    </script>
</body>

</html>
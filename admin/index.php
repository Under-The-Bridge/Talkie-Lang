<?php
require "../connection-db.php";
if ($user["user_role"] != "admin")
    header("Location: /profile");

/* ====== Сбор статистики для дашборда ======
   ВАЖНО: запросы написаны под mysqli ($conn).
   Если в твоём connection-db.php соединение называется иначе (например $pdo),
   замени mysqli_query($conn, ...) на свой вариант.
*/

// Общие цифры
$totalUsers = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) AS c FROM users"))["c"];
$totalLangs = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) AS c FROM langs"))["c"];
$totalLessons = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) AS c FROM lesson"))["c"];
$totalWords = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) AS c FROM words"))["c"];
$totalLeagues = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) AS c FROM leagues"))["c"];

// Топ-5 пользователей по недельному XP
$topUsersQ = mysqli_query($conn, "
    SELECT u.user_login, u.user_pfp, u.user_weekly_xp, l.league_name
    FROM users u
    LEFT JOIN leagues l ON l.league_id = u.user_league
    ORDER BY u.user_weekly_xp DESC
    LIMIT 5
");

// Последние зарегистрированные пользователи
$recentUsersQ = mysqli_query($conn, "
    SELECT user_id, user_login, user_email, user_pfp, user_role
    FROM users
    ORDER BY user_id DESC
    LIMIT 6
");

// Языки + количество уроков и слов в каждом
$langsQ = mysqli_query($conn, "
    SELECT lg.lang_id, lg.lang_name,
           (SELECT COUNT(*) FROM lesson WHERE lesson_language = lg.lang_id) AS lessons_count,
           (SELECT COUNT(*) FROM words WHERE lang_id = lg.lang_id) AS words_count
    FROM langs lg
    ORDER BY lg.lang_id
");

// Самые проходимые уроки (по числу записей в completed_lessons)
$popularLessonsQ = mysqli_query($conn, "
    SELECT l.lesson_name, lg.lang_name, COUNT(cl.id) AS passes
    FROM completed_lessons cl
    JOIN lesson l ON l.lesson_id = cl.lesson_id
    LEFT JOIN langs lg ON lg.lang_id = l.lesson_language
    GROUP BY l.lesson_id
    ORDER BY passes DESC
    LIMIT 5
");

$maxLangWords = 1;
$langsData = [];
while ($row = mysqli_fetch_assoc($langsQ)) {
    $langsData[] = $row;
    if ($row['words_count'] > $maxLangWords)
        $maxLangWords = $row['words_count'];
}
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../components/head-admin.php"; ?>

<body>
    <?php include "../components/header-admin.php"; ?>
    <main class="container">

        <div class="dash-header">
            <div>
                <h1 class="dash-title">Дашборд</h1>
                <p class="dash-subtitle">Привет, <?= htmlspecialchars($user["user_login"] ?? "админ") ?>. Вот что
                    происходит на платформе</p>
            </div>
            <button id="export-pdf" class="export-btn" type="button">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                    stroke-linecap="round" stroke-linejoin="round">
                    <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
                    <polyline points="7 10 12 15 17 10" />
                    <line x1="12" y1="15" x2="12" y2="3" />
                </svg>
                Скачать PDF
            </button>
        </div>

        <div id="dashboard-content">

            <!-- Статистика -->
            <div class="stats-grid">
                <div class="stat-box">
                    <div class="stat-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
                            <circle cx="9" cy="7" r="4" />
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
                            <path d="M16 3.13a4 4 0 0 1 0 7.75" />
                        </svg>
                    </div>
                    <div>
                        <div class="stat-num"><?= $totalUsers ?></div>
                        <div class="stat-lbl">Пользователей</div>
                    </div>
                </div>
                <div class="stat-box">
                    <div class="stat-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10" />
                            <line x1="2" y1="12" x2="22" y2="12" />
                            <path
                                d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z" />
                        </svg>
                    </div>
                    <div>
                        <div class="stat-num"><?= $totalLangs ?></div>
                        <div class="stat-lbl">Языков</div>
                    </div>
                </div>
                <div class="stat-box">
                    <div class="stat-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z" />
                            <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z" />
                        </svg>
                    </div>
                    <div>
                        <div class="stat-num"><?= $totalLessons ?></div>
                        <div class="stat-lbl">Уроков</div>
                    </div>
                </div>
                <div class="stat-box">
                    <div class="stat-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="4 7 4 4 20 4 20 7" />
                            <line x1="9" y1="20" x2="15" y2="20" />
                            <line x1="12" y1="4" x2="12" y2="20" />
                        </svg>
                    </div>
                    <div>
                        <div class="stat-num"><?= $totalWords ?></div>
                        <div class="stat-lbl">Слов</div>
                    </div>
                </div>
                <div class="stat-box">
                    <div class="stat-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path d="M8 21h8" />
                            <path d="M12 17v4" />
                            <path d="M7 4h10v5a5 5 0 0 1-10 0z" />
                            <path d="M5 4H3v2a3 3 0 0 0 3 3" />
                            <path d="M19 4h2v2a3 3 0 0 1-3 3" />
                        </svg>
                    </div>
                    <div>
                        <div class="stat-num"><?= $totalLeagues ?></div>
                        <div class="stat-lbl">Лиг</div>
                    </div>
                </div>
            </div>

            <div class="dash-grid">

                <!-- Топ по XP -->
                <div class="dash-card">
                    <h2 class="dash-card-title">Топ недели по XP</h2>
                    <div class="table-scroll">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Игрок</th>
                                    <th>Лига</th>
                                    <th>XP</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $rank = 1; ?>
                                <?php while ($row = mysqli_fetch_assoc($topUsersQ)): ?>
                                    <tr>
                                        <td><span class="rank-badge"><?= $rank ?></span></td>
                                        <td>
                                            <div class="player-cell">
                                                <?php if (!empty($row['user_pfp'])): ?>
                                                    <img class="pfp player-avatar"
                                                        src="../../images/<?= htmlspecialchars($row['user_pfp']) ?>" alt="">
                                                <?php else: ?>
                                                    <div class="mini-avatar">
                                                        <?= mb_strtoupper(mb_substr($row['user_login'], 0, 1)) ?>
                                                    </div>
                                                <?php endif; ?>
                                                <span><?= htmlspecialchars($row['user_login']) ?></span>
                                            </div>
                                        </td>
                                        <td><?= htmlspecialchars($row['league_name'] ?? '—') ?></td>
                                        <td class="xp-cell"><?= $row['user_weekly_xp'] ?> XP</td>
                                    </tr>
                                    <?php $rank++; ?>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Новые пользователи -->
                <div class="dash-card">
                    <h2 class="dash-card-title">Новые пользователи</h2>
                    <div class="table-scroll">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Логин</th>
                                    <th>Email</th>
                                    <th>Роль</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($row = mysqli_fetch_assoc($recentUsersQ)): ?>
                                    <tr>
                                        <td>#<?= $row['user_id'] ?></td>
                                        <td>
                                            <div class="player-cell">
                                                <?php if (!empty($row['user_pfp'])): ?>
                                                    <img class="pfp player-avatar"
                                                        src="../../images/<?= htmlspecialchars($row['user_pfp']) ?>" alt="">
                                                <?php else: ?>
                                                    <div class="mini-avatar">
                                                        <?= mb_strtoupper(mb_substr($row['user_login'], 0, 1)) ?>
                                                    </div>
                                                <?php endif; ?>
                                                <span><?= htmlspecialchars($row['user_login']) ?></span>
                                            </div>
                                        </td>
                                        <td class="muted-cell"><?= htmlspecialchars($row['user_email']) ?></td>
                                        <td>
                                            <span
                                                class="role-badge <?= $row['user_role'] === 'admin' ? 'role-admin' : 'role-user' ?>">
                                                <?= $row['user_role'] === 'admin' ? 'Админ' : 'Юзер' ?>
                                            </span>
                                        </td>
                                    </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Языки -->
                <div class="dash-card">
                    <h2 class="dash-card-title">Языки и контент</h2>
                    <div class="lang-progress-list">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>Язык</th>
                                    <th>Уроков</th>
                                    <th>Слов</th>
                                </tr>
                            </thead>
                            <?php foreach ($langsData as $lang): ?>
                                <tbody>
                                    <tr>
                                        <td>
                                            <?= htmlspecialchars($lang['lang_name']) ?>
                                        </td>
                                        <td class="muted-cell">
                                            <?= $lang['lessons_count'] ?>
                                        </td>
                                        <td class="xp-cell">
                                            <?= $lang['words_count'] ?>
                                        </td>
                                    </tr>
                                </tbody>
                            <?php endforeach; ?>
                        </table>
                    </div>
                </div>

                <!-- Популярные уроки -->
                <div class="dash-card">
                    <h2 class="dash-card-title">Популярные уроки</h2>
                    <div class="table-scroll">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>Урок</th>
                                    <th>Язык</th>
                                    <th>Прохождений</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($row = mysqli_fetch_assoc($popularLessonsQ)): ?>
                                    <tr>
                                        <td><?= htmlspecialchars($row['lesson_name']) ?></td>
                                        <td class="muted-cell"><?= htmlspecialchars($row['lang_name'] ?? '—') ?></td>
                                        <td class="xp-cell"><?= $row['passes'] ?></td>
                                    </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
            <!-- /#dashboard-content -->

    </main>

    <script src="https://cdn.jsdelivr.net/npm/html2canvas-pro@1.5.8/dist/html2canvas-pro.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script>
        document.getElementById('export-pdf').addEventListener('click', async function () {
            const btn = this;
            const target = document.getElementById('dashboard-content');
            const originalText = btn.innerHTML;
            btn.disabled = true;
            btn.innerHTML = 'Готовим PDF...';

            try {
                const canvas = await html2canvas(target, {
                    scale: 2,
                    useCORS: true,
                    backgroundColor: '#ffffff'
                });

                const { jsPDF } = window.jspdf;
                const pdf = new jsPDF('l', 'mm', 'a4');

                const pageWidth = pdf.internal.pageSize.getWidth();
                const pageHeight = pdf.internal.pageSize.getHeight();
                const margin = 8;

                let imgWidth = pageWidth - margin * 2;
                let imgHeight = (canvas.height * imgWidth) / canvas.width;

                if (imgHeight > pageHeight - margin * 2) {
                    imgHeight = pageHeight - margin * 2;
                    imgWidth = (canvas.width * imgHeight) / canvas.height;
                }

                const x = (pageWidth - imgWidth) / 2;
                const y = (pageHeight - imgHeight) / 2;

                const imgData = canvas.toDataURL('image/jpeg', 0.95);
                pdf.addImage(imgData, 'JPEG', x, y, imgWidth, imgHeight);
                pdf.save('dashboard-' + new Date().toISOString().slice(0, 10) + '.pdf');
            } catch (err) {
                console.error('Ошибка при создании PDF:', err);
                alert('Не получилось создать PDF: ' + err.message);
            } finally {
                btn.disabled = false;
                btn.innerHTML = originalText;
            }
        });
    </script>
</body>

</html>
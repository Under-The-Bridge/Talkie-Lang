<?php
require "../../connection-db.php";
if($user["user_role"] != "admin") header("Location: /profile");

/* ====== ВАЖНО ======
   Для бана/разбана нужна колонка `user_banned` в таблице `users`.
   Если её ещё нет, выполни:

   ALTER TABLE `users` ADD COLUMN `user_banned` TINYINT(1) NOT NULL DEFAULT 0 AFTER `user_role`;
*/

// ====== Бан / разбан ======
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['toggle_ban'], $_POST['user_id'])) {
    $targetId = (int) $_POST['user_id'];

    $checkStmt = mysqli_prepare($conn, "SELECT user_role FROM users WHERE user_id = ?");
    mysqli_stmt_bind_param($checkStmt, "i", $targetId);
    mysqli_stmt_execute($checkStmt);
    $targetRole = mysqli_fetch_assoc(mysqli_stmt_get_result($checkStmt))['user_role'] ?? null;

    // Админов банить нельзя
    if ($targetRole === 'user') {
        $updStmt = mysqli_prepare($conn, "UPDATE users SET user_banned = NOT user_banned WHERE user_id = ?");
        mysqli_stmt_bind_param($updStmt, "i", $targetId);
        mysqli_stmt_execute($updStmt);
    }

    $qs = $_SERVER['QUERY_STRING'] ?? '';
    header("Location: ./" . ($qs ? "?$qs" : ""));
    exit;
}

// ====== Поиск и фильтр ======
$search = trim($_GET['q'] ?? '');
$status = $_GET['status'] ?? 'all'; // all | active | banned

$conditions = [];
$params = [];
$types = '';

if ($search !== '') {
    $conditions[] = "(user_login LIKE ? OR user_email LIKE ?)";
    $like = "%$search%";
    $params[] = $like;
    $params[] = $like;
    $types .= 'ss';
}

if ($status === 'active') {
    $conditions[] = "user_banned = 0";
} elseif ($status === 'banned') {
    $conditions[] = "user_banned = 1";
}

$whereSql = $conditions ? 'WHERE ' . implode(' AND ', $conditions) : '';

// ====== Пагинация ======
$perPage = 12;
$page = max(1, (int) ($_GET['page'] ?? 1));

$countSql = "SELECT COUNT(*) AS c FROM users $whereSql";
$countStmt = mysqli_prepare($conn, $countSql);
if ($types) {
    mysqli_stmt_bind_param($countStmt, $types, ...$params);
}
mysqli_stmt_execute($countStmt);
$totalUsers = (int) mysqli_fetch_assoc(mysqli_stmt_get_result($countStmt))['c'];
$totalPages = max(1, (int) ceil($totalUsers / $perPage));
$page = min($page, $totalPages);
$offset = ($page - 1) * $perPage;

$listSql = "SELECT user_id, user_login, user_email, user_pfp, user_role, user_banned
            FROM users
            $whereSql
            ORDER BY user_id ASC
            LIMIT ? OFFSET ?";
$listStmt = mysqli_prepare($conn, $listSql);
$listTypes = $types . 'ii';
$listParams = array_merge($params, [$perPage, $offset]);
mysqli_stmt_bind_param($listStmt, $listTypes, ...$listParams);
mysqli_stmt_execute($listStmt);
$usersResult = mysqli_stmt_get_result($listStmt);

// Общее количество пользователей (без фильтра) для счётчика
$totalAll = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) AS c FROM users"))['c'];

// Хелпер для построения ссылок пагинации/фильтров с сохранением параметров
function buildQuery($overrides = []) {
    $params = array_merge($_GET, $overrides);
    return '?' . http_build_query($params);
}
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../../components/head-admin.php"; ?>

<body>
    <?php include "../../components/header-admin.php"; ?>
    <main class="container">

        <div class="dash-header">
            <div>
                <h1 class="dash-title">Пользователи</h1>
                <p class="dash-subtitle">Управление аккаунтами платформы</p>
            </div>
        </div>

        <div class="users-toolbar">
            <div class="users-count">
                Найдено: <b><?= $totalUsers ?></b> из <b><?= $totalAll ?></b>
            </div>

            <form class="search-form" method="get" action="">
                <?php if ($status !== 'all'): ?>
                    <input type="hidden" name="status" value="<?= htmlspecialchars($status) ?>">
                <?php endif; ?>
                <div class="search-box">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
                    <input type="text" name="q" placeholder="Логин или email..." value="<?= htmlspecialchars($search) ?>">
                </div>
                <button class="search-btn" type="submit">Найти</button>
            </form>
        </div>

        <div class="filter-pills">
            <a class="filter-pill <?= $status === 'all' ? 'active' : '' ?>" href="<?= buildQuery(['status' => 'all', 'page' => 1]) ?>">Все</a>
            <a class="filter-pill <?= $status === 'active' ? 'active' : '' ?>" href="<?= buildQuery(['status' => 'active', 'page' => 1]) ?>">Активные</a>
            <a class="filter-pill <?= $status === 'banned' ? 'active' : '' ?>" href="<?= buildQuery(['status' => 'banned', 'page' => 1]) ?>">Заблокированные</a>
        </div>

        <div class="dash-card">

            <?php if ($totalUsers === 0): ?>
                <div class="no-results">
                    <div class="icon">
                        <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="var(--gray-color)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
                    </div>
                    <p>Ничего не найдено</p>
                </div>
            <?php else: ?>
                <div class="table-scroll">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Пользователь</th>
                                <th>Email</th>
                                <th>Роль</th>
                                <th>Статус</th>
                                <th>Действие</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while ($row = mysqli_fetch_assoc($usersResult)): ?>
                                <tr>
                                    <td>#<?= $row['user_id'] ?></td>
                                    <td>
                                        <div class="player-cell">
                                            <?php if (!empty($row['user_pfp'])): ?>
                                                <img class="pfp player-avatar" src="/uploads/avatars/<?= htmlspecialchars($row['user_pfp']) ?>" alt="">
                                            <?php else: ?>
                                                <div class="mini-avatar"><?= mb_strtoupper(mb_substr($row['user_login'], 0, 1)) ?></div>
                                            <?php endif; ?>
                                            <span><?= htmlspecialchars($row['user_login']) ?></span>
                                        </div>
                                    </td>
                                    <td class="muted-cell"><?= htmlspecialchars($row['user_email']) ?></td>
                                    <td>
                                        <span class="role-badge <?= $row['user_role'] === 'admin' ? 'role-admin' : 'role-user' ?>">
                                            <?= $row['user_role'] === 'admin' ? 'Админ' : 'Юзер' ?>
                                        </span>
                                    </td>
                                    <td>
                                        <?php if ((int) $row['user_banned'] === 1): ?>
                                            <span class="status-badge status-banned">Заблокирован</span>
                                        <?php else: ?>
                                            <span class="status-badge status-active">Активен</span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <?php if ($row['user_role'] === 'admin'): ?>
                                            <span class="admin-tag">—</span>
                                        <?php else: ?>
                                            <form class="action-form" method="post" action="">
                                                <input type="hidden" name="user_id" value="<?= $row['user_id'] ?>">
                                                <input type="hidden" name="toggle_ban" value="1">
                                                <?php if ((int) $row['user_banned'] === 1): ?>
                                                    <button type="submit" class="unban-btn">Разблокировать</button>
                                                <?php else: ?>
                                                    <button type="submit" class="ban-btn" onclick="return confirm('Заблокировать пользователя <?= htmlspecialchars(addslashes($row['user_login'])) ?>?')">Заблокировать</button>
                                                <?php endif; ?>
                                            </form>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>

                <?php if ($totalPages > 1): ?>
                    <div class="pagination">
                        <a class="page-link <?= $page <= 1 ? 'disabled' : '' ?>" href="<?= buildQuery(['page' => $page - 1]) ?>">←</a>
                        <?php for ($p = 1; $p <= $totalPages; $p++): ?>
                            <a class="page-link <?= $p === $page ? 'active' : '' ?>" href="<?= buildQuery(['page' => $p]) ?>"><?= $p ?></a>
                        <?php endfor; ?>
                        <a class="page-link <?= $page >= $totalPages ? 'disabled' : '' ?>" href="<?= buildQuery(['page' => $page + 1]) ?>">→</a>
                    </div>
                <?php endif; ?>
            <?php endif; ?>

        </div>

    </main>
</body>

</html>
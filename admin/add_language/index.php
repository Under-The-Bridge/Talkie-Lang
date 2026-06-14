<?php
require "../../connection-db.php";

$langs = mysqli_fetch_all(mysqli_query($conn, "
    SELECT lg.*,
           (SELECT COUNT(*) FROM lesson WHERE lesson_language = lg.lang_id) AS lessons_count
    FROM langs lg
    ORDER BY lg.lang_id DESC
"), MYSQLI_ASSOC);

?>
<!DOCTYPE html>
<html lang="en">


<?php include "../../components/head-admin.php"; ?>

<body>
    <?php include "../../components/header-admin.php"; ?>
    <main class="container">

        <div class="dash-header">
            <div>
                <h1 class="dash-title">Языки</h1>
                <p class="dash-subtitle">Управление языками платформы</p>
            </div>
        </div>

        <div class="dash-card" style="margin: 0 10px 20px 10px;">
            <h2 class="dash-card-title">Добавить язык</h2>
            <form method="post" action="addLang.php" class="lang-add-form">
                <div class="search-box">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
                    <input type="text" id="name" name="name" placeholder="Например: Французский" required>
                </div>
                <button type="submit" class="search-btn">Добавить</button>
            </form>
        </div>

        <div class="dash-card" style="margin: 0 10px 30px 10px;">
            <h2 class="dash-card-title">Список языков</h2>

            <?php if (empty($langs)): ?>
                <div class="no-results">
                    <div class="icon">
                        <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="var(--gray-color)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
                    </div>
                    <p>Языков пока нет</p>
                </div>
            <?php else: ?>
                <div class="table-scroll">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Язык</th>
                                <th>Уроков</th>
                                <th>Статус</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($langs as $lang): ?>
                                <tr>
                                    <td>#<?= $lang["lang_id"] ?></td>
                                    <td style="font-weight: 800; color: #222;"><?= htmlspecialchars($lang["lang_name"]) ?></td>
                                    <td class="xp-cell"><?= $lang["lessons_count"] ?></td>
                                    <td>
                                        <?php if ((int) $lang["lessons_count"] === 0): ?>
                                            <span class="warning-badge">
                                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10.29 3.86 1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
                                                Нет уроков
                                            </span>
                                        <?php else: ?>
                                            <span class="status-badge status-active">Есть контент</span>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>

    </main>
</body>

</html>
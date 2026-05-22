<?php
session_start();
require "../connection-db.php";
if (!isset($_SESSION["id"])) {
    echo "    <script>
        alert('Войдите в профиль');
        location.href = '/welcome/';
    </script>";
}
$id = $_SESSION["id"];
$time = mysqli_fetch_array(mysqli_query($conn, "SELECT `time` FROM `weekly_league` LIMIT 1"))[0];
$inLeague = false;
if (mysqli_num_rows(mysqli_query($conn, "SELECT * FROM `league_users` where user_id = $id")) != 0) {
    $inLeague = true;
    $league_id = mysqli_fetch_array(mysqli_query($conn, "SELECT * FROM `league_users` where user_id = $id"))[2];
    $sql = "select * from weekly_league join league_users on league_users.weekly_league_id = weekly_league.id join users on users.user_id = league_users.user_id where weekly_league.id = '$league_id'  ORDER BY users.user_weekly_xp DESC";
    $league = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);
}


?>
<!DOCTYPE html>
<html lang="en">


<?php include "../components/head.php"; ?>

<body>
    <?php include "../components/header.php"; ?>
    <main class="container">
        
        <?php if ($inLeague): ?>
            <div>
            <!-- <div style="mb-3" class="d-flex align-items-center"> -->
                <div class="d-flex align-items-end mb-2">
                    <img class="trophy copper <?= $user["league_name"] == 'Бронзавая лига' ? "active": ""?>" src="../assets/trophy-svgrepo-com.svg" alt="">
                    <img class="trophy silver <?= $user["league_name"] == 'Серебряная лига' ? "active": ""?>" src="../assets/trophy-svgrepo-com.svg" alt="">
                    <img class="trophy gold <?= $user["league_name"] == 'Золотая лига' ? "active": ""?>" src="../assets/trophy-svgrepo-com.svg" alt="">
                </div>
                <h4 style="color: var(--main-color); font-weight: 900;"><?= $user["league_name"] ?> | До обновления лиги осталось: <span class="timer" style="color: var(--green-color);"></span></h4>
            </div>
            <div class="league-table-wrapper">
                <table class="league-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Игрок</th>
                            <th>Опыт</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $count = 0;
                        foreach ($league as $us):
                            $count++;
                            $rank = ($count == 1) ? 'top-rank' : (($count == 2) ? 'mid-rank' : (($count == 3) ? 'bottom-rank' : ''));
                            $row = ($count >= 1 && $count <= 5) ? 'green' : (($count > 10 && $count <= 15) ? 'red' : '');
                            ?>
                            <tr class="league-row <?=$row?>" style="animation: t <?= $count / 10 ?>s ease;">
                                <td class="rank-cell">
                                    <span class="rank-number <?= $rank?>">
                                        <?= $count ?>
                                    </span>
                                </td>
                                <td class="player-cell">
                                    <div class="player-info">
                                        <div class="player-avatar">
                                            <?= strtoupper($us["user_login"][0]) ?>
                                        </div>
                                        <span class="player-name <?= ($us["user_id"] == $user["user_id"]) ? 'current-user-name' : '' ?> <?=$rank?>">
                                            <?= $us["user_login"] ?>
                                        </span>
                                        <?php if ($us["user_id"] == $user["user_id"]): ?>
                                            <span class="you-badge">Вы</span>
                                        <?php endif; ?>
                                    </div>
                                </td>
                                <td class="xp-cell">
                                    <div class="xp-display">
                                        <span class="xp-value"><?=$us["user_weekly_xp"] ?></span>
                                        <span class="xp-value">XP</span>
                                    </div>
                                </td>
                            </tr>
                            
                            <?php if ($count == 5): ?>
                                <tr class="separator-row promotion-separator">
                                    <td colspan="3">
                                        <div class="zone-divider promotion">
                                            <span>Зона повышения</span>
                                        </div>
                                    </td>
                                </tr>
                            <?php endif; ?>
                            
                            <?php if ($count == 10): ?>
                                <tr class="separator-row demotion-separator">
                                    <td colspan="3">
                                        <div class="zone-divider demotion">
                                            <span>Зона понижения</span>
                                        </div>
                                    </td>
                                </tr>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php else: ?>
            <div class="not-in-league">
                <div class="not-in-league-icon"><img class="trophy gold active" src="../assets/trophy-svgrepo-com.svg" alt=""></div>
                <h4>Вы не в лиге</h4>
                <p>Присоединяйтесь к лиге, чтобы соревноваться с другими игроками!</p>
            </div>
        <?php endif; ?>
    </main>
    
    <style>

    </style>
    
    <script>
        function startTime() {
            if (<?= $time ?> <= Math.floor(Date.now() / 1000)) {
                document.querySelector(".timer").innerHTML = "0";
                restartLeague();
            } else {
                let now = <?= $time ?> - Math.floor(Date.now() / 1000);
                let hours = Math.floor(now / 3600);
                now %= 3600;
                let minutes = Math.floor(now / 60);
                let seconds = now % 60;
                document.querySelector(".timer").innerHTML = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            }
            setTimeout(startTime, 1000);
        }
        startTime();
        
        function restartLeague() {
            location.href = "/server";
        }
    </script>
</body>

</html>
<?php
session_start();
require "../connection-db.php";
if (!isset($_SESSION["id"])) {
    echo "    <script>
        alert('Войдите в профиль');
        location.href = '/auth/';
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
        <h4><?= $user["league_name"] ?> | До обновлении лиги остатось: <span class="timer"></span></h4>
        <?php if ($inLeague): ?>
            <table class="table table-striped-columns">
                <?php
                $count = 0;
                foreach ($league as $us):
                    $count++ ?>
                    <tr>
                        <?php if ($us["user_id"] == $user["user_id"]): ?>
                            <th class="link-success"><?= $us["user_login"] ?></th>
                        <?php else: ?>
                            <td><?= $us["user_login"] ?></td>
                        <?php endif; ?>
                        <td><?= $us["user_weekly_xp"] ?> XP</td>
                    </tr>
                    <?php if ($count == 5)
                        echo "<tr><td class='link-success'>Зона повышения ^ </td></tr>" ?>
                    <?php if ($count == 10)
                        echo "<tr><td class='link-danger'>Зона понижения v</td></tr>" ?>
                <?php endforeach; ?>
            </table>
        <?php else: ?>
            <h4>Вы не в лиге</h4>
        <?php endif; ?>
    </main>
    <script>
        function startTime() {
            if (<?= $time ?> <= Math.floor(Date.now() / 1000)) {
                document.querySelector(".timer").innerHTML = 0;
                restartLeague();
            } else {
                let now = <?= $time ?> - Math.floor(Date.now() / 1000);
                let hours = Math.floor(now / 3600);
                now %= 3600;
                let minutes = Math.floor(now / 60);
                let seconds = now % 60;
                document.querySelector(".timer").innerHTML = `${hours}:${minutes}:${seconds}`;
            }
            setTimeout(startTime, 1000); // Updates every second
        }
        startTime();
        function restartLeague() {
            location.href = "/server";
        }
    </script>
</body>

</html>
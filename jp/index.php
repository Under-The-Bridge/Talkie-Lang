<?php
session_start();
require "../connection-db.php";
$lessons = mysqli_fetch_all(mysqli_query($conn, "select * from lesson where `lesson_language` = 'Японский'"));
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../components/head.php"; ?>

<body>
    <?php include "../components/header.php"; ?>
    <main class="container">
        <?php foreach ($lessons as $lesson): ?>
            <a href="lesson/?id=<?=$lesson[0]?>"><?=$lesson[1]?></a>
        <?php endforeach; ?>
    </main>
</body>

</html>
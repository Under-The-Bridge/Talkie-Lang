<?php
session_start();
require "../connection-db.php";
require "../clearSession.php";

if (!isset($_SESSION["id"])) {
    echo "    <script>
        alert('Войдите в профиль');
        location.href = '/auth/';
    </script>";
}

$id = $_SESSION["id"];

$lessons = mysqli_fetch_all(mysqli_query($conn, "select * from lesson join langs on lesson.lesson_language = langs.lang_id where `lang_name` = 'Английский'"));
if (mysqli_num_rows(mysqli_query($conn, "select progress from user_lang_progress where user_id = $id and lang_id = 1")) == 0) {
    mysqli_query($conn, "INSERT INTO `user_lang_progress`(`user_id`, `lang_id`, `progress`) VALUES ('$id','1','0')");
}
$progress = mysqli_fetch_array(mysqli_query($conn, "select progress from user_lang_progress where user_id = $id and lang_id = 1"))[0];
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../components/head.php"; ?>

<body>
    <?php include "../components/header.php"; ?>
    <main class="container">
        <div class="levels">
            <div class="razd">
                <?php
                $temp = 0;
                foreach ($lessons as $lesson): ?>
                    <?php if ($temp <= $progress):
                        $temp++ ?>

                        <a href="lesson/?id=<?= $lesson[0] ?>" class="circles">
                            <p>V</p>
                            <div class="hover">
                                <p>
                                    <?= $lesson[1] ?>
                                </p>
                            </div>
                        </a>
                    <?php else: ?>
                        <div class="circles closed">
                            <p>X</p>
                            <div class="hover">
                                <p>
                                    <?= $lesson[1] ?>
                                </p>
                            </div>
                        </div>
                    <?php endif; ?>
                <?php endforeach; ?>
                <div class="circles closed">
                    X
                </div>
                <div class="circles closed">
                    X
                </div>
            </div>
            <hr>
            <div class="invert">
                <div class="circles closed">
                    <div>X</div>
                </div>
                <div class="circles closed">
                    <div>X</div>
                </div>
                <div class="circles closed">
                    <div>X</div>
                </div>
                <div class="circles closed">
                    <div>X</div>
                </div>
                <div class="circles closed">
                    <div>X</div>
                </div>
            </div>


        </div>
    </main>
</body>

</html>
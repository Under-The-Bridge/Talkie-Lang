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
$sql = "select * from lesson join langs on lesson.lesson_language = langs.lang_id where `lang_name` = 'Английский'";
$query = mysqli_query($conn, $sql);
$lessons = mysqli_fetch_all($query);
$count = mysqli_num_rows($query);
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
        <div id="banner"><?= $lessons[0][1] ?></div>
        <div class="levels">
            <?php
            $check = true;
            $t = 0;
            foreach ($lessons as $lesson): ?>
                <div class="<?= $t % 2 == 0 ? "razd" : "invert" ?>" value="<?= $lesson[1] ?>">
                    <?php
                    $t++;
                    $temp = -1;
                    $count = mysqli_fetch_assoc(mysqli_query($conn, "select * from completed_lessons where user_id = $id and lesson_id = " . $lesson[0]))["count"] ?? false;
                    ?>
                    <?php for ($i = 0; $i < 4; $i++): ?>
                        <?php if ($temp < $count && $check):
                            $temp++ ?>
                            <a href="lesson/?id=<?= $lesson[0] ?>" class="circles">
                                <p>></p>
                                <div class="hover">
                                    <p>
                                        Урок
                                        <?= $i + 1 ?>
                                        из
                                        4
                                    </p>
                                </div>
                            </a>
                        <?php else:
                            $check = false;
                            ?>
                            <div class="circles closed">
                                <p>X</p>
                                <div class="hover">
                                    <p>
                                        Урок
                                        <?= $i + 1 ?>
                                        из
                                        4
                                    </p>
                                </div>
                            </div>
                        <?php endif; ?>
                    <?php endfor; ?>
                </div>
            <?php endforeach; ?>
        </div>
    </main>
    <script>
        // let count = <?= $count ?>;
        let html = document.querySelector("html");
        let banner = document.querySelector("#banner");
        let elems = document.querySelectorAll(".razd, .invert");
        for (let i = 0; i < elems.length; i++) {
            document.addEventListener('scroll', () => {
                if (html.scrollTop >= 375 * i) {
                    console.log(i);
                    banner.innerHTML = elems[i].getAttribute("value");
                }
            })
        }
        // document.addEventListener('scroll',()=>{
        //     if(document.scrollTop > 500){
        //         console.log(html.scrollTop);
        //     }else{
        //         console.log(html.scrollTop);
        //     }
        // })
    </script>
</body>

</html>
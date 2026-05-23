<?php
session_start();
require "connection-db.php";
require "clearSession.php";

if (!isset($_GET['lang'])) {
    header("Location: /welcome");
}


if ($_GET['lang'] != $_SESSION['lang']) {
    unset($_SESSION['lang']);
}

$lang = $_GET['lang'];
$_SESSION['lang'] = $lang;

if (!isset($_SESSION["id"])) {
    echo "    <script>
        alert('Войдите в профиль');
        location.href = '/welcome/';
    </script>";
}


$id = $_SESSION["id"];
// $_SESSION["lang"] = "en";
$sql = "select * from lesson join langs on lesson.lesson_language = langs.lang_id where `lang_id` = '$lang'";
$query = mysqli_query($conn, $sql);
$lessons = mysqli_fetch_all($query);
$count = mysqli_num_rows($query);
if (mysqli_num_rows(mysqli_query($conn, "select progress from user_lang_progress where user_id = $id and lang_id = $lang")) == 0) {
    $first_lesson_id = mysqli_fetch_array(mysqli_query($conn, "SELECT * FROM `lesson` WHERE lesson_language = $lang ORDER by lesson_id ASC"))[0];
    mysqli_query($conn, "INSERT INTO `user_lang_progress`(`user_id`, `lang_id`) VALUES ('$id','$lang')");
    mysqli_query($conn, "INSERT INTO `completed_lessons`(`user_id`, `lesson_id`) VALUES ('$id','$first_lesson_id')");
}

$progress = mysqli_fetch_array(mysqli_query($conn, "select progress from user_lang_progress where user_id = $id and lang_id = $lang"))[0];
?>
<!DOCTYPE html>
<html lang="en">


<?php include "components/head.php"; ?>

<body>
    <style>

    </style>
    <?php include "components/header.php"; ?>
    <main class="container">
        <div id="banner"><?= $lessons[0][1] ?></div>
        <div class="levels">
            <?php
            $check = true;
            $anim = 1;
            $t = 0;
            foreach ($lessons as $lesson): ?>
                <div class="<?= $t % 2 == 0 ? "razd" : "invert" ?>" value="<?= $lesson[1] ?>">
                    <?php
                    $t++;
                    $temp = -1;
                    $count = mysqli_fetch_assoc(mysqli_query($conn, "select * from completed_lessons where user_id = $id and lesson_id = " . $lesson[0]))["count"] ?? false;
                    ?>
                    <?php for ($i = 0; $i < 4; $i++):
                        $anim++ ?>
                        <?php if ($temp < $count && $check):
                            ?>
                            <?php if ($temp == 2): ?>
                                <a href="lesson/?id=<?= $lesson[0] ?>&c=<?= $temp ?>" class="circles evil"
                                    style="animation: show <?= $anim / 5 ?>s ease;">
                                    <p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                            class="bi bi-star" viewBox="0 0 16 16">
                                            <path
                                                d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z" />
                                        </svg></p>
                                    <div class="hover">
                                        <p>
                                            Контрольная точка
                                        </p>
                                    </div>
                                </a>
                            <?php elseif ($temp + 1 < $count): ?>
                                <a href="lesson/?id=<?= $lesson[0] ?>&c=<?= $temp ?>" class="circles good"
                                    style="animation: show <?= $anim / 5 ?>s ease;">
                                    <p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                            class="bi bi-check" viewBox="0 0 16 16">
                                            <path
                                                d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425z" />
                                        </svg></p>
                                    <div class="hover">
                                        <p>
                                            Урок
                                            <?= $i + 1 ?>
                                            из
                                            3
                                        </p>
                                    </div>
                                </a>
                            <?php else:
                                ?>
                                <a href="lesson/?id=<?= $lesson[0] ?>&c=<?= $temp ?>" class="circles"
                                    style="animation: show <?= $anim / 5 ?>s ease;">
                                    <p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                            class="bi bi-play" viewBox="0 0 16 16">
                                            <path
                                                d="M10.804 8 5 4.633v6.734zm.792-.696a.802.802 0 0 1 0 1.392l-6.363 3.692C4.713 12.69 4 12.345 4 11.692V4.308c0-.653.713-.998 1.233-.696z" />
                                        </svg></p>
                                    <div class="hover">
                                        <p>
                                            Урок
                                            <?= $i + 1 ?>
                                            из
                                            3
                                        </p>
                                    </div>
                                </a>
                            <?php endif; ?>
                        <?php
                        else:
                            $check = false;
                            ?>
                            <?php if ($temp == 2): ?>

                                <div href="lesson/?id=<?= $lesson[0] ?>&c=<?= $temp ?>" class="circles closed"
                                    style="animation: show <?= $anim / 5 ?>s ease;">
                                    <p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                            class="bi bi-star" viewBox="0 0 16 16">
                                            <path
                                                d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z" />
                                        </svg></p>
                                    <div class="hover">
                                        <p>
                                            Контрольная точка
                                        </p>
                                    </div>
                                </div>
                            <?php else:
                                ?>
                                <div class="circles closed" style="animation: show <?= $anim / 5 ?>s ease;">
                                    <p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                            class="bi bi-x" viewBox="0 0 16 16">
                                            <path
                                                d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708" />
                                        </svg></p>
                                    <div class="hover">
                                        <p>
                                            Урок
                                            <?= $i + 1 ?>
                                            из
                                            3
                                        </p>
                                    </div>
                                </div>
                            <?php endif; ?>
                        <?php endif; ?>
                        <?php $temp++; endfor; ?>
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
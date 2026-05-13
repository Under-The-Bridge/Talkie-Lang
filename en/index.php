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
$_SESSION["lang"] = "en";
$sql = "select * from lesson join langs on lesson.lesson_language = langs.lang_id where `lang_name` = 'Английский'";
$query = mysqli_query($conn, $sql);
$lessons = mysqli_fetch_all($query);
$count = mysqli_num_rows($query);
if (mysqli_num_rows(mysqli_query($conn, "select progress from user_lang_progress where user_id = $id and lang_id = 1")) == 0) {
    $first_lesson_id = mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM `lesson` WHERE lesson_language = 1 ORDER by lesson_id ASC"))[0];
    mysqli_query($conn, "INSERT INTO `user_lang_progress`(`user_id`, `lang_id`) VALUES ('$id','1')");
    mysqli_query($conn, "INSERT INTO `completed_lessons`(`user_id`, `lesson_id`) VALUES ('$id','$first_lesson_id')");
}

$progress = mysqli_fetch_array(mysqli_query($conn, "select progress from user_lang_progress where user_id = $id and lang_id = 1"))[0];
?>
<!DOCTYPE html>
<html lang="en">

<?php include "../components/head.php"; ?>

<body>
    <!-- Глобальный прогресс-бар -->
    <div class="global-progress">
        <div class="global-progress-bar" style="width: <?= $progress ?>%"></div>
    </div>
    
    <!-- Счетчик опыта -->
    <div class="xp-counter">
        <span class="xp-icon">⚡</span>
        <span class="xp-value"><?= $progress ?></span>
        <span class="xp-label">XP</span>
    </div>
    
    <?php include "components/header.php"; ?>
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
                            <a href="lesson/?id=<?= $lesson[0] ?>&c=<?=$temp?>" class="circles <?= $temp == $count-1 ? 'completed' : '' ?>">
                                <p><?= $temp+1 ?></p>
                                <div class="hover">
                                    <p>
                                        Lesson
                                        <?= $i + 1 ?>
                                        of
                                        4
                                    </p>
                                </div>
                            </a>
                        <?php else:
                            $check = false;
                            ?>
                            <div class="circles closed">
                                <p>🔒</p>
                                <div class="hover">
                                    <p>
                                        Lesson
                                        <?= $i + 1 ?>
                                        of
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
        let html = document.querySelector("html");
        let banner = document.querySelector("#banner");
        let elems = document.querySelectorAll(".razd, .invert");
        
        for (let i = 0; i < elems.length; i++) {
            document.addEventListener('scroll', () => {
                if (html.scrollTop >= 375 * i) {
                    console.log(i);
                    banner.innerHTML = elems[i].getAttribute("value");
                }
            });
        }
        
        // Эффект при скролле для элементов
        document.addEventListener('scroll', () => {
            const scrolled = html.scrollTop;
            const elements = document.querySelectorAll('.razd, .invert');
            
            elements.forEach((el, index) => {
                const offset = el.offsetTop;
                const progress = Math.max(0, Math.min(1, (scrolled - offset + 300) / 300));
                const opacity = Math.min(1, progress * 2);
                
                el.style.opacity = opacity;
                el.style.transform = `translateX(${index % 2 === 0 ? -25 : 25}px) scale(${0.95 + progress * 0.05})`;
            });
        });
    </script>
</body>

</html>
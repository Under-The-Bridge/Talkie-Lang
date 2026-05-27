<?php
require "../connection-db.php";

if (!isset($_SESSION["id"])) {
    echo "    <script>
        alert('Войдите в профиль');
        location.href = '/welcome/';
    </script>";
}
$lang = $_SESSION["lang"];
$language = $lang;
$lessons = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM `lesson` where lesson_language = $lang ORDER BY lesson.lesson_id ASC"), MYSQLI_ASSOC);
$user_words = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM `user_words` join words on words.word_id = user_words.word_id where user_id = $id and lang_id = $lang"), MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../components/head.php"; ?>

<body>
    <?php include "../components/header.php"; ?>
    <main class="container">
        <?php if (count($user_words) != 0): ?>
            <h4>Слова</h4>
            <?php foreach ($lessons as $lesson):
                $lesson_id = $lesson["lesson_id"];
                $lessons_words = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM `lesson` JOIN `lessons_words` ON lesson.lesson_id = lessons_words.lesson_id JOIN `words` ON lessons_words.word_id = words.word_id  where lesson_language = $language and lesson.lesson_id = $lesson_id ORDER BY lesson.lesson_id ASC, words.word_id ASC"), MYSQLI_ASSOC);
                if(mysqli_num_rows(mysqli_query($conn,"SELECT * FROM `user_words` join words on words.word_id = user_words.word_id JOIN `lessons_words` ON words.word_id = lessons_words.word_id where user_id = $id and lang_id = $language and lesson_id = $lesson_id")) == 0) continue;
                ?>
                <h4 class="txt"><?= $lesson["lesson_name"] ?></h4>
                <div class="wordgrid mb-5">
                    <?php foreach ($lessons_words as $word): ?>
                        <?php foreach ($user_words as $user_word): ?>
                            <?php if ($word['word_id'] == $user_word['word_id']): ?>
                                <div class="wordbtn">
                                    <div>
                                        <p><?= $word["word_name"] ?></p>
                                        <p><?= $word["word_transcription"] ?></p>
                                        <p><?= $word["word_translate"] ?></p>
                                    </div>
                                </div>
                                <?php
                                break;
                            endif; ?>
                        <?php endforeach; ?>
                        <?php endforeach; ?>
                    </div>
            <?php endforeach; ?>
        <?php else: ?>
            <h4>Пусто</h4>
        <?php endif; ?>
    </main>
    <script>
        let letters = document.querySelectorAll(".wordbtn");
        letters.forEach(btn => {
            btn.addEventListener("click", () => {
                let text = btn.querySelector("p:nth-child(1)");
                let message = new SpeechSynthesisUtterance(text.innerText);
                message.lang = 'en-US';
                speechSynthesis.cancel();
                window.speechSynthesis.speak(message);
            })
        })
    </script>
</body>

</html>
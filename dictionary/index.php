<?php
session_start();
require "../connection-db.php";

if (!isset($_SESSION["id"])) {
    echo "    <script>
        alert('Войдите в профиль');
        location.href = '/auth/';
    </script>";
}
$words = mysqli_fetch_all(mysqli_query($conn, "SELECT * FROM `user_words` join words on words.word_id = user_words.word_id where user_id = $id"),MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../components/head.php"; ?>

<body>
    <?php include "../components/header.php"; ?>
    <main class="container">
        <?php if(count($words) != 0):?>
        <h4>Слова</h4>
        <div class="wordgrid">
            <?php foreach ($words as $word): ?>
                <div class="wordbtn">
                    <div>
                        <p><?= $word["word_name"]?></p>
                        <p><?= $word["word_transcription"]?></p>
                        <p><?= $word["word_translate"]?></p>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
        <?php else:?>
            <h4>Пусто</h4>
        <?php endif;?>
    </main>
    <script>
        let letters = document.querySelectorAll(".wordbtn");
        letters.forEach(btn => {
            btn.addEventListener("click", () => {
                let text = btn.querySelector("p:nth-child(1)");
                let message = new SpeechSynthesisUtterance(text.innerText[0]);
                message.lang = 'en-US';
                speechSynthesis.cancel();
                window.speechSynthesis.speak(message);

            })
        })
    </script>
</body>

</html>
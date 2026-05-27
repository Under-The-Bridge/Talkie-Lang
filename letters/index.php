<?php
require "../connection-db.php";
require "../clearSession.php";

if (!isset($_SESSION["id"])) {
    echo "    <script>
        alert('Войдите в профиль');
        location.href = '/welcome/';
    </script>";
}
$json = file_get_contents('letters.json');
$data = json_decode($json,true);
$lang = $_SESSION['lang'];
$lang_name = mysqli_fetch_array(mysqli_query($conn,"select * from langs where lang_id = $lang"))[1];
$letters = $data[$lang_name]['alphabet'];
?>
<!DOCTYPE html>
<html lang="en">


<?php include "../components/head.php"; ?>

<body>
    <?php include "../components/header.php"; ?>
    <main class="container">
        <h4><?=$lang_name?> алфавит</h4>
        <div class="grid">
            <?php foreach($letters as $letter):?>
            <div class="tbtn">
                <div>
                    <p><?=$letter["letter"]?></p>
                    <p><?=$letter["transcription"]?></p>
                </div>
            </div>
            <?php endforeach;?>
<!-- 
            <div class="tbtn">
                <div>
                    <p>Aa</p>
                    <p>[ei]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Bb</p>
                    <p>[bi:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Cc</p>
                    <p>[si:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Dd</p>
                    <p>[di:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Ee</p>
                    <p>[i:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Ff</p>
                    <p>[ef]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Gg</p>
                    <p>[dʒi:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Hh</p>
                    <p>[eitʃ]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Ii</p>
                    <p>[ai]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Jj</p>
                    <p>[dʒei]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Kk</p>
                    <p>[kei]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Ll</p>
                    <p>[el]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Mm</p>
                    <p>[em]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Nn</p>
                    <p>[en]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Oo</p>
                    <p>[ou]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Pp</p>
                    <p>[pi:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Qq</p>
                    <p>[kju:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Rr</p>
                    <p>[a:r]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Ss</p>
                    <p>[es]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Tt</p>
                    <p>[ti:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Uu</p>
                    <p>[ju:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Vv</p>
                    <p>[vi:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Ww</p>
                    <p>[ˈdʌblju:]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Xx</p>
                    <p>[eks]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Yy</p>
                    <p>[wai]</p>
                </div>
            </div>

            <div class="tbtn">
                <div>
                    <p>Zz</p>
                    <p>[zed]</p>
                </div> -->
            </div>
        </div>
    </main>
    <script>
        let letters = document.querySelectorAll(".tbtn");
        letters.forEach(btn => {
            btn.addEventListener("click", () => {
                let text = btn.querySelector("p:nth-child(1)");
                let message = new SpeechSynthesisUtterance(("<?=$lang_name?>" == "Японский") ? text.innerText : text.innerText[0]);
                message.lang = 'en-US';
                speechSynthesis.cancel();
                window.speechSynthesis.speak(message);

            })
        })
    </script>
</body>

</html>
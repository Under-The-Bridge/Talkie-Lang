<?php
$lesson_id = $_GET["id"];
$progress = $_GET["prog"] ?? 0;
$mistakes = $_GET["mistakes"] ?? 0;

$temp = "";
if(strpos($_SERVER['REQUEST_URI'],"&w")){
    $l = $_SERVER['REQUEST_URI'];
    for ($i=strpos($l,"&w"); $i < strlen($l); $i++) { 
        $temp .= $l[$i];
    }
    $l = $temp;
}
if ($progress == 10) {
    header("location: /en/lesson-end/?mistakes=$mistakes$temp");
}
session_start();
$conn = mysqli_connect("localhost", "root", "", "Lang");
$sql = "select * from lesson join lessons_words on lesson.lesson_id = lessons_words.lesson_id join words on words.word_id = lessons_words.word_id where lesson.lesson_id = $lesson_id";
$w = [];
$words = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);

$w1 = [];
$w2 = [];
foreach ($words as $word) {
    array_push($w1, $word["word_translate"]);
}
foreach ($words as $word) {
    array_push($w2, [$word["word_translate"], $word["word_name"]]);
}
shuffle($w1);
shuffle($w2);

shuffle($words);
foreach ($words as $word) {
    array_push($w, $word["word_id"]);
}
$rand_word = $w[array_rand($w)];
$sql = "select * from words where word_id = $rand_word";
$word = mysqli_fetch_array(mysqli_query($conn, $sql));
$rand = rand(1, 2);
$link = $_SERVER['PHP_SELF'];
$progress++;
$noMistakes = $mistakes;
$mistakes = $mistakes + 1;
$hrefBad = "$link?id=$lesson_id&prog=$progress&mistakes=$mistakes".$temp;
$hrefGood = "$link?id=$lesson_id&prog=$progress&mistakes=$noMistakes".$temp;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <script src="../../assets/js/bootstrap.bundle.min.js" async defer></script>
    <title>Document</title>
    <link rel="stylesheet" href="../../lesson_tests/temp.css">
</head>
<!-- <?php //include "../../lesson_tests/test-$rand.php" ?> -->

<body>
    <main class="container">
        <div class="q">
            <h1>Переведи</h1>
            <div class="t">
                <h2>
                    <?= $word[1] ?>
                    <div class="hover">
                        <p>
                            <?= $word[2] ?>
                        </p>
                        <p>
                            <?= $word[3] ?>
                        </p>
                    </div>
            </div>
            </h2>
            <div id="answers">
                <?php foreach ($words as $wo): ?>
                    <button value="<?= $wo["word_id"] ?>">
                        <div>
                            <?= $wo["word_translate"] ?>
                        </div>
                    </button>
                <?php endforeach; ?>
            </div>
        </div>
    </main>
</body>
<script>
    let buttons = document.querySelectorAll("#answers>button");
    let answered = false;
    let userAns;
    let answer = "<?= $word[3] ?>";
    buttons.forEach(butt => {
        butt.addEventListener("click", () => {
            if (!answered) {
                userAns = butt.getAttribute("value");
                if (butt.innerText == answer) {
                    butt.classList.add("good");
                    next(false);
                } else {
                    butt.classList.add("bad");
                    next(true);
                }
                answered = true;
            }
        })
    });


    let hrefGood = '<?= $hrefGood ?>';
    let hrefBad = '<?= $hrefBad ?>';

    function next(mistake) {
        hrefGood += "&word<?= $progress ?>=<?= $word[0] ?>&ans<?= $progress ?>=" + userAns;
        hrefBad += "&word<?= $progress ?>=<?= $word[0] ?>&ans<?= $progress ?>=" + userAns;
        let nextBad = `
        <div class="alert alert-danger" role="alert">
                <p>Правильный ответ: <?= $word[3] ?></p>
                <a class="alert-link" href=`+ hrefBad + `>Дальше</a>
            </div>
            `;
        let nextGood = `
            <div class="alert alert-success" role="alert">
            <p>Всё верно!</p>
            <a class="alert-link" href=`+ hrefGood + `>Дальше</a>
            </div>
            `;
        if (mistake) {
            document.querySelector(".container").innerHTML += nextBad;
        } else {
            document.querySelector(".container").innerHTML += nextGood;
        }
    }
</script>

</html>
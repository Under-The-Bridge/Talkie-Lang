<?php
$lang = mysqli_fetch_array(mysqli_query($conn, "select lesson_language from lesson where lesson_id = $lesson_id"))[0];
$sql = "select * from lesson join lessons_words on lesson.lesson_id = lessons_words.lesson_id join words on words.word_id = lessons_words.word_id where lesson.lesson_id = $lesson_id";
$w = [];
$words = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);
shuffle($words);
foreach ($words as $word) {
    array_push($w, $word["word_id"]);
}

$rand_word = $w[array_rand($w)];
$sql = "select * from words where word_id = $rand_word";
$word = mysqli_fetch_assoc(mysqli_query($conn, $sql));

$words = array_slice($words, 0, 4);

$check = true;


foreach ($words as $wo) {
    if (in_array($word["word_id"], $wo)) {
        $check = false;
        break;
    }
}
if ($check) {
    $words[array_rand($words)] = $word;
}
?>

<main class="container">
    <a href="/?lang=<?= $lang ?>" class="btn btn-danger mb-2">Выйти</a>
    <div class="progressbar">
        <div class="bar"></div>
    </div>
    <div class="q my-auto">
        <div class="lesson-word">
            <h1>Переведи на русский язык</h1>
            <div class="t">
                <h2 class="wrd">
                    <?= $word["word_name"] ?>
                    <div class="word-hover">
                        <p>
                            <?= $word["word_transcription"] ?>
                        </p>
                        <p>
                            <?= $word["word_translate"] ?>
                        </p>
                    </div>
                </h2>
            </div>
        </div>
        <div id="answers">
            <?php foreach ($words as $wo): ?>
                <button value="<?= $wo["word_id"] ?>">
                    <div class="w">
                        <?= $wo["word_translate"] ?>
                    </div>
                </button>
            <?php endforeach; ?>
        </div>
    </div>
    <div class="alert alert-success hidden" role="alert">
        <p>Всё верно!</p>
    </div>
</main>
<script>
    let prog = <?= $progress - 1 ?>;
    let bar = document.querySelector('.bar');
    document.addEventListener('DOMContentLoaded', () => {
        bar.setAttribute("style", "width: calc(100%*" + prog + "/<?= $lessonSize ?>);");
    })

    let buttons = document.querySelectorAll("#answers>button");
    let answered = false;
    let userAns;
    let answer = "<?= $word["word_translate"] ?>";
    buttons.forEach(butt => {
        butt.addEventListener("click", () => {
            if (!answered) {
                prog++;
                bar.setAttribute("style", "width: calc(100%*" + prog + "/<?= $lessonSize ?>);");
                userAns = butt.getAttribute("value");
                if (butt.innerText == answer) {
                    butt.classList.add("good");
                    next(false);
                    sendData(false);
                } else {
                    butt.classList.add("bad");
                    next(true);
                    sendData(true);
                }
                answered = true;
            }
        })
    });


    let href = '<?= $href ?>';

    function next(mistake) {
        document.querySelector('.alert.hidden').remove();
        let nextBad = `
            <div class="alert alert-danger bad" role="alert">
                    <p>Правильный ответ: <?= $word["word_translate"] ?></p>
                    <a class="alert-link" href=`+ href + `>Дальше</a>
                </div>
                `;
        let nextGood = `
                <div class="alert alert-success good" role="alert">
                <p>Всё верно!</p>
                <a class="alert-link" href=`+ href + `>Дальше</a>
                </div>
                `;
        if (mistake) {
            document.querySelector(".container").innerHTML += nextBad;
        } else {
            document.querySelector(".container").innerHTML += nextGood;
        }
    }

    function sendData(m) {
        let progress = <?= $progress ?>;
        let mistakes;
        if (m) {
            mistakes = <?= $mistakes ?>;
        } else {
            mistakes = <?= $noMistakes ?>;
        }
        let word = <?= $word["word_id"] ?>;
        let ans = userAns;
        let type = 'toRu';
        let fd = new FormData();
        fd.append("mistakes", mistakes);
        fd.append("progress", progress);
        fd.append("word", word);
        fd.append("ans", ans);
        fd.append("type", type);
        fetch("score.php", {
            method: "post",
            body: fd
        })
    }
</script>
<?php
$sql = "select * from lesson join lessons_words on lesson.lesson_id = lessons_words.lesson_id join words on words.word_id = lessons_words.word_id where lesson.lesson_id = $lesson_id";
$w = [];
$words = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);
shuffle($words);
foreach ($words as $word) {
    array_push($w, $word["word_id"]);
}
$rand_word = $w[array_rand($w)];
$sql = "select * from words where word_id = $rand_word";
$word = mysqli_fetch_array(mysqli_query($conn, $sql));
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
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Document</title>
    <link rel="stylesheet" href="../../lesson_tests/temp.css">
</head>

<body>
    <main class="container">
        <div class="q">
            <a href="/en/" class="btn btn-danger mb-2">Выйти</a>
            <div class="progressbar">
                <div class="bar"></div>
            </div>
            <h1>Соедени переводы</h1>
            <div id="answers">
                <div class="column">
                    <?php foreach ($w1 as $w): ?>
                        <button class="word">
                            <div><?= $w ?></div>
                        </button>
                    <?php endforeach; ?>
                </div>
                <div class="column">
                    <?php foreach ($w2 as $w): ?>
                        <button class="translate">
                            <div value="<?= $w[0] ?>"><?= $w[1] ?></div>
                        </button>
                    <?php endforeach; ?>
                </div>
                <!-- <button>вапп</button> -->
                <!-- <button><?= $answer ?></button> -->
                <!-- <button>выавыа</button> -->
            </div>
        </div>
    </main>
</body>
<script>
    let buttons_word = document.querySelectorAll("#answers>.column>button.word");
    let buttons_translate = document.querySelectorAll("#answers>.column>button.translate");
    let prog = <?= $progress - 1 ?>;
    let bar = document.querySelector('.bar');
    document.addEventListener('DOMContentLoaded', () => {
        bar.setAttribute("style", "width: calc(100%*" + prog + "/<?= $lessonSize ?>);");
    })

    buttons_word.forEach(butt => {
        butt.addEventListener("click", () => {
            ru_speak(butt.children[0].innerHTML);
            if (butt.classList[1] != "good") {
                buttons_word.forEach(e => { e.classList.remove("selected") });
                if (butt.classList[1] != "bad") {
                    if (butt.classList[1] == "selected") {
                        butt.classList.remove("selected");
                    } else {
                        butt.classList.add("selected");
                    }
                    checkWords();
                } else {
                    butt.classList.remove("bad");
                }
            }



            // butt.classList.remove("bad");
            // if (butt.classList[1] != "good") {
            //     buttons_word.forEach(e => { e.classList.remove("selected") });
            //     if (butt.classList[1] == "selected") {
            //         butt.classList.remove("selected");
            //     } else {
            //         butt.classList.add("selected");
            //     }
            //     checkWords()
            // } else {
            //     buttons_word.forEach(e => { e.classList.remove("good") });
            // }
        })
    });

    buttons_translate.forEach(butt => {
        butt.addEventListener("click", () => {
            ru_speak(butt.children[0].innerHTML);
            if (butt.classList[1] != "good") {
                buttons_translate.forEach(e => { e.classList.remove("selected") });
                if (butt.classList[1] != "bad") {
                    if (butt.classList[1] == "selected") {
                        butt.classList.remove("selected");
                    } else {
                        butt.classList.add("selected");
                    }
                    checkWords();
                } else {
                    butt.classList.remove("bad");
                }
            }


            // console.log(butt.classList);
            // if (butt.classList[1] != "bad") {
            //     en_speak(butt.children[0].innerHTML)
            //     butt.classList.remove("bad");
            //     if (butt.classList[1] != "good") {
            //         buttons_translate.forEach(e => { e.classList.remove("selected") });
            //         if (butt.classList[1] == "selected") {
            //             butt.classList.remove("selected");
            //         } else {
            //             butt.classList.add("selected");
            //         }
            //         checkWords();
            //     }
            // } else {
            //     buttons_translate.forEach(e => { e.classList.remove("bad") });
            // }
        })
    });

    function checkWords() {
        let word = document.querySelector("button.word.selected>div");
        let translate = document.querySelector("button.translate.selected>div");
        console.log(word);
        console.log(translate);
        if (word.innerHTML == translate.getAttribute("value")) {
            word.parentNode.classList.add("good");
            translate.parentNode.classList.add("good");
            buttons_word.forEach(e => { e.classList.remove("selected") });
            buttons_translate.forEach(e => { e.classList.remove("selected") });
        } else {
            word.parentNode.classList.add("bad");
            translate.parentNode.classList.add("bad");
            buttons_word.forEach(e => { e.classList.remove("selected") });
            buttons_translate.forEach(e => { e.classList.remove("selected") });
        }
        checkAll();
    }

    function en_speak(text) {
        const message = new SpeechSynthesisUtterance();
        message.lang = "en-US";
        message.text = text;
        window.speechSynthesis.speak(message);
    }
    function ru_speak(text) {
        const message = new SpeechSynthesisUtterance();
        message.lang = "ru-RU";
        message.text = text;
        window.speechSynthesis.speak(message);
    }
    function jp_speak(text) {
        const message = new SpeechSynthesisUtterance();
        message.lang = "ja-JP";
        message.text = text;
        window.speechSynthesis.speak(message);
    }


    function checkAll() {
        let canNext = true;
        document.querySelectorAll("button").forEach(el => {
            if (el.classList[1] != "good" || el.classList[1] == undefined) {
                canNext = false;
            }
        });
        if (canNext) next();
    }

    function next() {
        sendData();
        prog++;
        bar.setAttribute("style", "width: calc(100%*" + prog + "/<?= $lessonSize ?>);");
        let href = '<?= $href ?>';
        let link = `
                <div class="alert alert-success" role="alert">
                <p>Всё верно!</p>
                <a class="alert-link" href=`+ href + `>Дальше</a>
                </div>
                `;
        document.querySelector(".container").innerHTML += link;
    }


    function sendData() {
        let progress = <?= $progress ?>;
        let fd = new FormData();
        fd.append("progress", progress);
        fetch("score.php", {
            method: "post",
            body: fd
        })
    }
</script>
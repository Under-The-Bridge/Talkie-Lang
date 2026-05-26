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

<main class="container">
    <div class="d-flex justify-content-end">
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Вы уверены?</h1>
                        <div type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></div>
                    </div>
                    <div class="modal-body">
                        Прогресс не сохраниться, прийдется заного всё пройти!
                    </div>
                    <div class="modal-footer">
                        <div type="button" class="btn btn-secondary exit-test" data-bs-dismiss="modal">Остаться</div>
                        <a href="/?lang=<?= $lang ?>" class="btn btn-primary exit-test">Выйти</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="btn btn-danger mb-2 exit-test" data-bs-toggle="modal" data-bs-target="#exampleModal">Выйти</div>
    </div>
    <div class="progressbar">
        <div class="bar"></div>
        <div class="d-flex justify-content-end mt-3 heart-container">
            <?php for ($i = $attempt; $i >= 0; $i--): ?>
                <svg class="me-1" xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="#e0524d"
                    class="bi bi-heart-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
                </svg>
            <?php endfor; ?>
        </div>
    </div>
    <div class="q my-auto" style="gap:2.5%">
        <div class="lesson-word">
            <h1>Соедени переводы</h1>
        </div>
        <div id="answers">
            <div class="column">
                <?php foreach ($w1 as $w):
                    $wt = mysqli_fetch_assoc(mysqli_query($conn, "select * from words where word_translate = '$w' and lang_id = $lang")) ?>
                    <button class="word">
                        <div class="w"><?= $w ?></div>
                        <div class="word-hover" style="transform: translateX(-165%);">
                            <p>
                                <?= $wt["word_transcription"] ?>
                            </p>
                            <p>
                                <?= $wt["word_name"] ?>
                            </p>
                        </div>
                    </button>
                <?php endforeach; ?>
            </div>
            <div class="column">
                <?php foreach ($w2 as $w): ?>
                    <button class="translate">
                        <div class="w" value="<?= $w[0] ?>"><?= $w[1] ?></div>
                    </button>
                <?php endforeach; ?>
            </div>
            <!-- <button>вапп</button> -->
            <!-- <button><?= $answer ?></button> -->
            <!-- <button>выавыа</button> -->
        </div>
    </div>
    <div class="alert alert-success hidden" role="alert">
        <p>Всё верно!</p>
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
        })


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
        speechSynthesis.cancel();
        window.speechSynthesis.speak(message);
    }
    function ru_speak(text) {
        const message = new SpeechSynthesisUtterance();
        message.lang = "ru-RU";
        message.text = text;
        speechSynthesis.cancel();
        window.speechSynthesis.speak(message);
    }
    function jp_speak(text) {
        const message = new SpeechSynthesisUtterance();
        message.lang = "ja-JP";
        message.text = text;
        speechSynthesis.cancel();
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
        document.querySelector('.alert.hidden').remove();
        sendData();
        prog++;
        bar.setAttribute("style", "width: calc(100%*" + prog + "/<?= $lessonSize ?>);");
        let href = '<?= $href ?>';
        let link = `
                <div class="alert alert-success good" role="alert">
                <p>Всё верно!</p>
                <a class="alert-link" href=`+ href + `>Дальше</a>
                </div>
                `;
        document.querySelector(".container").innerHTML += link;
        document.addEventListener("keydown", function (event) {
            if (event.key === "Enter" || event.code == "Space") {
                event.preventDefault();
                window.location.href = href;
            }
        });
    }


    function sendData() {
        let progress = <?= $progress ?>;
        let word = [];
        document.querySelectorAll("button.word>div").forEach(w => {
            word.push(" " + w.innerText);
        })
        console.log(word);
        let fd = new FormData();
        fd.append("progress", progress);
        fd.append("word", word);
        fd.append("type", "list");
        fetch("score.php", {
            method: "post",
            body: fd
        })
    }
</script>
<body>
    <main>
        <h1>Соедени переводы</h1>
        <h2>qweqweew</h2>
        <div id="answers">
            <div class="column">
                <?php foreach ($w1 as $w): ?>
                    <button class="word">
                        <div><?= $w?></div>
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
    </main>
</body>
<script>
    let buttons_word = document.querySelectorAll("#answers>.column>button.word");
    let buttons_translate = document.querySelectorAll("#answers>.column>button.translate");

    buttons_word.forEach(butt => {
        butt.addEventListener("click", () => {
            ru_speak(butt.children[0].innerHTML);
            butt.classList.remove("bad");
            if (butt.classList.item(1) != "good") {
                buttons_word.forEach(e => { e.classList.remove("selected") });
                butt.classList.add("selected");
                checkWords()
            }
        })
    });

    buttons_translate.forEach(butt => {
        butt.addEventListener("click", () => {
            en_speak(butt.children[0].innerHTML)
            butt.classList.remove("bad");
            if (butt.classList.item(1) != "good") {
                buttons_translate.forEach(e => { e.classList.remove("selected") });
                if (butt.classList.item(1) == "selected") {
                    butt.classList.remove("selected");
                } else {
                    butt.classList.add("selected");
                }
                checkWords()
            }
        })
    });

    function checkWords() {
        let word = document.querySelector("button.word.selected>div");
        let translate = document.querySelector("button.translate.selected>div");
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
</script>
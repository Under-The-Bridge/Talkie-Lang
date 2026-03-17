<?php
require "connection-db.php";

$words = mysqli_fetch_all(mysqli_query($conn, "select * from words where lesson_id = 1"));
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap');

        * {
            transition: 0.15s ease-out;
        }

        :root {
            --main-color: #e0834d;
            --main-color-shadow: #c06b3a;
            --main-color-light: rgb(235, 155, 109);
            --green-color: #4de06d;
            --green-color-shadow: #2db64b;
            --red-color: #e0524d;
            --red-color-shadow: #b6362d;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: inter;
        }

        main {
            width: 1080px;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        #answers {
            width: 50%;
            align-self: center;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            justify-items: center;
        }

        button {
            height: 100px;
            width: 250px;
            padding: 4px;
            border-radius: 20px;
            background-color: var(--main-color);
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0px 10px 0px var(--main-color-shadow);
            font-size: 36px;
            font-weight: 900;
            color: var(--main-color);
            border: none;
        }

        button>div {
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 17px;
            width: 100%;
            height: 100%;
            background-color: white;
        }

        button:hover {
            >div {
                color: white;
                background-color: var(--main-color-light);
            }
        }

        button.selected {
            >div {
                color: white;
                background-color: var(--main-color);
            }
        }

        button.good {
            background-color: var(--green-color);
            box-shadow: 0px 10px 0px var(--green-color-shadow);

            >div {
                color: white;
                background-color: var(--green-color);
            }
        }

        button.bad {
            background-color: var(--red-color);
            box-shadow: 0px 10px 0px var(--red-color-shadow);

            >div {
                color: white;
                background-color: var(--red-color);
            }
        }
    </style>
</head>

<body>
    <main>
        <h1>Соедени переводы</h1>
        <h2>qweqweew</h2>
        <div id="answers">
            <?php for ($i = 0; $i < count($words); $i++): ?>
                <button class="word">
                    <div><?= $words[$i][2] ?></div>
                </button>
                <button class="translate">
                    <div value="<?= $words[$i][2] ?>"><?= $words[$i][1] ?></div>
                </button>
            <?php endfor; ?>
            <!-- <button>вапп</button> -->
            <!-- <button><?= $answer ?></button> -->
            <!-- <button>выавыа</button> -->
        </div>
    </main>
</body>
<script>
    let buttons_word = document.querySelectorAll("#answers>button.word");
    let buttons_translate = document.querySelectorAll("#answers>button.translate");

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
                if(butt.classList.item(1) == "selected"){
                    butt.classList.remove("selected");
                }else{
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

</html>
<?php
require "connection-db.php";

$word = mysqli_fetch_array(mysqli_query($conn, "select * from words where word_id = 1"));
$words = mysqli_fetch_all(mysqli_query($conn, "select * from words where lesson_id = 1"));
$answer = $word[2];
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
            justify-items: center;
        }

        button {
            height: 50px;
            width: 50px;
            padding: 4px;
            border-radius: 20px;
            background-color: var(--main-color);
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0px 10px 0px var(--main-color-shadow);
            font-size: 28px;
            font-weight: 900;
            color: var(--main-color);
            border: none;
        }


        h3{
            text-transform: uppercase;
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

        .row {
            display: flex;
        }
    </style>
</head>

<body>
    <main>
        <h1>Напиши на англ</h1>
        <h2><?= $word[1] ?></h2>
        <h3></h3>
        <div id="answers">
            <div class="row">
                <button>
                    <div>Q</div>
                </button>
                <button>
                    <div>W</div>
                </button>
                <button>
                    <div>E</div>
                </button>
                <button>
                    <div>R</div>
                </button>
                <button>
                    <div>T</div>
                </button>
                <button>
                    <div>Y</div>
                </button>
                <button>
                    <div>U</div>
                </button>
                <button>
                    <div>I</div>
                </button>
                <button>
                    <div>O</div>
                </button>
                <button>
                    <div>P</div>
                </button>
                <button>
                    <div><</div>
                </button>
            </div>
            <div class="row">
                <button>
                    <div>A</div>
                </button>
                <button>
                    <div>S</div>
                </button>
                <button>
                    <div>D</div>
                </button>
                <button>
                    <div>F</div>
                </button>
                <button>
                    <div>G</div>
                </button>
                <button>
                    <div>H</div>
                </button>
                <button>
                    <div>J</div>
                </button>
                <button>
                    <div>K</div>
                </button>
                <button>
                    <div>L</div>
                </button>
            </div>
            <div class="row">
                <button>
                    <div>Z</div>
                </button>
                <button>
                    <div>X</div>
                </button>
                <button>
                    <div>C</div>
                </button>
                <button>
                    <div>V</div>
                </button>
                <button>
                    <div>B</div>
                </button>
                <button>
                    <div>N</div>
                </button>
                <button>
                    <div>M</div>
                </button>
            </div>
        </div>
    </main>
</body>
<script>
    let buttons = document.querySelectorAll("button");
    let word = "";

    buttons.forEach(butt => {
        butt.addEventListener("click", () => {
            if (butt.children[0].innerHTML == "&lt;") {
                word = word.slice(0, -1);
            } else {
                word += butt.children[0].innerHTML;
            }
            console.log(word);
            change();
        })
    });

    document.addEventListener("keydown",(e)=>{
        if(e.key == "Backspace"){
            word = word.slice(0, -1);
        }
        if(/^[a-zA-Z]$/.test(e.key)){
            word += e.key;
        }
        change();
    })
    function change() {
        document.querySelector("h3").innerText = word;
    }
</script>

</html>
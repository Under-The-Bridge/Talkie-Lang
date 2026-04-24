<?php
$conn = mysqli_connect("localhost","root","","Lang");
$lesson_id = $_GET["id"];
$sql = "select * from lesson join lessons_words on lesson.lesson_id = lessons_words.lesson_id join words on words.word_id = lessons_words.word_id where lesson.lesson_id = $lesson_id";
$w = [];
$words = mysqli_fetch_all(mysqli_query($conn,$sql),MYSQLI_ASSOC);
shuffle($words);
foreach ($words as $word) {
    array_push($w,$word["word_id"]);
}
$rand_word = $w[array_rand($w)];
$sql = "select * from words where word_id = $rand_word";
$word = mysqli_fetch_array(mysqli_query($conn,$sql));
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap');
        *{
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
        #answers{
            width: 50%;
            align-self: center;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            justify-items: center;
        }

        button{
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
        button>div{
            display: flex;
            justify-content: center;
            align-items: center;  
            border-radius: 17px;
            width: 100%;
            height: 100%;
            background-color: white;
        }
        button>div{
            display: flex;
            justify-content: center;
            align-items: center;  
            border-radius: 17px;
            width: 100%;
            height: 100%;
            background-color: white;
        }
        button:hover{
            >div{
                color: white;
                background-color: var(--main-color);
            }
        }
        button.good{
            background-color: var(--green-color);
            box-shadow: 0px 10px 0px var(--green-color-shadow);
            >div{
                color: white;
                background-color: var(--green-color);
            }
        }
        button.bad{
            background-color: var(--red-color);
            box-shadow: 0px 10px 0px var(--red-color-shadow);
            >div{
                color: white;
                background-color: var(--red-color);
            }
        }

        h2:hover{
            .hover{
                opacity: 1;

            }
        }
        .hover{
            transition: 0.15s ease-out;
            padding: 10px;
            border-radius: 0 20px 20px 20px;
            min-width: 100px;
            border: 2px solid;
            position: absolute;
            display: flex;
                            align-items: center;
                flex-direction: column;
                gap: 10px;
            opacity: 0;
            font-size: 60%;
            p{
                margin: 0;
            }
        }

        .t{
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: start;
            justify-content: center;
        }
    </style>
</head>

<body>
    <main>
        <h1>Переведи</h1>
        <div class="t">
            <h2><?=$word[1]?>
            <div class="hover">
                <p><?=$word[2]?></p>
                <p><?=$word[3]?></p>
            </div>
        </div>
    </h2>
        <div id="answers">
            <?php foreach($words as $wo): ?>
                <button>
                    <div><?=$wo["word_translate"]?></div>
                </button>
            <?php endforeach;?>
            <!-- <button>вапп</button> -->
            <!-- <button><?=$answer?></button> -->
            <!-- <button>выавыа</button> -->
        </div>
    </main>
</body>
<script>
    let buttons = document.querySelectorAll("#answers>button");

    buttons.forEach(butt => {
        butt.addEventListener("click",()=>{
            if(butt.innerText == "<?=$word["word_translate"]?>"){
                butt.classList.add("good");
            }else{
                butt.classList.add("bad");
            }
        })
    });
</script>

</html>
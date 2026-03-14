<?php
require "connection-db.php";

$word = mysqli_fetch_array(mysqli_query($conn,"select * from words where word_id = 1"));
$words = mysqli_fetch_all(mysqli_query($conn,"select * from words where lesson_id = 1"));
$answer = $word[2];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        main {
            width: 1280px;
            height: 100vh;
        }
        #answers{
            display: grid;
            grid-template-columns: 1fr 1fr;

        }
    </style>
</head>

<body>
    <main>
        <h1>впаываыва</h1>
        <h2><?=$word[1]?></h2>
        <div id="answers">
            <?php for($i = 0; $i <  count($words); $i++): ?>
                <button><?=$words[$i][2]?></button>
            <?php endfor;?>
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
            if(butt.innerText == "<?=$answer?>"){
                alert("правильно")
            }else{
                alert("неправильно")
            }
        })
    });
</script>

</html>
<body>
<main>
    <h1>Переведи</h1>
    <div class="t">
        <h2><?= $word[1] ?>
            <div class="hover">
                <p><?= $word[2] ?></p>
                <p><?= $word[3] ?></p>
            </div>
    </div>
    </h2>
    <div id="answers">
        <?php foreach ($words as $wo): ?>
            <button>
                <div><?= $wo["word_translate"] ?></div>
            </button>
        <?php endforeach; ?>
        <!-- <button>вапп</button> -->
        <!-- <button><?= $answer ?></button> -->
        <!-- <button>выавыа</button> -->
    </div>
</main>
</body>
<script>
    let buttons = document.querySelectorAll("#answers>button");

    buttons.forEach(butt => {
        butt.addEventListener("click",()=>{
            if(butt.innerText == "<?=$answer?>"){
                butt.classList.add("good");
            }else{
                butt.classList.add("bad");
            }
        })
    });
</script>
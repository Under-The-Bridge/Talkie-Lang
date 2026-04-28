<body>
    <main class="container">
        <div class="q">
            <a href="/en/" class="btn btn-danger mb-2">Выйти</a>
            <div class="progressbar">
                <div class="bar"></div>
            </div>
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
    <script>
        let prog = <?= $progress - 1 ?>;
        let bar = document.querySelector('.bar');
        document.addEventListener('DOMContentLoaded', () => {
            bar.setAttribute("style","width: calc(100%*" + prog + "/<?=$lessonSize?>);");
        })

        let buttons = document.querySelectorAll("#answers>button");
        let answered = false;
        let userAns;
        let answer = "<?= $word[3] ?>";
        buttons.forEach(butt => {
            butt.addEventListener("click", () => {
                if (!answered) {
                    prog++;
                    bar.setAttribute("style","width: calc(100%*" + prog + "/<?=$lessonSize?>);");
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
            let nextBad = `
            <div class="alert alert-danger" role="alert">
                    <p>Правильный ответ: <?= $word[3] ?></p>
                    <a class="alert-link" href=`+ href + `>Дальше</a>
                </div>
                `;
            let nextGood = `
                <div class="alert alert-success" role="alert">
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
            let word = <?= $word[0] ?>;
            let ans = userAns;
            let type = 'some';
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
</body>

</html>
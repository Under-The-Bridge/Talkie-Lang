<?php
require "connection-db.php";
$count = $_GET["count"] ?? 0;
$countnext = $count + 1;
$lesson_id = $_GET["lesson_id"] ?? false;
$sql = "select * from lessons join words on words.lesson_id = lessons.lesson_id where lessons.lesson_id = $lesson_id limit 1 offset $count";
$lesson = mysqli_fetch_assoc(mysqli_query($conn, $sql));
$lesson_lenght = mysqli_num_rows(mysqli_query($conn, "select * from lessons join words on words.lesson_id = lessons.lesson_id where lessons.lesson_id = $lesson_id")) - 1;


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php include "components/header.php"; ?>
    <p>слово</p>
    <p><?= $lesson["word_word"] ?></p>
    <p>перевод</p>
    <p><?= $lesson["word_translate"] ?></p>
    <p>транскрипция</p>
    <p><?= $lesson["word_transcription"] ?></p>
    <?php if ($count != $lesson_lenght): ?>
        <a href="?lesson_id=<?= $lesson_id ?>&count=<?= $countnext ?>">далее</a>
    <?php else: ?>
        <a href="testing.php?lesson_id=<?=$lesson_id?>">пройти тестирование</a>
    <?php endif; ?>

</body>

</html>
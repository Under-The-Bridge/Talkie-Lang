<?php
require "connection-db.php";
$count = $_GET["count"] ?? 0;
$countnext = $count + 1;
$lesson_id = $_GET["lesson_id"] ?? false;
$sql = "select * from lessons join words on words.lesson_id = lessons.lesson_id where lessons.lesson_id = $lesson_id limit 1 offset $count";
$lesson = mysqli_fetch_assoc(mysqli_query($conn, $sql));
$lesson_lenght = mysqli_num_rows(mysqli_query($conn, "select * from lessons join words on words.lesson_id = lessons.lesson_id where lessons.lesson_id = $lesson_id")) - 1;

$words = mysqli_fetch_all(mysqli_query($conn,"select word_id, word_word from words"));

print_r($words);
//get rus word from lesson

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php include "components/header.php";?>
    <p>переведите это слово на англ</p>
    <p><?=$lesson["word_translate"]?></p>
    <?php foreach ($words as $word):?>
        <a href="<?=$word[0]?>"><?=$word[1]?></a>
    <?php endforeach;?>
</body>
</html>
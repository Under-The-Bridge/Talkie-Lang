<?php
session_start();
require "../../connection-db.php";
$lessonSize = 2;


$lesson_id = $_GET["id"];
$progress = $_SESSION["progress"] ?? 0;

$mistakes = $_GET["mistakes"] ?? 0;
if ($progress == $lessonSize) {
    header("location: /en/lesson-end/?id=$lesson_id");
}
session_start();
$sql = "select * from lesson join lessons_words on lesson.lesson_id = lessons_words.lesson_id join words on words.word_id = lessons_words.word_id where lesson.lesson_id = $lesson_id";
$w = [];
$words = mysqli_fetch_all(mysqli_query($conn, $sql), MYSQLI_ASSOC);

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

shuffle($words);
foreach ($words as $word) {
    array_push($w, $word["word_id"]);
}
$rand_word = $w[array_rand($w)];
$sql = "select * from words where word_id = $rand_word";
$word = mysqli_fetch_array(mysqli_query($conn, $sql));
$rand = rand(1, 2);
$link = $_SERVER['PHP_SELF'];
$progress++;
$noMistakes = $mistakes;
$mistakes = $mistakes + 1;
$href = "$link?id=$lesson_id";


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Document</title>
    <link rel="stylesheet" href="../../lesson_tests/temp.css">
</head>
<?php include "../../lesson_tests/test-1.php" ?>

</html>
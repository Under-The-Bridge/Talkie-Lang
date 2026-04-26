<?php
session_start();
$conn = mysqli_connect("localhost","root","","Lang");
$lesson_id = $_GET["id"];
$sql = "select * from lesson join lessons_words on lesson.lesson_id = lessons_words.lesson_id join words on words.word_id = lessons_words.word_id where lesson.lesson_id = $lesson_id";
$w = [];
$words = mysqli_fetch_all(mysqli_query($conn,$sql),MYSQLI_ASSOC);

$w1 = [];
$w2 = [];
foreach($words as $word){
    array_push($w1,$word["word_translate"]);
}
foreach($words as $word){
    array_push($w2,[$word["word_translate"],$word["word_name"]]);
}
shuffle($w1);
shuffle($w2);

shuffle($words);
foreach ($words as $word) {
    array_push($w,$word["word_id"]);
}
$rand_word = $w[array_rand($w)];
$sql = "select * from words where word_id = $rand_word";
$word = mysqli_fetch_array(mysqli_query($conn,$sql));
$rand = rand(1,2);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../lesson_tests/temp.css">
</head>
    <?php include "../../lesson_tests/test-$rand.php"?>

</html>

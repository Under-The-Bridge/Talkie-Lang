<?php
session_start();
require "../../connection-db.php";
$lessonSize = 4;


$lesson_id = $_GET["id"];
$progress = $_SESSION["progress"] ?? 0;
$mistakes = $_SESSION["mistakes"] ?? 0;

if ($progress == $lessonSize) {
    header("location: /en/lesson-end/?id=$lesson_id");
}
// $w1 = [];
// $w2 = [];
// foreach ($words as $word) {
//     array_push($w1, $word["word_translate"]);
// }
// foreach ($words as $word) {
//     array_push($w2, [$word["word_translate"], $word["word_name"]]);
// }
// shuffle($w1);
// shuffle($w2);
$rand = rand(1,3);
$link = $_SERVER['PHP_SELF'];
$progress++;
$noMistakes = $mistakes;
$mistakes = $mistakes + 1;
$href = "$link?id=$lesson_id";


?>
<?php include "../../lesson_tests/test-".$rand.".php" ?>

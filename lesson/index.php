<?php
session_start();
require "../connection-db.php";
$lessonSize = 15;
$maxMistake = 5;
$lesson_id = $_GET["id"];
if (isset($_GET["c"])) {
    require "../clearSession.php";
    $_SESSION["lesson_time"] = time();
    $_SESSION["lesson_count"] = $_GET["c"];
    if ($_GET["c"] == 3) {
        // echo "c";
    }
}
if(isset($_SESSION["lesson_count"])){
    if($_SESSION["lesson_count"] == 3){
        $maxMistake = 3;
        $lessonSize = 20;
    }
}
$progress = $_SESSION["progress"] ?? 0;
$mistakes = $_SESSION["mistakes"] ?? 0;

if ($progress == $lessonSize) {
    header("location: /lesson-end/?id=$lesson_id");
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
$attempt = $maxMistake - $mistakes;

if($attempt < 0){
    $_SESSION["fail"] = true;
    header("location: /lesson-end/?id=$lesson_id");
}

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

<body>

    <?php include "../lesson_tests/test-" . $rand . ".php" ?>
</body>

</html>
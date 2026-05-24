<?php
session_start();
require "../connection-db.php";
$lessonSize = 1;

$lesson_id = $_GET["id"];
if(isset($_GET["c"])){
    $_SESSION["lesson_time"] = time();
    $_SESSION["lesson_count"] = $_GET["c"];
    if($_GET["c"] == 3){
        // echo "c";
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
$rand = rand(1,1);
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

<body>
    
<?php include "../lesson_tests/test-".$rand.".php" ?>
</body>
</html>
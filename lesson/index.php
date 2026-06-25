<?php
$json = file_get_contents('../config.json');
$config = json_decode($json,true);
require "../connection-db.php";
$lessonSize = $config["lesson_size"];
$maxMistake = $config["lesson_mistakes"];
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
        $lessonSize = $config["lesson_test_size"];
        $maxMistake = $config["lesson_test_mistakes"];
    }
}
$progress = $_SESSION["progress"] ?? 0;
$mistakes = $_SESSION["mistakes"] ?? 0;

if ($progress == $lessonSize) {
    header("location: /lesson-end/?id=$lesson_id");
}
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
    <script src="../../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/style.css">
    <title>Document</title>
    <link rel="stylesheet" href="../../lesson_tests/temp.css">
</head>

<body>

    <?php include "../lesson_tests/test-" . $rand . ".php" ?>
</body>

</html>
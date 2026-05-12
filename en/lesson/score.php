<?php
session_start();
require "../connection-db.php";
$id = $_SESSION["id"];
$mistakes = $_POST["mistakes"] ?? false;
$progress = $_POST["progress"] ?? false;
$word = $_POST["word"] ?? false;
$ans = $_POST["ans"] ?? false;
$type = $_POST["type"] ?? false;


if(mysqli_num_rows(mysqli_query($conn, "SELECT * FROM `user_words` WHERE user_id = $id and word_id = $word")) == 0){
    mysqli_query($conn, "INSERT INTO `user_words`(`user_id`, `word_id`) VALUES ('$id','$word')");
}


if (!isset($_SESSION["lesson"])) {
    $_SESSION["lesson"] = array();
}
if ($progress) {
    $_SESSION["progress"] = $progress;
}
if ($mistakes) {
    $_SESSION["mistakes"] = $mistakes;
}
if ($word || $ans || $type) {
    array_push($_SESSION["lesson"], [$_POST["word"], $_POST["ans"], $_POST["type"]]);
}
?>
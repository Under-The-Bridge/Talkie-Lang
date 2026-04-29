<?php
session_start();
$mistakes = $_POST["mistakes"] ?? false;
$progress = $_POST["progress"] ?? false;
$word = $_POST["word"] ?? false;
$ans = $_POST["ans"] ?? false;
$type = $_POST["type"] ?? false;





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
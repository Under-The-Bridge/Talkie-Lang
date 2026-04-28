<?php
session_start();
$mistakes = $_POST["mistakes"] ?? false;
$progress = $_POST["progress"] ?? false;
$word = $_POST["word"] ?? false;
$ans = $_POST["ans"] ?? false;
$type = $_POST["type"] ?? false;

$_SESSION["mistakes"] = $mistakes;
$_SESSION["progress"] = $progress;

if (!isset($_SESSION["lesson"])) {
    $_SESSION["lesson"] = array();
}
if ($word || $ans || $type){
    array_push($_SESSION["lesson"], [$_POST["word"], $_POST["ans"], $_POST["type"]]);
}
print_r($_SESSION["lesson"]);
echo "<br>";
echo ($_SESSION["progress"]);
echo "<br>";
echo ($_SESSION["mistakes"]);
?>
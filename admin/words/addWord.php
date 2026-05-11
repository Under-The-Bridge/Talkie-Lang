<?php
require "../../connection-db.php";
$name = trim($_POST["name"]);
$transcription = trim($_POST["transcription"]);
$translate = trim($_POST["translate"]);
$lang = $_POST["lang"];
$check = [$name, $transcription, $translate, $lang];
foreach ($check as $c) {
    if (empty($c)) {
        echo "<script>
            alert('Пустые поля');
            window.history.back();
            </script>";
        exit();
    }
}
$sql = "INSERT INTO `words`(`word_name`, `word_transcription`, `word_translate`, `lang_id`) VALUES ('$name','[$transcription]','$translate','$lang')";
$query = mysqli_query($conn, $sql);
if ($query) {
    echo "<script>
                alert('Добавлено');
                location.href = '/admin/words/';
                </script>";
} else {
    echo "<script>
                alert('Ошибка');
                location.href = '/admin/words/';
                </script>";
}
?>
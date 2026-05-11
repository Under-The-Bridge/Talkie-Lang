<?php
require "../../connection-db.php";

$title = trim($_POST["name"]);
$lang = $_POST["lang"] ?? false;

if (empty($title)) {
    echo "<script>
            alert('Пустое название');
            window.history.back();
            </script>";
    exit();
}
if (mysqli_num_rows(mysqli_query($conn, "select * from lesson where lesson_name = '$title' and lesson_language = '$lang'")) != 0) {
    echo "<script>
            alert('Такой урок уже существует');
            window.history.back();
            </script>";
    exit();
}
$check = [];
foreach ($_POST as $key => $word) {
    if (str_contains($key, "word")) {
        array_push($check, $word);
    }
}

if (empty($check)) {
    echo "<script>
            alert('Нет слов');
            window.history.back();
            </script>";
    exit();
}

if (count($check) != count(array_unique($check))) {
    echo "<script>
            alert('Слова повторяются');
            window.history.back();
            </script>";
    exit();
}

mysqli_query($conn, "INSERT INTO `lesson`(`lesson_name`, `lesson_language`) VALUES ('$title','$lang')");
$id = mysqli_fetch_array(mysqli_query($conn, "select * from lesson where lesson_name = '$title' and lesson_language = '$lang'"))[0];
foreach ($check as $key => $word) {
    mysqli_query($conn, "INSERT INTO `lessons_words`(`lesson_id`, `word_id`) VALUES ('$id'," . $word . ")");
}
echo "<script>
            alert('Добавлено');
            location.href = '/admin/add_lesson/';
            </script>";
exit();
?>
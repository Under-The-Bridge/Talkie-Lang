<?php
require "../../connection-db.php";
$title = trim($_POST["name"]);

if (empty($title)) {
    echo "<script>
            alert('Пустое название');
            window.history.back();
            </script>";
    exit();
}
mysqli_query($conn,"INSERT INTO `langs`(`lang_name`) VALUES ('$title')");
echo "<script>
            alert('Добавлено');
            location.href = '/admin/add_language/';
            </script>";
exit();
?>
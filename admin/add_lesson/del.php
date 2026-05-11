<?php
require "../../connection-db.php";
$id = $_GET["id"];
mysqli_query($conn,"DELETE FROM lesson WHERE lesson_id = $id");
echo "<script>
            alert('Удалено');
            location.href = '/admin/add_lesson/';
            </script>";
?>
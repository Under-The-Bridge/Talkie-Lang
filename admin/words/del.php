<?php
require "../../connection-db.php";
$id = $_GET["id"];
mysqli_query($conn,"DELETE FROM words WHERE word_id = $id");
echo "<script>
            alert('Удалено');
            location.href = '/admin/words/';
            </script>";
?>
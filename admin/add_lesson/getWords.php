<?php

require "../../connection-db.php";

$lang_id = $_GET["id"];

$sql = "
Select * from words where lang_id = $lang_id";

$words = mysqli_fetch_all(mysqli_query($conn, $sql),MYSQLI_ASSOC);

foreach ($words as $word) {
    echo "
        <option value=".$word["word_id"].">
            ".$word["word_name"]." | ".$word["word_translate"]."
        </option>
    ";
}
<?php
require "../connection-db.php";
if (isset($_GET["clear"])) {
    $sql = "UPDATE `users` SET `user_pfp`='' where user_id=$id";
    $query = mysqli_query($conn, $sql);
    echo "<script>
                location.href='/profile';
                </script>";
} else {
    $id = $_SESSION["id"];
    $pfp = $_FILES["pfp"] ?? false;
    $letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

    $imagename = '';


    for ($i = 0; $i < 16; $i++) {
        $imagename .= $letters[random_int(0, strlen($letters) - 1)];
    }
    $imagename .= ".jpg";
    $sql = "UPDATE `users` SET `user_pfp`='$imagename' where user_id=$id";
    $query = mysqli_query($conn, $sql);
    if ($query) {
        $path = "../images/$imagename";

        $temp = $pfp["tmp_name"];

        move_uploaded_file($temp, $path);
        echo "<script>
        alert('Аватарка добавлена!')
                location.href='/profile';
                </script>";
    }

}
?>
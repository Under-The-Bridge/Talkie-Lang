<?php
session_start();
$conn = mysqli_connect("localhost","root","","Lang");
if(isset($_SESSION["id"])){
    $id = $_SESSION["id"];
    $user = mysqli_fetch_assoc(mysqli_query($conn, "select * from users join leagues on leagues.league_id = users.user_league where user_id = $id"));
}
<?php
require "../connection-db.php";
$sql = "SELECT * FROM `weekly_league` JOIN league_users on league_users.weekly_league_id = weekly_league.id JOIN users on users.user_id = league_users.user_id";
$sql = "SELECT * FROM `weekly_league`";
$weekly_league = mysqli_fetch_all(mysqli_query($conn, $sql),MYSQLI_ASSOC);
$upUser = [];
$downUser = [];
foreach ($weekly_league as $league) {
    $league_id = $league["id"];
    $sql = "select * from league_users JOIN users on users.user_id = league_users.user_id where weekly_league_id = '$league_id' ORDER by user_weekly_xp DESC limit 5";
    $query = mysqli_fetch_all(mysqli_query($conn, $sql),MYSQLI_ASSOC);
    foreach($query as $user){
        array_push($upUser,$user);
        // echo $user["user_login"]."<br>";
    }
    // echo "<br>";
    $sql = "select * from league_users JOIN users on users.user_id = league_users.user_id where weekly_league_id = '$league_id' ORDER by user_weekly_xp DESC, id ASC LIMIT 5 OFFSET 10"; 
    $query = mysqli_fetch_all(mysqli_query($conn, $sql),MYSQLI_ASSOC);
    foreach($query as $user){
        array_push($downUser,$user);
        // echo $user["user_login"]."<br>";
    }
    // echo "<br>";
}

foreach($upUser as $user){
    $user_id = $user["user_id"];
    $user_league = $user["user_league"];
    $leagues = mysqli_fetch_array(mysqli_query($conn,"SELECT count(*) FROM `leagues` where league_id <= $user_league"))[0];
    if(mysqli_num_rows(mysqli_query($conn,"SELECT * FROM `leagues` limit 1 OFFSET $leagues")) != 0){
        $league = mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM `leagues` limit 1 OFFSET $leagues"))[0];
        $sql = "UPDATE `users` SET `user_league`='$league', `user_weekly_xp` = '0' WHERE user_id = $user_id";
        mysqli_query($conn,$sql);
    }
}

foreach($downUser as $user){
    $user_id = $user["user_id"];
    $user_league = $user["user_league"];
    $leagues = mysqli_fetch_array(mysqli_query($conn,"SELECT count(*) - 2 FROM `leagues` where league_id <= $user_league"))[0];
    if($leagues <= -1) $leagues = 0;
    if(mysqli_num_rows(mysqli_query($conn,"SELECT * FROM `leagues` limit 1 OFFSET $leagues")) != 0){
        $league = mysqli_fetch_array(mysqli_query($conn,"SELECT * FROM `leagues` limit 1 OFFSET $leagues"))[0];
        $sql = "UPDATE `users` SET `user_league`='$league' WHERE user_id = $user_id";
        // echo $sql."<br>";
        mysqli_query($conn,$sql);
    }
}
mysqli_query($conn,"DELETE FROM `weekly_league`");
?>
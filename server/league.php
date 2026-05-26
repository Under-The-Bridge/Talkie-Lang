<?php
require "../connection-db.php";
$json = file_get_contents('../config.json');
$config = json_decode($json,true);
$time = time() + $config['league_time_reset'] * 3600;
// echo $time;
$leagues = mysqli_fetch_all(mysqli_query($conn,"SELECT * FROM `leagues`"),MYSQLI_ASSOC);
foreach($leagues as $league){
    // echo $league["league_name"]."<br>";
    $league_id = $league["league_id"];
    $users = mysqli_fetch_all(mysqli_query($conn, "select * from users where user_role = 'user' and user_league = '$league_id'"),MYSQLI_ASSOC);
    $u = [];
    foreach($users as $us){
        $user_id = $us["user_id"];
        if(mysqli_num_rows(mysqli_query($conn,"SELECT * FROM `league_users` WHERE `user_id` = $user_id")) != 0) continue;
        array_push($u,$us);
    }
    if(!empty($u)){
        $users = $u;
        shuffle($users);
        $users = array_chunk($users, 15);
        foreach($users as $u){
            $letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            
            $id_league = '';
            
            
            for ($i = 0; $i < 12; $i++) {
                $id_league .= $letters[random_int(0, strlen($letters) - 1)];
            }

            mysqli_query($conn,"INSERT INTO `weekly_league`(`id`,`league_id`,`time`) VALUES ('$id_league','$league_id','$time');");
            $league_users = [];
            for ($i=0; $i < count($u); $i++) { 
                if(!isset($u[$i])) break;
                $user_id = $u[$i]["user_id"];
                $user_league = $u[$i]["user_league"];
                if(mysqli_num_rows(mysqli_query($conn,"SELECT * FROM `league_users` WHERE `user_id` = $user_id")) != 0){
                };
                array_push($league_users,$u[$i]["user_id"]);
                $sql = "INSERT INTO `league_users`(`user_id`, `weekly_league_id`) VALUES ('$user_id','$id_league')";
                // print_r($u[$i]);
                // echo $u[$i]["user_id"]."<br>";
                mysqli_query($conn,$sql);
            }
            // echo "<br>";
        }
    }
}
?>
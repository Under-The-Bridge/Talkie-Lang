<?php 
$array = [1,2,3,4,5,6,7,8,9,10];

shuffle($array);

$num = $array[array_rand($array)];

echo $num;

echo "<br>";

$array = array_slice($array,0,4);

if(!in_array($num,$array)){
    $array[array_rand($array)] = $num;
}

print_r($array);
?>
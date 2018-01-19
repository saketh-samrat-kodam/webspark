<?php

$projectid = $_POST['projectid'];

$instance = $_POST['inselect'];

$type = $_POST['instype'];

$region = $_POST['insregion'];


$values = shell_exec("/var/www/html/sparc/ebin.sh '".$projectid."' '".$instance."' '".$type."' '".$region."' "); 

echo ("$values");

echo nl2br("$projectid \n $instance \n $type \n $region")
?>

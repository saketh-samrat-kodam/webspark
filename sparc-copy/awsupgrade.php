<?php

$region = $_POST['insregion'];

$type = $_POST['instype'];

$instance = $_POST['inselect'];


$values = shell_exec("python /var/www/html/sparc/upgrade_scripts/vertical_scale.py $region $type $instance");

echo "successfully upgraded $instance"

?>

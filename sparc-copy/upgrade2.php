<?php

foreach ($_POST['inselect'] as $instance)
#$instance=$_POST['inselect'];

#echo $instance."<br>";
if(isset($_POST['submit'])){
$Inst_type = $_POST['InstanceType'];  // Storing Selected Value In Variable
$region = $_POST['Region'};

#echo $selected_val;  // Displaying Selected Value
}
$OP = shell_exec("python upgrade_scripts/vertical_scaling.py" . $region $Inst_type $instance);
echo $OP;  
?>


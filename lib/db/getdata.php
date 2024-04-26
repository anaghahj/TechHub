<?php
include 'connect.php';

$queryResult=$connect->query("select Name,No_of_Students,NAAC_Credits,TPO,TPO_Phone from University");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>


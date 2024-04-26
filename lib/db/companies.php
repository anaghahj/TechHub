<?php
include 'connect.php';

$queryResult=$connect->query("select Name,Year,No_of_Recruit from Companies where Uid='1BI'");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>
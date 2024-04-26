<?php
include 'connect.php';

$queryResult=$connect->query("select Event_name,Status,Team_Name from Achievements where Uid='1BI'");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>
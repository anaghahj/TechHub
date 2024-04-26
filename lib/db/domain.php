<?php
include 'connect.php';

$queryResult=$connect->query("select Name,No_of_Students from Domain where Uid='1BI'");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>
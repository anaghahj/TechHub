<?php
include 'connect.php';

$queryResult=$connect->query("select Package_gt_15,Package_bw_5_15,Package_lt_5 from Placement_Record where Uid='1BI'");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>
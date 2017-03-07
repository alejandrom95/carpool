<?php
$DEBUG_INFO=0;
error_reporting(0);

#include "app/config.php";
#include "app/detect.php";
require_once("DBConn.php");
require_once("ModelProfile.php");

session_start();
$db    = new DBConn();
$conn  = $db->connect();
$modelP= new ModelProfile();


$target="";
$action="";
$email="";


# Set local variables from url values
if (isset($_GET['target']) )
{
	$target = strtolower($_GET['target']);
}
if (isset($_GET['action']) )
{
	$action = strtolower($_GET['action']);
}
if (isset($_GET['email']) )
{
	$email =$_GET['email'];
}

# Main logic
if ($target == "profile" && $action == "display")
{
	# Logic for retrieving the date the account was created
	$accountCreationDate = $modelP->getAccountCreationDate($conn, $email);
	$participatedAsDriverRidesList = $modelP->getParticipatedAsDriverRidesList($conn, $email);
	$participatedAsPassengerRidesList = $modelP->getParticipatedAsPassengerRidesList($conn, $email);
	if($accountCreationDate == '') {
		echo 'error getting creation date';
	}
	else {
		include 'ProfileView.php';
	}
}
?>

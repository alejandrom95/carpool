<?php
require_once("../php/DBConn.php");
error_reporting(0);

$db    = new DBConn();
$conn  = $db->connect();
	function valid_driver($conn, $email, $user_type) {
		$statement = "
			select drivers_license_number 
			from users 
			where email = '$email';";

		$result = mysqli_query($conn, $statement);

		$dl = mysqli_fetch_row($result);
		if($user_type === 'DRIVER') {
			if ($dl <> '') {
			    mysqli_next_result($conn);
			    mysqli_close($conn);
				$_SESSION['user_type'] = $user_type;
			} else {
			    mysqli_next_result($conn);
			    mysqli_close($conn);
			    echo "Set Driver's License before using app as Driver.";
			}
		}
		else {
			mysqli_next_result($conn);
		    mysqli_close($conn);
			$_SESSION['user_type'] = $user_type;
		}
		
	}

$email = $_POST['email'];
$user_type = $_POST['user_type'];
valid_driver($conn, $email, $user_type);
?>
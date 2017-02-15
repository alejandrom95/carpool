<?php
class DBConn
{
	public function connect()
	{
		$mysqli = mysqli_connect('localhost', 'root', '', 'app_carpool');
		
		return $mysqli;
	}
}
?>
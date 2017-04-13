<?php
$dir = realpath(__DIR__ . '/..').'/vendor/autoload.php';
require_once ($dir);
\Codebird\Codebird::setConsumerKey('AeqD1VXFLxni6wINS9AzYZhJv', '44fHeMU0GzeK5tcFjUhi8ESiqgDwU79UUqtsF9i0nc6IpF8EKI'); // static, see README


$cb = \Codebird\Codebird::getInstance();

$cb->logout();
if (!isset($_SESSION))
  {
    session_start();
  }
// echo "session status: ". session_status(). "...";
session_unset();
// echo "session status: ". session_status(). "...";
    // echo "session status: ". session_status(). "...";
    setcookie("PHPSESSID", "", time() - 3600);
// echo "1: ". $_SESSION['login_status'];
    $_SESSION['login_status'] = "logged_out";
    // echo "<script>console.log('2: ". $_SESSION['login_status']."');</script>";
    // echo "session status: ". session_status(). "...";
    // echo "session status: ". $_SESSION["login_status"]. "...";
    header("location: /login.php");
?>
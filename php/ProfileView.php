<?php
  session_start();
  error_reporting(0);
  require_once("DBConn.php");
?>
<!doctype html>
<html>
<head>
  <meta charset = "utf-8">
  <title>Carpool</title>
  <script>
    //php code to check login status and redirect to login page if the 
    //user isn't logged in, add before loading anything unnecessary
    <?php
      if(isset($_SESSION['login_status'])){
        $login_status = $_SESSION['login_status'];
      }
      else {
        $login_status = "logged_out";
      }
      // echo 'alert("'.$login_status.'");';
      if($login_status <> "logged_in") {
        session_destroy();
        // echo 'window.location = "http://492ateam1.bitnamiapp.com/login.php";';
        echo 'window.location = "/login.php";';

      }
      //get the login email of the logged in user
      $login_email = $_SESSION['login_email'];
      echo 'var login_email = "'.$login_email.'";';
      $db = new DBConn();
      $connection = $db->connect();
      if($connection->connect_errno > 0){
        mysqli_close($connection);
          die('Unable to connect to database');
      }
    ?>
  </script>
  <!--CDN for bootstrap-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
  <!-- our site's css -->
  <link href="/css/main.css" rel="stylesheet">
  <!-- jquery ui css -->
  <link rel="stylesheet" href="/jquery-ui-custom/jquery-ui.min.css">
  <link rel="stylesheet" href="/jquery-ui-custom/jquery-ui.structure.min.css">
  <link rel="stylesheet" href="/jquery-ui-custom/jquery-ui.theme.min.css">
  <!--for mobile devices-->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- google sign in -->
  <script>
    function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
  </script>
  <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
  <meta name="google-signin-client_id" content="473326774931-juk0h7odee36c2kaj75anc7ou36tm0on.apps.googleusercontent.com">
  
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
  <!-- Latest compiled and minified JavaScript needed for bootstrap-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>

<body>
  <header>
    <div id = "includeHeader"></div>
  </header>
  <script> 
    //Import header from inserts
    $(function(){
      $("#includeHeader").load("/inserts/header.php");
    });
  </script> 
 
  <!-- ADD CONTENT HERE -->
		<form action="cProfile.php">
			<input type="hidden" name="target" value="profile">
			<input type="hidden" name="email" value="<?php print $accountCreationDate[0]['email']; ?>">

			<table>
			<tr><td>Email:</td><td><?php print $accountCreationDate[0]['email']; ?></td></tr>
			<tr><td>First Name:</td><td><input type="text" name="fname" value="<?php print $accountCreationDate[0]['first_name']; ?>"></td></tr>
			<tr><td>Last Name:</td><td><input type="text" name="lname" value="<?php print $accountCreationDate[0]['last_name']; ?>"></td></tr>
			<tr><td>Birthday (YYYY-MM-DD):</td><td><input type="text" name="bday" value="<?php print $accountCreationDate[0]['bday']; ?>"></td></tr>
      <tr><td>Update Password:</td><td><input type="password" name="pw"></td></tr>
			<tr><td>Account Creation Dae (YYYY-MM-DD): </td><td> <?php print $accountCreationDate[0]['create_date']; ?></td></tr>
      <tr><td>Rating: </td><td> <?php echo $userRating[0]['rating']; ?></td></tr>
			<tr><td></td><td><input type="submit" name="action" value="Save"></td></tr>
			</table>
		</form>


  <div class = "col-sm-12">
    <div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">Passenger</div>
        <?php
          $idRide = 0;
          foreach ($participatedAsPassengerRidesList as $ride) {
            $idRide = $ride[route_id];
            echo 
              '<div id="requested-ride-'.$idRide.'">
              <table class="table">
                <tbody>
                  <tr>
                    <!-- <td>(view threads)</td> -->
                    <th>
                    </th>
                    <th>Ride ID: '.$ride[route_id].'</th>
                    <th>Start Address: '.$ride[start_address].'</th>
                    <th>End Address: '.$ride[end_address].'</th>
                    <th>Date: '.$ride[date].'</th>
                  </tr>
                </tbody>
              </table>
              </div>
            ';
          }
        ?>
    </div>
  </div>
  <div class = "col-sm-12">
    <div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">Driver</div>
        <?php
          $idRide = 0;
          foreach ($participatedAsDriverRidesList as $ride) {
            $idRide = $ride[route_id];
            echo 
              '<div id="requested-ride-'.$idRide.'">
              <table class="table">
                <tbody>
                  <tr>
                    <!-- <td>(view threads)</td> -->
                    <th>
                    </th>
                    <th>Ride ID: '.$ride[route_id].'</th>
                    <th>Start Address: '.$ride[start_address].'</th>
                    <th>End Address: '.$ride[end_address].'</th>
                    <th>Date: '.$ride[date].'</th>
                  </tr>
                </tbody>
              </table>
              </div>
            ';
          }
        ?>
    </div>
  </div>


  
</body>

</html>

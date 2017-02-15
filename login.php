<?php
  session_start();
  error_reporting(0);
?>
<!doctype html>

<html>
<head>
	<meta charset = "utf-8">
  
	<!--CDN for bootstrap-->
	<title>Carpool::Login</title>
  <script>
    //php code to check login status and redirect to login page if the 
    //user isn't logged in, add before loading anything unnecessary
    // $(document).ready(function(){
      <?php
        $login_status = $_SESSION['login_status'];
        if($login_status == "logged_in") {
          // echo 'window.location = "http://492ateam1.bitnamiapp.com/";';
          echo 'window.location = "/";';
        }
        //get the login email of the logged in user
        $login_email = $_SESSION['login_email'];
      ?>
  </script>
	<link href="/css/main.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<!--for mobile devices-->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>

<body>
<!-- Facebook sdk initial setup -->
  <div id="fb-root"></div>
  <div id = "includeFbLogin"></div>

	<header>
   		<div id = "includeHeader"></div>
 	</header>

  <!-- Website Account Login -->
  <div class = "container col-sm-6">
    <h2>Login</h2>

 	  <form action = "/php/logindb.php" method = "post">
    <!-- Output something telling the user that an invalid login was attempted -->
      <div>
        <?php
          $login_status = $_SESSION['login_status'];
          if($login_status == "login_error") {
            echo '<script>document.write("<div class=\"alert alert-danger\" role=\"alert\"> <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"> </span> <span class=\"sr-only\">Error:</span>Invalid Login Information</div>");</script>';
          }
        ?>
      </div>
      <div class = "">
        <div class = "input-group">
          <input name="login_email" id="login-email" type="email" placeholder="Enter email" class="form-control" required>
        </div>
      </div>
      <div class = "">
        <div class = "input-group">
          <input name="login_password" id="login-password" type="password" placeholder="Enter password" class="form-control" required>
        </div>
      </div>
      <div class = "">
        <button id = "login-button" class="btn btn-md btn-primary" type="submit">Sign in</button>
      </div>
      
    </form>
  </div>

  <!-- Facebook Login -->
  <div class = "container col-sm-6">
    <h2>Login with Facebook</h2>
    <div class = "">
        <div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="true"
            data-scope = "public_profile, email" onlogin="checkLoginState();"></div>
        <form id = "fb-form" action = "/php/fb_login_or_create.php" method = "post">
          <!-- Output something telling the user that an invalid login/creation was attempted -->
          <?php
            $login_status = $_SESSION['login_status'];
            if($login_status == "fb_create_account_error") {
              echo '<script>document.write("<div class=\"alert alert-danger\" role=\"alert\"> <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"> </span> <span class=\"sr-only\">Error:</span>Error Logging in using Facebook</div>");</script>';
            }
          ?>
          <input name="fb_email" id = "fb-email" type="hidden" value="">
          <input name="fb_first_name" id = "fb-first-name" type="hidden" value="">
          <input name="fb_last_name" id = "fb-last-name" type="hidden" value="">
          <input type="hidden" value="Submit">
        </form>
    </div>
  </div>

  <!-- Create Account -->
  <div class = "container col-sm-12">
    <h2>Create Account</h2>
    <form action = "/php/create_account.php" method = "post">
      <div>
      <!-- Output something telling the user that an invalid account creation was attempted -->
        <?php
          $login_status = $_SESSION['login_status'];
          if($login_status == "create_account_error") {
            echo '<script>document.write("<div class=\"alert alert-danger\" role=\"alert\"> <span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"> </span> <span class=\"sr-only\">Error:</span>Account Already Exists: Enter different email</div>");</script>';
          }
        ?>
      </div>
      <div class = "">
        <h4>Enter Email *</h4>
        <div class = "input-group">
          <input name="create_email" id="create-email" type="email" placeholder="Enter email" class="form-control" required>
        </div>
      </div>
      <div class = "">
        <h4>Enter Password *</h4>
        <div class = "input-group">
          <input name="create_password" id="create-password" type="password" placeholder="Enter password" class="form-control" required>
        </div>
      </div>
      <div class = "">
        <h4>Enter First Name *</h4>
        <div class = "input-group">
          <input name="create_first_name" id="create-first-name" type="text" placeholder="Enter First Name" class="form-control" required>
        </div>
      </div>
      <div class = "">
        <h4>Enter Last Name *</h4>
        <div class = "input-group">
          <input name="create_last_name" id="create-last-name" type="text" placeholder="Enter Last Name" class="form-control" required>
        </div>
      </div>
      <div class = "">
        <h4>Enter Driver's License Number</h4>
        <h5>Required if you plan on offering ride's as a driver.</h5>
        <div class = "input-group">
          <input name="create_drivers_license" id="create-drivers-license" type="text" placeholder="Enter Driver's License Number" class="form-control">
        </div>
      </div>
      <div class = "">
        <h4>Enter Birthday (MM/DD/YYYY)</h4>
        <div class = "input-group">
          <input name="create_month" id="create-month" type="text" placeholder="MM" class="form-control" required>
        </div>
        <div class = "input-group">
          <input name="create_day" id="create-day" type="text" placeholder="DD" class="form-control" required>
        </div>
        <div class = "input-group">
          <input name="create_year" id="create-year" type="text" placeholder="YYYY" class="form-control" required>
        </div>

      </div>
      <div class = "">
        <button id = "create-button" class="btn btn-md btn-primary" type="submit">Create Account</button>
      </div>
    </form>
  </div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script> 
    $(function(){
      $("#includeHeader").load("/inserts/header.php"); 
      // $("#includeFooter").load("/inserts/footer.php"); 
      $("#includeFbLogin").load("/inserts/fblogin.php"); 
    });
    </script> 
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>
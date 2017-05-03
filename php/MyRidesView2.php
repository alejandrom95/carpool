<?php
  // session_start();
// error_reporting(0);
?>
<!doctype html>

<html>
<head>
  <meta charset = "utf-8">
  
  <!--CDN for bootstrap-->
  <title>Carpool::My Rides</title>
  <script>
    //php code to check login status and redirect to login page if the 
    //user isn't logged in, add before loading anything unnecessary
    // $(document).ready(function(){
      <?php
        $login_status = $_SESSION['login_status'];
        if($login_status <> "logged_in") {
          session_destroy();
          echo 'window.location = "/login.php";';
        }
        //get the login email of the logged in user
        $login_email = $_SESSION['login_email'];
        $db    = new DBConn();
        $conn  = $db->connect();
      ?>
  </script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
  
  <link href="css/bootstrap-overrides.css" rel="stylesheet">
  <link href="/css/main.css" rel="stylesheet">
  <!--for mobile devices-->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <script>
    var sendMessageRideID = 0;
    var sendMessageContent = "";
    var sendMessageThreadName = "";
    var sendMessageUsername = "";
  </script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <style>
    html {background-color: black;}
  </style>

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

</head>

<body>
  <header>
      <div id = "includeHeader"></div>
  </header>
  <div id="message-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Send Message to <span class="name-modal"></span></h4>
        </div>
        <div class="modal-body">
          <textarea id="message-modal-textarea" rows="10" cols="80" style="width: 100%;"></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button id="send-message" type="button" class="btn btn-primary">Send Message</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

  <!-- Title of page -->
  <!-- <div class="text-center"> -->
    <h1 class = "text-center" id="myridestitle" style="color: blue;margin:0px;background-color: black;padding:20px 0px 10px 0px;margin-bottom: 10px;">My Rides</h1>
  <!-- </div> -->
  <!--div boxes with data-->






  <div class="container">
    <div class="row">
      <div class="col-sm-1"></div>
      <div class = "col-sm-10">
        <div class="panel panel-default">
          <!-- Default panel contents -->
          <div class="panel-heading">Requested</div>

          <!-- Start requested owned -->
          <?php
          foreach ($array_requested_owned as $ride) {
            $first_iteration = true;
            $second_iteration = true;
            foreach ($ride as $item) {
              if($first_iteration) {
                echo 
                '<div id="requested-owned-header-'.$item[route_id].'">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th>
                        <form id="edit-requested-'.$item[route_id].'" action="/edit_ride.php" method="post">
                          <input type="hidden" name="route_id" value="'.$item[route_id].'">
                          <button id="edit-requested-'.$item[route_id].'" type="button" class="btn btn-default" aria-label="edit ride">Edit Ride</button>
                        </form>
                        <script>
                          $("#edit-requested-'.$item[route_id].'").click(function() {
                            document.getElementById("edit-requested-'.$item[route_id].'").submit();
                          });
                        </script>
                        </th>
                        <th>Ride ID: *';

                  echo  $item[route_id].'</th>
                        <th>Start Address: '.$item[start_address].'</th>
                        <th>End Address: '.$item[end_address].'</th>
                        <th>Date: '.$item[date].'</th>
                      </tr>
                    </tbody>
                  </table>
                </div>
                
                

              ';
                // echo 'first: <pre>';
                // print_r($item);
                // echo '</pre>';
                $first_iteration = false;
              }
              else {
                if($second_iteration) {
                  $pieces = explode("@", $item[thread_name]);
                $thread_n = $pieces[0];
                  echo 
                  '
                  <div id="requested-not-owned-thread-'.$item[route_id].'-'.$item[thread_name].'">
                    <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#message-collapse-'.$item[route_id].'-'.$thread_n.'">Show Messages</button>
                    <button id="accept-requested-thread-'.$item[route_id].'-'.$item[thread_name].'" type="button" class="btn btn-success" aria-label="send message">Accept</button>
                    Thread Name: '.$item[thread_name].'<br>
                  </div>
                  <div id="message-collapse-'.$item[route_id].'-'.$thread_n.'" class="collapse">
                  <div id="messages-container-'.$item[route_id].'-'.$item[thread_name].'">
                  ';
                  if($login_email == $item[username]) {
                    echo '
                      <div id="message-'.$item[message_id].'" style="color: blue; padding-left: 50%;">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  else {
                    echo '
                      <div id="message-'.$item[message_id].'">
                      '.$item[message_text].'
                      </div>

                    ';
                  }

                  // ';
                  $second_iteration = false;
                }
                else {
                  
                  if($login_email == $item[username]) {
                    echo '
                      <div id="message-'.$item[message_id].'"  style="color: blue; padding-left: 50%;">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  else {
                    echo '
                      <div id="message-'.$item[message_id].'">
                      '.$item[message_text].'
                      </div>
                    ';
                  }
                }
              }

            }

            if($second_iteration === false) {
              echo '
              <textarea id="message-modal-textarea" rows="4" cols="80" style="width: 80%;"></textarea>
              <button id="send-message" type="button" class="btn btn-primary">Send Message</button>
              </div>
              </div>';

            }
          }
          ?>
          <!-- End requested owned -->
          <!-- Start requested not owned -->
          <?php
          foreach ($array_requested_not_owned as $ride) {
            $first_iteration = true;
            $second_iteration = true;
            foreach ($ride as $item) {
              if($first_iteration) {
                echo 
                '<div id="requested-not-owned-header-'.$item[route_id].'">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th>
                        <form id="edit-requested-'.$item[route_id].'" action="/edit_ride.php" method="post">
                          <input type="hidden" name="route_id" value="'.$item[route_id].'">
                          <button id="edit-requested-'.$item[route_id].'" type="button" class="btn btn-default" aria-label="edit ride">Edit Ride</button>
                        </form>
                        <script>
                          $("#edit-requested-'.$item[route_id].'").click(function() {
                            document.getElementById("edit-requested-'.$item[route_id].'").submit();
                          });
                        </script>
                        </th>
                        <th>Ride ID: ';

                  echo  $item[route_id].'</th>
                        <th>Start Address: '.$item[start_address].'</th>
                        <th>End Address: '.$item[end_address].'</th>
                        <th>Date: '.$item[date].'</th>
                      </tr>
                    </tbody>
                  </table>
                </div>
                
                

              ';
                // echo 'first: <pre>';
                // print_r($item);
                // echo '</pre>';
                $first_iteration = false;
              }
              else {
                if($second_iteration) {
                  $pieces = explode("@", $item[thread_name]);
                  $thread_n = $pieces[0];
                  echo 
                  '
                  <div id="requested-not-owned-thread-'.$item[route_id].'-'.$item[thread_name].'">
                    <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#message-collapse-'.$item[route_id].'-'.$thread_n.'">Show Messages</button>
                    <button id="accept-requested-thread-'.$item[route_id].'-'.$item[thread_name].'" type="button" class="btn btn-success" aria-label="send message">Accept</button>
                    Thread Name: '.$item[thread_name].'<br>
                  </div>
                  <div id="message-collapse-'.$item[route_id].'-'.$thread_n.'" class="collapse">
                  <div id="messages-container-'.$item[route_id].'-'.$item[thread_name].'">

                  ';
                  if($login_email == $item[username]) {
                    echo '
                      <div id="message-'.$item[message_id].'"  style="color: blue; padding-left: 50%;">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  else {
                    echo '
                      <div id="message-'.$item[message_id].'">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  $second_iteration = false;
                }
                else {
                  if($login_email == $item[username]) {
                    echo '
                      <div id="message-'.$item[message_id].'"  style="color: blue; padding-left: 50%;">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  else {
                    echo '
                      <div id="message-'.$item[message_id].'">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                }
              }
            }
            if($second_iteration === false) {
              echo '
              <textarea id="message-modal-textarea" rows="4" cols="80" style="width: 80%;"></textarea>
              <button id="send-message" type="button" class="btn btn-primary">Send Message</button>
              </div>
              </div>';

            }
          }
          ?>
          <!-- End requested not owned -->



        </div><!-- End class: panel panel-default -->
      </div><!-- End col-10 -->
      <div class="col-sm-1"></div>
    </div><!-- End row -->
    <div class="row">
      <div class="col-sm-1"></div>
      <div class = "col-sm-10">
        <div class="panel panel-default">
          <!-- Default panel contents -->
          <div class="panel-heading">Offered</div>

          <!-- Start offered owned -->
          <?php
          foreach ($array_offered_owned as $ride) {
            $first_iteration = true;
            $second_iteration = true;
            foreach ($ride as $item) {
              if($first_iteration) {
                echo 
                '<div id="offered-owned-header-'.$item[route_id].'">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th>
                        <form id="edit-offered-'.$item[route_id].'" action="/edit_ride.php" method="post">
                          <input type="hidden" name="route_id" value="'.$item[route_id].'">
                          <button id="edit-offered-'.$item[route_id].'" type="button" class="btn btn-default" aria-label="edit ride">Edit Ride</button>
                        </form>
                        <script>
                          $("#edit-offered-'.$item[route_id].'").click(function() {
                            document.getElementById("edit-offered-'.$item[route_id].'").submit();
                          });
                        </script>
                        </th>
                        <th>Ride ID: *';

                  echo  $item[route_id].'</th>
                        <th>Start Address: '.$item[start_address].'</th>
                        <th>End Address: '.$item[end_address].'</th>
                        <th>Date: '.$item[date].'</th>
                      </tr>
                    </tbody>
                  </table>
                </div>
                
                

              ';
                // echo 'first: <pre>';
                // print_r($item);
                // echo '</pre>';
                $first_iteration = false;
              }
              else {
                if($second_iteration) {
                  $pieces = explode("@", $item[thread_name]);
                $thread_n = $pieces[0];
                  echo 
                  '
                  <div id="offered-not-owned-thread-'.$item[route_id].'-'.$item[thread_name].'">
                    <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#message-collapse-'.$item[route_id].'-'.$thread_n.'">Show Messages</button>
                    <button id="accept-offered-thread-'.$item[route_id].'-'.$item[thread_name].'" type="button" class="btn btn-success" aria-label="send message">Accept</button>
                    Thread Name: '.$item[thread_name].'<br>
                  </div>
                  <div id="message-collapse-'.$item[route_id].'-'.$thread_n.'" class="collapse">
                  <div id="messages-container-'.$item[route_id].'-'.$item[thread_name].'">

                  ';
                  if($login_email == $item[username]) {
                    echo '
                      <div id="message-'.$item[message_id].'"  style="color: blue; padding-left: 50%;">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  else {
                    echo '
                      <div id="message-'.$item[message_id].'">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  $second_iteration = false;
                }
                else {
                  if($login_email == $item[username]) {
                    echo '
                      <div id="message-'.$item[message_id].'"  style="color: blue; padding-left: 50%;">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  else {
                    echo '
                      <div id="message-'.$item[message_id].'">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                }
              }
            }
            if($second_iteration === false) {
              echo '
              <textarea id="message-modal-textarea" rows="4" cols="80" style="width: 80%;"></textarea>
              <button id="send-message" type="button" class="btn btn-primary">Send Message</button>
              </div>
              </div>';

            }
          }
          ?>
          <!-- End offered owned -->
          <!-- Start offered not owned -->
          <?php
          foreach ($array_offered_not_owned as $ride) {
            $first_iteration = true;
            $second_iteration = true;
            foreach ($ride as $item) {
              if($first_iteration) {
                echo 
                '<div id="offered-not-owned-header-'.$item[route_id].'">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th>
                        <form id="edit-offered-'.$item[route_id].'" action="/edit_ride.php" method="post">
                          <input type="hidden" name="route_id" value="'.$item[route_id].'">
                          <button id="edit-offered-'.$item[route_id].'" type="button" class="btn btn-default" aria-label="edit ride">Edit Ride</button>
                        </form>
                        <script>
                          $("#edit-offered-'.$item[route_id].'").click(function() {
                            document.getElementById("edit-offered-'.$item[route_id].'").submit();
                          });
                        </script>
                        </th>
                        <th>Ride ID: ';

                  echo  $item[route_id].'</th>
                        <th>Start Address: '.$item[start_address].'</th>
                        <th>End Address: '.$item[end_address].'</th>
                        <th>Date: '.$item[date].'</th>
                      </tr>
                    </tbody>
                  </table>
                </div>
                
                

              ';
                // echo 'first: <pre>';
                // print_r($item);
                // echo '</pre>';
                $first_iteration = false;
              }
              else {
                if($second_iteration) {
                  $pieces = explode("@", $item[thread_name]);
                $thread_n = $pieces[0];
                  echo 
                  '
                  <div id="offered-not-owned-thread-'.$item[route_id].'-'.$item[thread_name].'">
                    <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#message-collapse-'.$item[route_id].'-'.$thread_n.'">Show Messages</button>
                    <button id="accept-offered-thread-'.$item[route_id].'-'.$item[thread_name].'" type="button" class="btn btn-success" aria-label="send message">Accept</button>
                    Thread Name: '.$item[thread_name].'<br>
                  </div>
                  <div id="message-collapse-'.$item[route_id].'-'.$thread_n.'" class="collapse">
                  <div id="messages-container-'.$item[route_id].'-'.$item[thread_name].'">

                  ';
                  if($login_email == $item[username]) {
                    echo '
                      <div id="message-'.$item[message_id].'"  style="color: blue; padding-left: 50%;">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  else {
                    echo '
                      <div id="message-'.$item[message_id].'">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  $second_iteration = false;
                }
                else {
                  if($login_email == $item[username]) {
                    echo '
                      <div id="message-'.$item[message_id].'"  style="color: blue; padding-left: 50%;">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                  else {
                    echo '
                      <div id="message-'.$item[message_id].'">
                      '.$item[message_text].'
                      </div>

                    ';
                  }
                }
              }
            }
            if($second_iteration === false) {
              echo '
              <textarea id="message-modal-textarea" rows="4" cols="80" style="width: 80%;"></textarea>
              <button id="send-message" type="button" class="btn btn-primary">Send Message</button>
              </div>
              </div>';

            }
          }
          ?>
          <!-- End offered not owned -->


        </div><!-- End class: panel panel-default -->
      </div><!-- End col-10 -->
      <div class="col-sm-1"></div>
    </div><!-- End row -->
  </div><!-- End container -->




    <script> 
    $(function(){
      $("#includeHeader").load("/inserts/header.php"); 
    });
    </script> 
    <script>
      $('#send-message').on("click",function() {
        sendMessageContent = $('#message-modal-textarea').val();
        $.post("cMyRides.php",
          {
              target: "message",
              action: "save",
              route_id: sendMessageRideID,
              message: sendMessageContent,
              thread_name: sendMessageThreadName,
              id: sendMessageUsername
          }, function(data){
              alert("Message Sent");
          });//end ajax post
      });
    </script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>

</html>
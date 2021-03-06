<?php
  // session_start();
error_reporting(0);
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
  <link href="/css/main.css" rel="stylesheet">
  <link href="css/bootstrap-overrides.css" rel="stylesheet">
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
  <div style="text-align: center;">
    <h1 style="color: black;">My Rides</h1>
  </div>
  <!--div boxes with data-->
  
  <!--we want to make the size of the divs smaller-->
<div class="container">
<div class="row">
  <div class="col-sm-1"></div>
  <div class = "col-sm-10">
    <div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">Requested</div>
        <?php
          $idRide = 0;
          foreach ($requestedRidesList as $ride) {
            $idRide = $ride[route_id];
            echo 
              '<div id="requested-ride-'.$idRide.'">
              <table class="table">
                <tbody>
                  <tr>
                    <!-- <td>(view threads)</td> -->
                    <th>
                    <form id="edit-requested-'.$idRide.'" action="/edit_ride.php" method="post">
                      <input type="hidden" name="route_id" value="'.$idRide.'">
                      <button id="edit-requested-'.$idRide.'" type="button" class="btn btn-default" aria-label="edit ride">Edit Ride</button>
                    </form>
                    <script>
                      $("#edit-requested-'.$idRide.'").click(function() {
                        document.getElementById("edit-requested-'.$idRide.'").submit();
                      });
                    </script>
                    </th>
                    <th>Ride ID: *';

              echo  $ride[route_id].'</th>
                    <th>Start Address: '.$ride[start_address].'</th>
                    <th>End Address: '.$ride[end_address].'</th>
                    <th>Date: '.$ride[date].'</th>
                  </tr>
                </tbody>
              </table>


            ';

            $prevThread="";
            $idThread = 0;
            $idMessage = 0;
            foreach ($requestedListOwned as $item) {
              if($item[route_id] == $ride[route_id]) {
                if ($item[thread_name] <> $prevThread) {
                  if($idThread <> 0) {
                    echo '</div>';
                  }

                  echo '<div id="requested-thread-'.$idThread.'" style="padding:5px;"><hr>';
                  echo '<button id="message-requested-thread-'.$item[route_id].'-'.$idThread.'" type="button" class="btn btn-primary" aria-label="send message">Send Message</button> 
                  <button id="accept-requested-thread-'.$item[route_id].'-'.$idThread.'" type="button" class="btn btn-success" aria-label="send message">Accept</button>
                        
                  <script>

                  $("#accept-requested-thread-'.$item[route_id].'-'.$idThread.'").click(function() {
                    $.get("/php/cManagePassengers.php",
                    {
                        target: "route",
                        action: "accept",
                        id: "'.$login_email.'",
                        thread_name: "'.$item[thread_name].'",
                        route_id: "'.$item[route_id].'",
                        ride_type: "REQUEST"
                    }, function(data){
                        alert("Driver accepted.");
                    });//end ajax post
                  });
                  </script>
                  Thread Name: '.$item[thread_name].'<br>
                      <script>
                      $("#message-requested-thread-'.$item[route_id].'-'.$idThread.'").click(function() {
                        console.log("messages");
                        sendMessageRideID = '.$item[route_id].';
                        sendMessageThreadName = "'.$item[thread_name].'";
                        sendMessageUsername = "'.$login_email.'";
                        $("#message-modal").modal();
                      });
                      </script> 
                  ';
                  //thread end
                  //message start
                  $messageText = preg_replace('/myloggedinid/',$login_email,$item[message_text]);
                  echo '<div id="requested-messages-'.$item[route_id].'-'.$idMessage.'" class="pull-right">
                           From: '.$item[username].'<br>'.$messageText.'</div>';
                  //message end
                  //update
                  $prevThread = $item[thread_name];
                  $idThread = $idThread + 1;
                  $idMessage = $idMessage + 1;
                }
                else {
                  //message start
                  $messageText = preg_replace('/myloggedinid/',$login_email,$item[message_text]);
                  echo '<div id="requested-messages-'.$item[route_id].'-'.$idMessage.'" class="pull-right">
                           From: '.$item[username].'<br>'.$messageText.'</div>';
                  //message end
                  //update
                  $prevThread = $item[thread_name];
                  $idMessage = $idMessage + 1;
                }
              }
            }
            //if prevThread was modified meaning that there was a thread
            if ($prevThread <> "") {
              echo '</div>';
            }
            $idRide = $idRide + 1;
            echo '</div>';
          }
        ?>
        <?php
          //if id changes print all three
          //if id same and diff thread print thread and message
          //if id same and thread same print message
          $prevRoute = -1;
          $prevThread="";
          $item = $requestedListNotOwned[$countLoop];
          $firstIter = true;
          $idRide = 0;
          $idThread = 0;
          $idMessage = 0;
          // 1
          foreach ($requestedListNotOwned as $item) {
            if($item[route_id] <> $prevRoute) {
              if(!($firstIter)) {
                echo '</div></div>';
              }
              $firstIter = false;
              //ride start
              echo 
                '<div id="requested-ride-'.$idRide.'">
                <table class="table">
                  <tbody>
                    <tr>
                      <!-- <td>(view threads)</td> -->
                      <th>Ride ID: ';
                if($item[thread_name] <> $login_email) {
                  echo '*';
                }

                echo  $item[route_id].'</th>
                      <th>Start Address: '.$item[start_address].'</th>
                      <th>End Address: '.$item[end_address].'</th>
                      <th>Date: '.$item[date].'</th>
                    </tr>
                  </tbody>
                </table>
              ';

              echo '<div id="requested-thread-'.$idThread.'">';

              // echo '<script>alert("'.$model2->isPassenger($conn,$item[route_id],$login_email).'");</script>';
              echo '<button id="message-requested-thread-'.$idThread.'" type="button" class="btn btn-primary" aria-label="send message">Send Message</button> 
                <script>
                $("#message-requested-thread-'.$idThread.'").click(function() {
                  console.log("messages");
                  sendMessageRideID = '.$item[route_id].';
                  sendMessageThreadName = "'.$item[thread_name].'";
                  sendMessageUsername = "'.$login_email.'";
                  $("#message-modal").modal();
                });
                </script>';
              if($model2->isPassenger($conn,$item[route_id],$login_email)) {
                echo '<button id="decline-requested-thread-'.$item[route_id].'-'.$idThread.'" type="button" class="btn btn-danger" aria-label="send message">Decline</button>


                <script>

                  $("#decline-requested-thread-'.$item[route_id].'-'.$idThread.'").click(function() {
                    $.get("/php/cManagePassengers.php",
                    {
                        target: "route",
                        action: "decline",
                        id: "'.$login_email.'",
                        thread_name: "'.$item[thread_name].'",
                        route_id: "'.$item[route_id].'",
                        ride_type: "OFFER"
                    }, function(data){
                        alert("You have left the ride.");
                    });//end ajax post
                  });
                  </script>
                  

                ';
              }
              echo 'Thread Name: '.$item[thread_name];
              //thread end
              //message start
              $messageText = preg_replace('/myloggedinid/',$login_email,$item[message_text]);
              echo '<div id="requested-messages-'.$idMessage.'">
                       From: '.$item[username].'<br>'.$messageText.'</div>';
              //message end
              //update
              $prevRoute = $item[route_id];
              $prevThread = $item[thread_name];
              $idRide = $idRide + 1;
              $idThread = $idThread + 1;
              $idMessage = $idMessage + 1;
            
            }
            elseif ($item[thread_name] <> $prevThread) {
              echo '</div>';
              //thread start
              echo '<div id="requested-thread-'.$idThread.'">';

              echo '<button id="message-requested-thread-'.$idThread.'" type="button" class="btn btn-primary" aria-label="send message">Send Message</button>
                <script>
                $("#message-requested-thread-'.$idThread.'").click(function() {
                  console.log("messages");
                  sendMessageRideID = '.$item[route_id].';
                  sendMessageThreadName = "'.$item[thread_name].'";
                  sendMessageUsername = "'.$login_email.'";
                  $("#message-modal").modal();
                });
                </script>';

              if($model2->isPassenger($conn,$item[route_id],$login_email)) {
                echo '<button id="decline-requested-thread-'.$item[route_id].'-'.$idThread.'" type="button" class="btn btn-danger" aria-label="send message">Decline</button>

                <script>

                  $("#decline-requested-thread-'.$item[route_id].'-'.$idThread.'").click(function() {
                    $.get("/php/cManagePassengers.php",
                    {
                        target: "route",
                        action: "decline",
                        id: "'.$login_email.'",
                        thread_name: "'.$item[thread_name].'",
                        route_id: "'.$item[route_id].'",
                        ride_type: "OFFER"
                    }, function(data){
                        alert("You have left the ride.");
                    });//end ajax post
                  });
                  </script>
                ';
              }
              echo 'Thread Name: '.$item[thread_name];

              //thread end
              //message start
              $messageText = preg_replace('/myloggedinid/',$login_email,$item[message_text]);
              echo '<div id="requested-messages-'.$idMessage.'">
                       From: '.$item[username].'<br>'.$messageText.'</div>';
              //message end
              //update
              $prevRoute = $item[route_id];
              $prevThread = $item[thread_name];
              $idThread = $idThread + 1;
              $idMessage = $idMessage + 1;
            }
            else {
              //message start
              $messageText = preg_replace('/myloggedinid/',$login_email,$item[message_text]);
              echo '<div id="requested-messages-'.$idMessage.'">
                       From: '.$item[username].'<br>'.$messageText.'</div>';
              //message end
              //update
              $prevRoute = $item[route_id];
              $prevThread = $item[thread_name];
              $idMessage = $idMessage + 1;
            }

          }
          echo '</div></div>';
        ?>
    </div>

  <div class="col-sm-1"></div>

  <br><br>
  
    
    
<div class="row">
<div class= "col-sm-1"></div>
  <div class = "col-sm-10">
    <div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">Offered</div>

      <?php
          $idRide = 0;
          foreach ($offeredRidesList as $ride) {
            $idRide = $ride[route_id];
            echo 
              '<div id="offered-ride-'.$idRide.'">
              <table class="table">
                <tbody>
                  <tr>
                    <!-- <td>(view threads)</td> -->
                    <th>
                    <form id="edit-offered-'.$idRide.'" action="/edit_ride.php" method="post">
                      <input type="hidden" name="route_id" value="'.$idRide.'">
                      <button id="edit-offered-'.$idRide.'" type="button" class="btn btn-default" aria-label="edit ride">Edit Ride</button>
                    </form>
                    <script>
                      $("#edit-offered-'.$idRide.'").click(function() {
                        document.getElementById("edit-offered-'.$idRide.'").submit();
                      });
                    </script>
                    </th>
                    <th>Ride ID: *';

              echo  $ride[route_id].'</th>
                    <th>Start Address: '.$ride[start_address].'</th>
                    <th>End Address: '.$ride[end_address].'</th>
                    <th>Date: '.$ride[date].'</th>
                  </tr>
                </tbody>
              </table>
            ';

            $prevThread="";
            $idThread = 0;
            $idMessage = 0;
            foreach ($offeredListOwned as $item) {
              if($item[route_id] == $ride[route_id]) {
                if ($item[thread_name] <> $prevThread) {
                  if($idThread <> 0) {
                    echo '</div>';
                  }
                  //thread start
                  echo 
                      '<div id="offered-thread-'.$idThread.'" style="padding:5px;"><hr>';
                  echo '<button id="message-offered-thread-'.$item[route_id].'-'.$idThread.'" type="button" class="btn btn-primary" aria-label="send message">Send Message</button>
                  <script>
                  $("#message-offered-thread-'.$item[route_id].'-'.$idThread.'").click(function() {
                    console.log("messages");
                    sendMessageRideID = '.$item[route_id].';
                    sendMessageThreadName = "'.$item[thread_name].'";
                    sendMessageUsername = "'.$login_email.'";
                    $("#message-modal").modal();
                  });
                  </script>
                  ';
                  if($model2->isPassenger($conn,$item[route_id],$model2->getThreadOtherUser($conn,$item[route_id],$item[thread_name],$login_email))) {
                    echo '<button id="decline-offered-thread-'.$item[route_id].'-'.$idThread.'" type="button" class="btn btn-danger" aria-label="send message">Decline</button>

                    <script>

                    $("#decline-offered-thread-'.$item[route_id].'-'.$idThread.'").click(function() {
                      $.get("/php/cManagePassengers.php",
                      {
                          target: "route",
                          action: "decline",
                          id: "'.$login_email.'",
                          thread_name: "'.$item[thread_name].'",
                          route_id: "'.$item[route_id].'",
                          ride_type: "OFFER"
                      }, function(data){
                          alert("Passenger declined.");
                      });//end ajax post
                    });
                    </script>

                    ';
                  }
                  else {
                    echo '<button id="accept-offered-thread-'.$item[route_id].'-'.$idThread.'" type="button" class="btn btn-success" aria-label="send message">Accept</button>


                    <script>

                    $("#accept-offered-thread-'.$item[route_id].'-'.$idThread.'").click(function() {
                      $.get("/php/cManagePassengers.php",
                      {
                          target: "route",
                          action: "accept",
                          id: "'.$login_email.'",
                          thread_name: "'.$item[thread_name].'",
                          route_id: "'.$item[route_id].'",
                          ride_type: "OFFER"
                      }, function(data){
                          alert("Passenger accepted.");
                      });//end ajax post
                    });
                    </script>

                    ';
                  }
                  echo 'Thread Name: '.$item[thread_name];

                  //thread end
                  //message start
                  $messageText = preg_replace('/myloggedinid/',$login_email,$item[message_text]);
                  echo '<div id="offered-messages-'.$item[route_id].'-'.$idMessage.'">
                           From: '.$item[username].'<br>'.$messageText.'</div>';
                  //message end
                  //update
                  $prevThread = $item[thread_name];
                  $idThread = $idThread + 1;
                  $idMessage = $idMessage + 1;
                }
                else {
                  //message start
                  $messageText = preg_replace('/myloggedinid/',$login_email,$item[message_text]);
                  echo '<div id="offered-messages-'.$item[route_id].'-'.$idMessage.'">
                           From: '.$item[username].'<br>'.$messageText.'</div>';
                  //message end
                  //update
                  $prevThread = $item[thread_name];
                  $idMessage = $idMessage + 1;
                }
              }
            }
            //if prevThread was modified meaning that there was a thread
            if ($prevThread <> "") {
              echo '</div>';
            }

            $idRide = $idRide + 1;
            echo '</div>';
          }
        ?>
        <?php

      //if id changes print all three
      //if id same and diff thread print thread and message
      //if id same and thread same print message
      $prevRoute = -1;
      $prevThread="";
      $item = $offeredListNotOwned[$countLoop];
      $firstIter = true;
      $idRide = 0;
      $idThread = 0;
      $idMessage = 0;
      // 1
      foreach ($offeredListNotOwned as $item) {
        if($item[route_id] <> $prevRoute) {
          if(!($firstIter)) {
            echo '</div></div>';
          }
          $firstIter = false;
          //ride start
          echo 
            '<div id="offered-ride-'.$idRide.'">
            <table class="table">
              <tbody>
                <tr>
                  <!-- <td>(view threads)</td> -->
                  <th>Ride ID: ';
            if($item[thread_name] <> $login_email) {
              echo '*';
            }

            echo  $item[route_id].'</th>
                  <th>Start Address: '.$item[start_address].'</th>
                  <th>End Address: '.$item[end_address].'</th>
                  <th>Date: '.$item[date].'</th>
                </tr>
              </tbody>
            </table>
          ';
          //ride end
          //thread start
          echo 
            '<div id="offered-thread-'.$idThread.'" style="padding:5px;"><hr><button id="message-offered-thread-'.$idThread.'" type="button" class="btn btn-primary" aria-label="send message">Send Message</button> Thread Name: '.$item[thread_name].'
            <script>
            $("#message-offered-thread-'.$idThread.'").click(function() {
              console.log("messages");
              sendMessageRideID = '.$item[route_id].';
              sendMessageThreadName = "'.$item[thread_name].'";
              sendMessageUsername = "'.$login_email.'";
              $("#message-modal").modal();
            });
            </script>';
          //thread end
          //message start
          $messageText = preg_replace('/myloggedinid/',$login_email,$item[message_text]);
          echo '<div id="offered-messages-'.$idMessage.'">
                       From: '.$item[username].'<br>'.$messageText.'</div>';
          //message end
          //update
          $prevRoute = $item[route_id];
          $prevThread = $item[thread_name];
          $idRide = $idRide + 1;
          $idThread = $idThread + 1;
          $idMessage = $idMessage + 1;
        
        }
        elseif ($item[thread_name] <> $prevThread) {
          echo '</div>';
          //thread start
          echo 
            '<div id="offered-thread-'.$idThread.'" style="padding:5px;"><hr><button id="message-offered-thread-'.$idThread.'" type="button" class="btn btn-primary" aria-label="send message">Send Message</button> Thread Name: '.$item[thread_name].'
            <script>
            $("#message-offered-thread-'.$idThread.'").click(function() {
              console.log("messages");
              sendMessageRideID = '.$item[route_id].';
              sendMessageThreadName = "'.$item[thread_name].'";
              sendMessageUsername = "'.$login_email.'";
              $("#message-modal").modal();
            });
            </script>';
          //thread end
          //message start
          $messageText = preg_replace('/myloggedinid/',$login_email,$item[message_text]);
          echo '<div id="offered-messages-'.$idMessage.'">
                       From: '.$item[username].'<br>'.$messageText.'</div>';
          //message end
          //update
          $prevRoute = $item[route_id];
          $prevThread = $item[thread_name];
          $idThread = $idThread + 1;
          $idMessage = $idMessage + 1;
        }
        else {
          //message start
          $messageText = preg_replace('/myloggedinid/',$login_email,$item[message_text]);
          echo '<div id="offered-messages-'.$idMessage.'">
                       From: '.$item[username].'<br>'.$messageText.'</div>';
          //message end
          //update
          $prevRoute = $item[route_id];
          $prevThread = $item[thread_name];
          $idMessage = $idMessage + 1;
        }

      }

    ?>

    </div> <!-- end panel -->
  </div>
<div class="col-sm-1"></div>
</div>
</div>
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
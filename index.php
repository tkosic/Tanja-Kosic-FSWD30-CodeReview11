<?php
  ob_start();
  session_start();
  require_once 'dbconnect.php';
  // it will never let you open index(login) page if session is set
  if ( isset($_SESSION['user'])!="" ) {
    header("Location: home.php");
    exit;
  }
  $error = false;
  if( isset($_POST['btn-login']) ) {
    // prevent sql injections/ clear user invalid inputs
    $user_email = trim($_POST['user_email']);
    $user_email = strip_tags($user_email);
    $user_email = htmlspecialchars($user_email);
    $user_pass = trim($_POST['user_pass']);
    $user_pass = strip_tags($user_pass);
    $user_pass = htmlspecialchars($user_pass);
  
    // prevent sql injections / clear user invalid inputs
    if(empty($user_email)){
      $error = true;
      $emailError = "Please enter your email address.";
    } else if ( !filter_var($user_email,FILTER_VALIDATE_EMAIL) ) {
      $error = true;
      $emailError = "Please enter valid email address.";
    }
    if(empty($user_pass)){
      $error = true;
      $passError = "Please enter your password.";
    }
    // if there's no error, continue to login
    if (!$error) {
      $password = hash('sha256', $user_pass); // password hashing using SHA256
      $query = "SELECT * FROM users WHERE user_email='$user_email'";
      $res = mysqli_query($conn, $query);
      $row = mysqli_fetch_assoc($res);
      $count = mysqli_num_rows($res); // if uname/pass correct it returns must be 1 row
      
      // print_r($row); Use it for a fast check to see what is included in $row assoc array!
      
      if( $count != 1 ) {
        $errMSG = "This email is not registered";
      } else if ($row['user_pass']==$password) {
        $_SESSION['user'] = $row['user_id'];
        header("Location: home.php");
      } else {
        $errMSG = "Incorrect Password, Try again...";
      }
    }
  }

?>

<!-- ==================================HTML================================= -->

<!-- html/head/<body> -->
<?php include('navbar.php'); ?>
  <div class="container">

  <!-- Start of the Login Form -->
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-xs-10">  
        <?php 
          if( isset($_GET['success'])) { ?>
            <div class="alert alert-success">
              <strong>Successfully registered</strong>
            </div>
          <?php 
            }
        ?>

        <form class="form-control mt-5" method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">
          <h2 class="text-center">Login</h2>
          <br>
          <?php
            if ( isset($errMSG) ) {
          ?>

            <div class="alert text-danger">
              <?php echo $errMSG; ?>
            </div>

          <?php
          }
          ?>
        
          <div class="form-group">
            <input type="email" name="user_email" class="form-control" placeholder="Your Email" value="<?php echo $user_email; ?>" maxlength="40" />
            <span class="text-danger"><?php echo $emailError; ?></span>
          </div>
          <div class="form-group">
            <input type="password" name="user_pass" class="form-control" placeholder="Your Password" maxlength="15" />
            <span class="text-danger"><?php echo $passError; ?></span>
          </div>
          
          <br>
          <button class="btn btn-block btn-primary col-4 m-auto" type="submit" name="btn-login">Login</button>
          <br>
          <div class="text-center">
          <a href="register.php">Create your account here</a>
          </div>
        </form>
      </div>
    </div>
  <!-- End of the Login Form -->
  </div>

      

<!--========================== FOOTER + </body></html>====================== -->
<?php include('footer.php'); ?>

<?php ob_end_flush(); ?>
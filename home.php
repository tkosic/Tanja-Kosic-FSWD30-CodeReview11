<?php
	ob_start();
	session_start();
  	include_once 'dbconnect.php';

	// if session is not set this will redirect to login page
	if( !isset($_SESSION['user']) ) {
		header("Location: index.php");
		exit;
	}

	// select logged-in users detail
	$query = "SELECT * FROM users WHERE user_id=".$_SESSION['user'];
	$res = mysqli_query($conn, $query);
	$userRow = mysqli_fetch_assoc($res);
	$userID = $userRow['user_id'];

	$resAutoReturn = mysqli_query($conn, $queryAutoReturn);
?>

<!-- ==================================HTML================================= -->

<!-- html/head/<body> -->
<?php include('navbar.php'); ?>

  <div class="jumbotron">
    <h1 class="display-3">Hello, <?php echo ucwords($userRow['first_name']); ?>!</h1>
    <br>
    <p class="display-4 mt-5">Select one you like.</p>
  </div>

<?php

  $sql1 = "SELECT * FROM cars";
  $result1 = $conn->query($sql1);

  if ($result1->num_rows > 0) {
    echo '
    <main role="main" class="main">
      <div class="album py-5 ">
        <div class="container">
            ';

  while($row1 = $result1->fetch_assoc()) {
      echo '
          <div class="row mt-5">
            <div class="split left col-sm-6">
              <center class="container">
                <img src='.$row1["image1"].' width="75%" >
              </center>
            </div>

            <div class="split right col-sm-6 text-center">
              <div class="centered">
                <h2>'. $row1["name"] .' '. $row1["model"] . ' </h2>
                <h4>' . $row1["type"] . '</h4>
                <h5>' . $row1["details"] . '</h5>
                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.</p>
              </div>
            </div>
          </div>
          ';
      }
      echo '
        </div>
      </div>
    </main>';
 } else {
    echo '0 results';
}
?>	

<!--========================== FOOTER + </body></html>====================== -->
<?php include('footer.php'); ?>

<?php ob_end_flush(); ?>
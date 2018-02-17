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
?>

<!-- ==================================HTML================================= -->

<!-- html/head/<body> -->
<?php include('navbar.php'); ?>

	<div class="jumbotron">
		<h1 class="text-left display-3 mt-3">Our offices in Vienna</h1>
		<br>
		<p class="lead display-4 mt-5">Visit us</p>
	</div>

<?php

  $sql2 = "SELECT * FROM offices";
  $result2 = $conn->query($sql2);

	if ($result2->num_rows > 0) {
	    echo '
	    <main role="main" class="main">
	      <div class="album py-5 ">
	        <div class="container">
	        	<div class="row mt-5">
	            ';

	while($row2 = $result2->fetch_assoc()) {
	      	echo '
	            <div class="col-sm-6 text-center mb-5">
		            <div class="centered">
		            	<div><img src="http://prg.pragueairport.co.uk/wp-content/uploads/car-rental.jpg" alt="" width="100%"></div>
		            	<br>
		                <h2>Address: '. $row2["address"] .'</h2>
		                <h4>Phone: ' . $row2["phone"] . '</h4>
		            </div>
	            </div>
	          ';
	      	}
	      	echo '
	      		</div>
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
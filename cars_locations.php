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

	//select car details
	$getAllCars = "SELECT image1, name, model, type, status, cl_address
					FROM cars
					INNER JOIN offices ON cars.fk_offices_id = offices.offices_id
					INNER JOIN cars_status ON cars.car_id = cars_status.fk_car_id
					INNER JOIN current_location ON cars_status.fk_current_location_id = current_location.current_location_id";

	$allCarsResult = mysqli_query($conn, $getAllCars);

?>

<!-- ==================================HTML================================= -->

<!-- html/head/<body> -->
<?php include('navbar.php'); ?>

	<div class="jumbotron">
	  <h1 class="display-3 mt-3">Our cars</h1>
	  <br>
	  <p class="lead display-4 mt-5">Current Location</p>
	</div>


	<div class="container-fluid row mx-auto">
		
		<div class="px-5 p-3 m-auto" style="overflow-x:auto;">
			<h3 class="py-2 "></h3>
			<table class="table table-hover">
				<thead class="table-dark display-6">
    				<th>Image</th> 
    				<th>Name</th>
    				<th>Model</th>
    				<th>Type</th>
    				<th>Status</th>
    				<th>Current Location</th>
  				</thead>
			<?php 
				while($carsRow = mysqli_fetch_assoc($allCarsResult)) {
			?>
				<tbody>
					 <td><img src="<?php echo $carsRow ['image1']; ?>" alt="media image" style="max-height:70px; max-width:70px;"></td> 
					<td><?php echo $carsRow ['name']; ?></td>
					<td><?php echo $carsRow ['model']; ?></td>
					<td><?php echo $carsRow ['type']; ?></td>
					<td><?php echo $carsRow ['status']; ?></td>
					<td><?php echo $carsRow ['cl_address']; ?></td>
				</tbody>
			<?php
				}
			?>
			</table>
		</div>

<!--========================== FOOTER + </body></html>====================== -->
<?php include('footer.php'); ?>

<?php ob_end_flush(); ?>
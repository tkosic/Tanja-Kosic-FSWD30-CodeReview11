<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="refresh" content="index.php">
  <title>CarRental</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
    crossorigin="anonymous">
  <script defer src="https://use.fontawesome.com/releases/v5.0.4/js/all.js"></script>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="home.php">Car Rental</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>


    <div class="collapse navbar-collapse" id="navbarsExampleDefault">

      <!-- navbar links when signed in -->
      <ul class="navbar-nav mr-auto">
        <?php if(isset($_SESSION['user'])) { ?> 

          <li class="nav-item">
            <a class="nav-link" href="home.php">home</a>
          </li>

           <li class="nav-item">
            <a class="nav-link" href="offices.php">offices</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="cars_locations.php">cars locations</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="account.php">Logged in as<br> 
              <?php echo $userRow['first_name'] . ' ' . $userRow['last_name'];  ?>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout.php?logout">Sign Out</a>
          </li>
        

        <!-- navbar links when signed out -->

        <?php } else { ?>    
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link" href="index.php">login</a></li>
          <li class="nav-item"><a class="nav-link" href="register.php">register</a></li>
        <?php } ?> 
      </ul>
    </div>
  </nav>

  <!-- Start of the content for all pages -->
  <div class="container-fluid mt-5" id="all_container">

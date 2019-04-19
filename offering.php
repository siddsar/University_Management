<?php
include_once 'includes/db_connect.php';
// include_once 'includes/db_connect_ums.php';
include_once 'includes/functions.php';

sec_session_start();



 ?>

<!DOCTYPE html>
<html>
   <head>
   <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="Table_Format/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Table_Format/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Table_Format/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Table_Format/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Table_Format/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Table_Format/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Table_Format/css/util.css">
	<link rel="stylesheet" type="text/css" href="Table_Format/css/main.css">
<!--===============================================================================================-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

   <body>
<?php if (login_check($mysqli) == true) : ?>
      <?php
         // define variables and set to empty values
         $studentid = $course = $grade = "";

         if ($_SERVER["REQUEST_METHOD"] == "POST") {
		if (empty($_POST["gender"])) {
               $genderErr = "Gender is required";
            }else {
               $gender = test_input($_POST["gender"]);
            }
         }

         function test_input($data) {
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
         }
      ?>

      <h2>Offer Courses</h2>
      
      

<?php 


$sql = "SELECT Sem,Year from Ongoing where Today = CURDATE();";
// print($sql);
$res = $mysqli->query($sql);
$row = $res->fetch_assoc();
$sem = $row["Sem"];
$year = $row["Year"];
$email = $_SESSION["email"];
// print($email);
$sql = "SELECT Prof_id from Professor where Email_id = '$email';";
// print($sql);
$res = $mysqli->query($sql);
$row = $res->fetch_assoc();
$pid = $row["Prof_id"];
// print($roll);

 
?>

<div class = "form-group">
                  <form action="" method="POST">
                  <input type ="text" value = "Enter Course no" class = "form-control" name = "Course_code">
                  <input type ="text" value = "Enter Type Offered" class = "form-control" name = "Course_type">
                  <input type ="text" value = "Enter Time Slot" class = "form-control" name = "Time">
                  <button name ="Offer" class = "btn btn-primary">Offer</button>
                  </div>   
                  </form>
                  <?php 
                  if(isset($_POST["Offer"]))
                  {     
                     
                      
                     
                     if($query = $mysqli->prepare("INSERT INTO Course_offered values(?,?,?,?,?,?);"))
                     {
                                             
                        $query->bind_param('siiisi',$_POST["Course_code"],$sem,$year,$pid,$_POST["Course_type"],($_POST["Time"]));
                        // print($query);
                        if (!$query->execute()) {
                           header('Location: ../error.php?err=Registration failure: INSERT');
                           exit();
                       }
                       
                     }

                     printf("Successfully Offered!");
                     
                  }

                  ?>

<?php else : ?>
            <p>
                <span class="error">You are not authorized to access this page.</span> Please <a href="index.php">login</a>.
            </p>
<?php endif; ?>
       
   </body>
</html>


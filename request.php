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

      <h2>Requests Courses</h2>



<?php


$sql = "SELECT Sem,Year from Ongoing where Today = CURDATE();";
// print($sql);
$res = $mysqli->query($sql);
$row = $res->fetch_assoc();
$sem = $row["Sem"];
$year = $row["Year"];
$email = $_SESSION["email"];
// print($email);
$sql = "SELECT Roll_no from Student where Email_id = '$email';";
// print($sql);
$res = $mysqli->query($sql);
$row = $res->fetch_assoc();
$roll = $row["Roll_no"];
// print($roll);
$sql = "SELECT Course_offered.Course_code, Professor.Prof_id, Professor.Name, Course_offered.Type_offered FROM Course_offered, Professor where Sem = $sem and Year = $year and Professor.Prof_id = Course_offered.Prof_incharge_id;";
$result = $mysqli->query($sql) ;

?>
<div class='table100 ver3 m-b-110'>
      <div class="table100-body js-pscroll">
<?php

while($row = $result->fetch_assoc()) {
?>
      <form method = "POST" action = "<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">


         <table><tbody><tr class = "row100 body">
      <td class = "cell100 column1"><?php echo $row["Course_code"] ?></td>
		<td class = "cell100 column2"><?php echo $row["Name"] ?></td>


                  <td class = "cell100 column3">
                  <?php echo $row["Prof_id"] ?>
               </td>

               <td class = "cell100 column4">
                  <?php echo $row["Type_offered"] ?>
               </td>

            </tr>

      </form>

      <?php
          }
      ?>
      </tbody>
         </table>
               </div>
               </div>
<?php else : ?>
            <p>
                <span class="error">You are not authorized to access this page.</span> Please <a href="index.php">login</a>.
            </p>
        <?php endif; ?>
        <div class = "form-group">
                  <form action="" method="POST">
                  <input type ="text" value = "Enter Course no" class = "form-control" name = "Course_code">
                  <input type ="text" value = "Enter Prof id" class = "form-control" name = "Prof_id">
                  <input type ="text" value = "Course Type" class = "form-control" name = "Course_type">
                  <button name ="Request" class = "btn btn-primary">Request</button>
                  </div>
                  </form>
                  <?php
                  if(isset($_POST["Request"]))
                  {



                     if($query = $mysqli->prepare("INSERT INTO Course_request values(?,?,?,?,?,'Pending',?);"))
                     {

                        $query->bind_param('siiiis',$_POST["Course_code"],$sem,$year,$_POST["Prof_id"],$roll,$_POST["Course_type"]);
                        // print($query);
                        if (!$query->execute()) {
                           header('Location: ../error.php?err=Registration failure: INSERT');
                           exit();
                       }

                     }

                     printf("Successfully Requested!");

                  }

                  ?>
<p><a href="index.php">Go back to login page</a></p>
   </body>
</html>

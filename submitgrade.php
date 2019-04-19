<?php


 ?>

<!DOCTYPE html>
<html>

   <body>
      <?php
         // define variables and set to empty values
         $studentid = $course = $grade = "";

         if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if (empty($_POST["studentid"])) {
               $nameErr = "Student ID is required";
            }else {
               $studentid = test_input($_POST["studentid"]);
            }

            if (empty($_POST["course"])) {
               $courseErr = "course code is required";
            }else {
               $course = test_input($_POST["course"]);
            }

            if (empty($_POST["grade"])) {
               $subjectErr = "grade is required";
            }else {
               $grade = test_input($_POST["grade"]);
            }
         }

         function test_input($data) {
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
         }
      ?>

      <h2>Grade Updation</h2>

      <form method = "POST" action = "<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
         <table>
            <tr>
               <td>Student ID:</td>
               <td><input type = "number" name = "studentid">
                  <span class = "error">* <?php echo $nameErr;?></span>
               </td>
            </tr>

            <tr>
               <td>Course code: </td>
               <td><input type = "text" name = "course">
                  <span class = "error">* <?php echo $courseErr;?></span>
               </td>
            </tr>

            <tr>
               <td>Grade:</td>
               <td> <input type = "text" name = "grade">
                  <span class = "error">* <?php echo $subjectErr;?></span>
               </td>
            </tr>

            <tr>
               <td>
                  <input type = "submit" name = "submit" value = "Submit">
               </td>
            </tr>

         </table>
      </form>

      <?php
            $user_id = $_SESSION['username'];
$sql = "SELECT email FROM members WHERE username = '$user_id'";
$user_id = $mysqli->query($sql) ;
$row = $user_id->fetch_assoc();
$row = $row["email"];
$sql = "SELECT Prof_id FROM Professor WHERE Email_id = '$row'";
$prof_id = $mysqli->query($sql) ;
$row = $prof_id->fetch_assoc();
$row = $row["Prof_id"];
$sql = "SELECT email FROM members WHERE username = '$user_id'";

      ?>
<p><a href="index.php">Go back to login page</a></p>
   </body>
</html>

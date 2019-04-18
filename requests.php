<?php
include_once 'includes/db_connect.php';
include_once 'includes/functions.php';

sec_session_start();



 ?>

<!DOCTYPE html>
<html>

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

      <h2>Requests pending</h2>
<script>
	function accept_c(course_code,roll_no){
		console.log("blah");
		console.log(course_code);
		var mysql = require('mysql');		
		var con = mysql.createConnection({
  			host: "localhost",
			user: "root",
  			password: "10021999",
			database: "secure_login"
		});
		con.connect(function(err) {
  			if (err) throw err;
  			con.query("UPDATE Course_request SET address = 'Approved' WHERE Course_code = ".concat(course_code," AND Roll_no = ",roll_no,";"), function (err, result, fields) {
    				if (err) throw err;
    				console.log(result);
  			});
		});
		

		
	}
function reject_c(course_code,roll_no){
		console.log(course_code);
		var sql = "UPDATE Course_request SET address = 'Rejected' WHERE Course_code = ".concat("'",Course_code,"' and Roll_no = ",roll_no.toString());
  		ums_db.query(sql, function (err, result) {
		    if (err) throw err;
		    console.log(result.affectedRows + " record(s) updated");
  });	
	}
</script>

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
$sql = "SELECT * FROM Course_request where Prof_id = $row";
$result = $mysqli->query($sql) ;
 


while($row = $result->fetch_assoc()) {
?>
      <form method = "POST" action = "<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
         <table>

		<tr>
               <td>Requests:</td>
		<td><?php echo $row["Roll_no"] ?></td>
             
                  <td>
                  <input type="button" value="Accepted" onclick="accept_c('<?php echo $row["Course_code"] ?>','<?php echo $row["Roll_no"] ?>')">
<input type="button" value="Rejected" onclick="reject_c(".$row["Course_code"].",".$row["Roll_no"].")">
               </td>

            </tr>

         </table>
      </form>

      <?php
          }  
      ?>
<?php else : ?>
            <p>
                <span class="error">You are not authorized to access this page.</span> Please <a href="index.php">login</a>.
            </p>
        <?php endif; ?>

   </body>
</html>


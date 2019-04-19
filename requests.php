<?php
include_once 'includes/db_connect.php';
// include_once 'includes/db_connect_ums.php';
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
  			password: "sidanusar",
			database: "secure_login"
		});
      
		con.connect(function(err) {
  			if (err) throw err;
  			con.query("UPDATE Course_request SET address = 'Approved' WHERE Course_code = '".concat(course_code,"' AND Roll_no = ",roll_no,";"), function (err, result, fields) {
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


$email = $_SESSION["email"];
$sql = "SELECT * from Professor where Email_id = '". $email. "';";
// print($sql);
$res = $mysqli->query($sql);
$row = $res->fetch_assoc();
$row = $row["Prof_id"];
// print($row);
$sql = "SELECT * FROM Course_request where Prof_id = $row and status = 'Pending'; ";
$result = $mysqli->query($sql) ;
 


while($row = $result->fetch_assoc()) {
?>
      <form method = "POST" action = "<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
         <table>

		<tr>
      <td>Requests:</td>
		<td><?php echo $row["Roll_no"] ?></td>
      <script>
         var cc = <?php echo $row['Course_code']?>;
         var roll = <?php echo $row['Roll_no']?>;
      </script>
             
                  <td>
                  <input type="button" value="Accepted" onclick="accept_c(cc,roll)">
                  <input type="button" value="Rejected" onclick="reject_c(cc,roll)">  
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


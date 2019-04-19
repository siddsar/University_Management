<?php

include_once 'includes/db_connect_ums.php';
include_once 'includes/functions.php';

sec_session_start();
?>

<html>
    <head>
        <title> Grade Sheet</title>
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
    <button href = '../protected_page_student.php' type="button" class="btn btn-outline-primary btn-lg">Back to Home</button>
    <button type="button" class="btn btn-outline-success btn-lg">View CPI</button>
    <body>
            <div class="container-table100">
			<div class="wrap-table100">
            <div><h2>Grade Sheet for <?php echo htmlentities($_SESSION['username'])?> </h2></div>
    <?php
    if( $stmt = $mysqli_ums->prepare("SELECT Course_registration.Course_code, Course.Course_name, Course.Credits, Course_registration.Grade , Course_registration.Year, Course_registration.Sem FROM Course_registration, Course, Student WHERE Course_registration.Course_code = Course.Course_code AND Student.Roll_no = Course_registration.Roll_no AND Student.Email_id = ? ORDER BY Year, Sem;"))
    {
        $stmt->bind_param('s', $_SESSION['email']);  // Bind "$email" to parameter.
        $stmt->execute();    // Execute the prepared query.
        $stmt->store_result();
        echo $_SESSION['email'];
        // get variables from result.
        $stmt->bind_result($ccode, $cname, $credits, $grade, $year, $sem);

        $prev_yr = 0;
        $prev_sem = 0;
        $total_credits = 0;
        $weighted_sum = 0;
        $sem_credits = 0;
        $weighted_sem_credits = 0;

        while($stmt->fetch())
        {
            if($year != $prev_yr || $sem != $prev_sem)
            {

                if($prev_sem != 0)
                {
                    echo "</tbody>";
                    echo "</table>";
                    echo "</div>";
                    echo "</div>";

                    if($sem_credits != 0)
                    {
                        $spi = $weighted_sem_credits / $sem_credits;

                        echo "<div class = 'well-sm'><h4> SPI : ". $spi . "</h4></div>";

                    }
                    else
                    {
                        $cpi = $weighted_sum / $total_credits;
                        echo "<div class = 'well-sm'><h4> CPI : ". $cpi . "</h4></div>";
                    }
                    echo "</div>";
                    $weighted_sem_credits = 0;
                    $sem_credits = 0;
                }


                $prev_sem = $sem;
                $prev_yr = $year;
                echo "<div class = 'well'>";
                echo "<div class = 'well-sm'><h3> SEMESTER : ".$sem." YEAR: ".$year."</h3></div>";
                echo "<div class='table100 ver1 m-b-110'>";
                echo "<div class='table100-head'>";
                echo "<table>";
                echo "<thead>";
                echo "<tr class = 'row100 head'><th class = 'cell100 column1'> Course Code </th> <th class = 'cell100 column2'> Course Name </th> <th  class = 'cell100 column3'> Credits</th> <th class = 'cell100 column4'> Grade </th> </tr> ";
                echo "</thead>";
                echo "</table>";
                echo "</div>";
            }
            switch($grade)
            {
                case "A" :
                    $gp = 10;
                    break;
                case "B":
                    $gp = 8;
                    break;
                case "C":
                    $gp = 6;
                    break;
                case "D":
                    $gp = 4;
                    break;
                case "E":
                    $gp = 2;
                    break;
                case "F":
                    $gp = 0;
                    break;
                case "O":
                    $gp = -1;
                    break;

            }
            if($gp != -1)
            {
                $sem_credits += $credits;
                $weighted_sem_credits += $credits * $gp;
                $total_credits += $credits;
                $weighted_sum += $credits * $gp;
            }

                echo "<div class='table100-body js-pscroll'>";
                echo "<table>";
                echo "<tbody>";
                echo "<tr class = 'row100 body'><td class = 'cell100 column1'> ".$ccode." </td> <td class = 'cell100 column2'>".$cname." </td> <td  class = 'cell100 column3'> ".$credits."</td> <td class = 'cell100 column4'>".$grade." </td> </tr> ";

        }


    }
    else
    {
        header("Location: ../error.php?err=Database error: cannot prepare statement");
        exit();
    }

    ?>

    </div>
    </div>


<p><a href="index.php">Go back to login page</a></p>

</body>
</html>

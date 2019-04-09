<?php

include_once 'includes/db_connect_ums.php';
include_once 'includes/functions.php';

sec_session_start();
?>

<html>
    <head>
        Grade Sheet for User <?php echo htmlentities($_SESSION['username']); ?>
    </head>

    <?php 
    if( $stmt = $mysqli->prepare("SELECT Course_code, Grade FROM Course_registration WHERE email = ? ORDER BY Year, Sem;"))
    {
        $stmt->bind_param('s', $_SESSION['email']);  // Bind "$email" to parameter.
        $stmt->execute();    // Execute the prepared query.
        $stmt->store_result();

        // get variables from result.
        $stmt->bind_result($code, $grade);
        $stmt->fetch();

    }
    else
    {
        header("Location: ../error.php?err=Database error: cannot prepare statement");
        exit();
    }

    ?>

</html>
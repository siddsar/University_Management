<?php
include_once 'db_connect.php';
include_once 'psl-config.php';

$question = $_GET['err'];
$username = $_GET['err2'];

$error_msg = "";
?>

<?php
if (isset($_POST['answer'])) {
    $answer = filter_input(INPUT_POST, 'answer', FILTER_SANITIZE_STRING);
    // echo $answer;
    // echo $username;
    $prep_stmt = "SELECT answer FROM members WHERE username = ? LIMIT 1";
    $stmt = $mysqli->prepare($prep_stmt);
    if ($stmt) {
        $stmt->bind_param('s', $username);
        $stmt->execute();
        $stmt->bind_result($result);
        $stmt->store_result();
        if ($stmt->num_rows == 1) {
            // A user with this email address already exists
            while ($stmt->fetch());
            if($result == $answer){
                header('Location: reset.php?err2='.$username);
                exit();
            }
            else{
                // $error_msg .= '<p class="error">Security answer is wrong.</p>';
                header('Location: ../getlost.php');
                wxit();
            }
        }
    }
    else {
        $error_msg .= '<p class="error">Database error</p>';
    }
}

?>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Password Recovery</title>
        <script type="text/JavaScript" src="../js/sha512.js"></script>
        <script type="text/JavaScript" src="../js/forms.js"></script>
        <link rel="stylesheet" href="../styles/main.css" />
    </head>
    <body>
        <h2> <?php echo $question;  ?></h2>
        <!-- <h2> rgerg</h2> -->
        <!-- <form method="post" name="answer_form" action="forgot_error.php?err=" + "<?php echo $username; ?>" id="form" > -->
        <form action="forgot_error.php?err2=<?php echo $username ?>" method="post" id="form">
            Answer: <input type='text' name='answer' id='answer' /><br>
            <input type="button"
                   value="Reset"
                    onclick="return passform2(this.form, this.form.answer);" />
        </form>
        <p>Return to the <a href="../index.php">login page</a>.</p>

    </body>
</html>

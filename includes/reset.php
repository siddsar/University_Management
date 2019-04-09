<?php
include_once 'db_connect.php';
include_once 'psl-config.php';

$username = $_GET['err2'];

$error_msg = "";

if (isset($_POST['password'])) {
    $password = filter_input(INPUT_POST, 'p', FILTER_SANITIZE_STRING);
    if (strlen($password) != 128) {
        // The hashed pwd should be 128 characters long.
        // If it's not, something really odd has happened
        $error_msg .= '<p class="error">Invalid password configuration.</p>';
    }


    $stmt = $mysqli->prepare($prep_stmt);

    if (empty($error_msg)) {
        // Create a random salt
        $random_salt = hash('sha512', uniqid(openssl_random_pseudo_bytes(16), TRUE));
        // Create salted password
        $password = hash('sha512', $password . $random_salt);
        // Insert the new user into the database
        if ($insert_stmt = $mysqli->prepare("UPDATE members SET password = ?, salt = ? WHERE username = ?")) {
            $insert_stmt->bind_param('sss', $password, $random_salt, $username);
            // Execute the prepared query.
            if (! $insert_stmt->execute()) {
                header('Location: ../error.php?err=Password resetting failure: UPDATE');
                exit();
            }
            header('Location: ../okcool.php');
            exit();
        }
        exit();
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
        <h2> Create new password </h2>
        <form action="reset.php?err2=<?php echo $username ?>" method="post" id="form">
            Password: <input type="password"
                             name="password"
                             id="password"/><br>
            Confirm password: <input type="password"
                                     name="confirmpwd"
                                     id="confirmpwd" /><br>

            <input type="button"
                   value="Reset"
                    onclick="return passform3(this.form, this.form.password,this.form.confirmpwd);" />
        </form>
        <p>Return to the <a href="../index.php">login page</a>.</p>

    </body>
</html>

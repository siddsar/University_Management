<?php

/*
 * Copyright (C) 2013 peter
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

include_once 'db_connect.php';
include_once 'psl-config.php';

$error_msg = "";

if (isset($_POST['username'])) {
    // Sanitize and validate the data passed in
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
    $prep_stmt = "SELECT question FROM members WHERE username = ? LIMIT 1";
    $stmt = $mysqli->prepare($prep_stmt);
    if ($stmt) {
        $stmt->bind_param('s', $username);
        $stmt->execute();
        $stmt->bind_result($question);
        $stmt->store_result();
        if ($stmt->num_rows == 1) {
            // A user with this email address already exists
            while ($stmt->fetch());
            // echo $question;
            // include_once 'includes/question.php';
            header('Location: includes/forgot_error.php?err='.$question.'&err2='.$username);
            exit();
            echo "YOHOHOHOHO";
        }
        else{
            $error_msg .= '<p class="error">Username not registered </p>';
        }
    } else {
        $error_msg .= '<p class="error">Database error</p>';
    }
}

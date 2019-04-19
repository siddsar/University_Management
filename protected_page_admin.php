<?php
include_once 'includes/db_connect.php';
include_once 'includes/functions.php';

sec_session_start();

function createTable_from_sql_select_query($query) {
    $sql_link = $mysqli;// Database connection
    $sql_link->set_charset("utf8");
    $result = $sql_link->query($query);
    printf("CPT 1\n");
    // Adding Missing array_column Function for Old PHP Versions (<5.5)
    if (!function_exists('array_column')) {

        function array_column($array, $column) {
            $ret = array();
            foreach ($array as $row)
                $ret[] = $row[$column];
            return $ret;
        }

    }
    printf("cpt2\n");
    $headings = json_decode(json_encode($result->fetch_fields()), true);
    $headings = array_column($headings, 'name');
    printf("cpt3\n");
      $return = '<table>';
      $return .= '<thead><tr>';
      for ($x = 0; $x <= (count($headings) - 1); $x++) {
      $return .= '<th>' . ucwords(str_replace('_', ' ', (strtolower($headings[$x])))) . '</th>';
      }
      $return .= '</tr></thead><tbody>';
      while ($row = $result->fetch_object()) {
      $return .= '<tr>';
      for ($x = 0; $x <= (count($headings) - 1); $x++) {
      $return .= '<td>' . $row->$headings[$x] . '</td>';
      }
      $return .= '</tr>';
      }
      $return .= '</tbody></table>';
      printf("cpt4\n");
      return $return;
}
?>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Secure Login: Protected Page</title>
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
        <p>Welcome <?php echo htmlentities($_SESSION['username']); ?>!</p>
        <div class="form-group">
            <form action="" method="POST">
                    <input type = "text" class="form-control" value = "Select queries here!" name = "query"/>
</div>
<div class="form-group">
                    <button name="test" class = "btn btn-primary" >Search</button>
            </form>
</div>
            <?php
                if(isset($_POST["test"]))
                {
                    if(!isset($_POST["query"]))
                    {
                        printf("No query\n");
                    }
                    else{
                        $query = $_POST["query"];
                        printf("%s\n",$query);

                        $sql_link = $mysqli;// Database connection
                        $sql_link->set_charset("utf8");
                        $result = $sql_link->query($query);
                        // printf("CPT 1\n");
                        // Adding Missing array_column Function for Old PHP Versions (<5.5)
                        if (!function_exists('array_column')) {

                            function array_column($array, $column) {
                                $ret = array();
                                foreach ($array as $row)
                                    $ret[] = $row[$column];
                                return $ret;
                            }

                        }
                        // printf("cpt2\n");
                        $headings = json_decode(json_encode($result->fetch_fields()), true);
                        $headings = array_column($headings, 'name');
                        // printf("cpt3\n");
                        $return ="<div class='table100 ver3 m-b-110'><div class='table100-head'><table>";
                        $return .= '<thead><tr class = "row100 head">';
                        for ($x = 0; $x <= (count($headings) - 1); $x++) {
                        $return .= "<th class = 'cell100 column".($x+1)."'>" . ucwords(str_replace('_', ' ', (strtolower($headings[$x])))) . '</th>';
                        }
                        $return .= '</tr></thead></table></div>';
                        while ($row = $result->fetch_object()) {
                            // printf("**********************\n");
                        $return .= '<div class="table100-body js-pscroll"><table><tbody><tr class = "row100 body">';
                        for ($x = 0; $x <= (count($headings) - 1); $x++) {
                            $h = $headings[$x];
                        // printf("%s ** %s ** ", $headings[$x], $row->$h );
                        $return .= '<td class = "cell100 column'.($x+1).'">'. $row->$h . '</td>';
                        }
                        $return .= '</tr>';
                        }
                        $return .= '</tbody></table></div></div>';
                        // printf("cpt4\n");
                        $html =  $return;

                        // echo "hello";
                        print($html);
                    }
                }
            ?>

            <div class="form-group">
                <form action="" method="POST">
                        <input type = "text" class="form-control" value = "" name = "update"/>
            </div>
            <div class="form-group">
                        <button name="upd"class="form-control" >Update/Insert/Delete</button>
                </form>
            </div>
                <?php
                    if(isset($_POST["upd"]))
                    {
                        if(!isset($_POST["update"]))
                        {
                            printf("No query\n");
                        }
                        else{
                            $query = $_POST["update"];
                            printf("%s\n",$query);

                            $sql_link = $mysqli;// Database connection
                            $sql_link->set_charset("utf8");
                            if($sql_link->query($query) == TRUE)
				{
					echo "Updated successfully";
				}
				else
				{
					echo "Error :",$sql_link->error;
}
                            // printf("CPT 1\n");
                            // Adding Missing array_column Function for Old PHP Versions (<5.5)
                            // if (!function_exists('array_column')) {
                            //
                            //     function array_column($array, $column) {
                            //         $ret = array();
                            //         foreach ($array as $row)
                            //             $ret[] = $row[$column];
                            //         return $ret;
                            //     }
                            // 
                            // }
                            // printf("cpt2\n");
                            //$headings = json_decode(json_encode($result->fetch_fields()), true);
                            //echo $headings;

                            // $headings = array_column($headings, 'name');
                            // // printf("cpt3\n");
                            // $return ="<div class='table100 ver3 m-b-110'><div class='table100-head'><table>";
                            // $return .= '<thead><tr class = "row100 head">';
                            // for ($x = 0; $x <= (count($headings) - 1); $x++) {
                            // $return .= "<th class = 'cell100 column".($x+1)."'>" . ucwords(str_replace('_', ' ', (strtolower($headings[$x])))) . '</th>';
                            // }
                            // $return .= '</tr></thead></table></div>';
                            // while ($row = $result->fetch_object()) {
                            //     // printf("**********************\n");
                            // $return .= '<div class="table100-body js-pscroll"><table><tbody><tr class = "row100 body">';
                            // for ($x = 0; $x <= (count($headings) - 1); $x++) {
                            //     $h = $headings[$x];
                            // // printf("%s ** %s ** ", $headings[$x], $row->$h );
                            // $return .= '<td class = "cell100 column'.($x+1).'">'. $row->$h . '</td>';
                            // }
                            // $return .= '</tr>';
                            // }
                            // $return .= '</tbody></table></div></div>';
                            // // printf("cpt4\n");
                            // $html =  $return;
                            //
                            // // echo "hello";
                            // print($html);
                        }
                    }
                ?>
<a href="index.php">Go back to login page</a>
        <?php else : ?>
            <p>
                <span class="error">You are not authorized to access this page.</span> Please <a href="index.php">login</a>.
            </p>
        <?php endif; ?>
    </body>
</html>

<?php
include "db.php";
// adding employee to the database

    $code = mysqli_real_escape_string($connect, $_POST['code']);
    

    $query = "SELECT material FROM recycle_data WHERE id = $code"

    $results = mysqli_query($connect, $query);
    if($results>0)
    {
        echo "code located in database";
    }


<?php
$username="id21061150_jay";//change username
$password="Jaycheck12!"; //change password
$host="localhost";
$db_name="id21061150_finalproject"; //change databasename

$connect=mysqli_connect($host,$username,$password,$db_name);
$conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);

if(!$connect)
{
	echo json_encode("Connection Failed");
}
else{

}

// code for query

<?php
require_once('db.php');
$query = 'SELECT * FROM project1';
$stm = $conn->prepare($query);
$stm->execute();
$row= $stm->fetchALL(PDO::FETCH_ASSOC);

echo json_encode($row);

// code for insert

<?php
include "db.php";
// adding employee to the database

    $name = mysqli_real_escape_string($connect, $_POST['name']);
    $last = mysqli_real_escape_string($connect, $_POST['last']);

    $query =
    "INSERT INTO project1 (firstName,lastName) VALUES('$name','$last')";

    $results = mysqli_query($connect, $query);
    if($results>0)
    {
        echo "user added successfully";
    }

    ?>




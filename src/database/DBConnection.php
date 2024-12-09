<?php
$servername = "localhost:3309";
$username = "root";
$password = 'NotCat24';
$dbname = "classmaster";

$conn = new mysqli($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

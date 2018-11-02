<?php
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $db = "webapp";

    $conn = mysqli_connect($servername, $username, $password,$db); // Create connection

    if (!$conn)
       die("Connection failed: " . mysqli_connect_error()); // Check connection
?>
<?php
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $db = "webapp";

    $conn = mysqli_connect($servername, $username, $password,$db); // Create connection
    $query1 = "SELECT * FROM Customer";
    $result = mysqli_query($conn, $query1);
    $check = mysqli_num_rows($result);
    //Running query 1
    if ($check > 0) {
        # code...
        echo "<table border='1'>
                    <tr>
                    <th>ID</th>
                    <th>Name</th>
                    </tr>";
        while ($row = mysqli_fetch_array($result)) {
            # code...
            echo '<tr>';
            echo '<td>'.$row['c_id'].'</td>'; // was giving me a warning in the browser
            echo '<td>'.$row['c_name'].'</td>'; // was giving me a warning in the browser
            echo '</tr>';
        }
        echo "</table>";
    }

    $query2 = " SELECT C.c_state AS State, count(*) AS CustormerCount
                    FROM Customer C
                        GROUP BY C.c_state;";
    $result2 = mysqli_query($conn, $query2);
    $check2 = mysqli_num_rows($result2);

    //Running query 2
    if ($check2 > 0) {
        # code...
        echo '<hr>';
        echo 'Running query 10';
        echo "<table border='1'>
                    <tr>
                    <th>STATE</th>
                    <th>CUSTOMER COUNT</th>
                    </tr>";
        while ($row = mysqli_fetch_array($result2)) {
            # code...
            echo '<tr>';
            echo '<td>'.$row['State'].'</td>'; // was giving me a warning in the browser
            echo '<td>'.$row['CustormerCount'].'</td>'; // was giving me a warning in the browser
            echo '</tr>';
        }
        echo "</table>";
    }

    //Stored procedures
    //Ref: http://www.mysqltutorial.org/php-calling-mysql-stored-procedures/

    $sp1 = "CALL `ProductLineSale`()";
    mysqli_query($conn, $sp1); // Initiate Procedure
    $sp1 = "SELECT * FROM Product;";
    $result3 = mysqli_query($conn, $sp1); // Get Product Contents

    if (mysqli_num_rows($result3) > 0) {
        echo '<hr>';
        echo '<h2>Result of Stored Procedure 1: Products with new SalesPrice column</h2>';
        echo "<table border='1'>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Finish</th>
                        <th>Price</th>
                        <th>Product Line ID</th>
                        <th>Photo</th>
                        <th>SalePrice</th>
                    </tr>";
        while ($row = mysqli_fetch_array($result3)) {
            # code...
    /*
            echo '<tr>';
            echo '<td>'.$row['SalePrice'].'</td>'; // was giving me a warning in the browser
            echo '</tr>';
    */
            echo '  <tr>
                        <td>'.$row['p_id'].'</td>
                        <td>'.$row['p_name'].'</td>
                        <td>'.$row['p_finish'].'</td>
                        <td>'.$row['p_standard_price'].'</td>
                        <td>'.$row['pl_id'].'</td>
                        <td>'.$row['p_photo'].'</td>
                        <td>'.$row['SalePrice'].'</td>
                    </tr>';
    
        }
        echo "</table>";
    } else
        echo 'Nothing in table';

?>
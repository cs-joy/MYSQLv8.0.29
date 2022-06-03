<?php

require __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$host = $_ENV['SERVER'];
$username = $_ENV['USERNAME'];
$password = $_ENV['PASSWORD'];
$database = $_ENV['DATABASE'];

$connection = new mysqli($host, $username, $password, $database);

if ($connection->connect_error) {
    echo "Connection failed: " . $connection->connect_error;
}

if (isset($_POST['create'])) {
    $name = $_POST['name'];
    $position = $_POST['position'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    $query = "INSERT INTO employeer (name, position, email, password) VALUES (?, ?, ?, ?)";
    $stmtselect = $connection->prepare($query);
    $exe = $stmtselect->execute([$name, $position, $email, $password]);

    if ($exe) {
        echo "ok";
        header('Location: index.php');
    } else {
        echo "Failed To Submit, Please try again";
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MYSQL</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>

<body>
    <div class="container my-5">
        <form action="index.php" method="post">
            <label>name</label>
            <input type="text" name="name" required>
            <label>position</label>
            <input type="text" name="position" required>
            <label>email</label>
            <input type="email" name="email" required>
            <label>password</label>
            <input type="password" name="password" required>

            <input type="submit" name="create" value="Submit">
        </form>
        <hr />
        <hr />
        <div>
            <h3>SELECT Statement</h3>
            <hr />
            <?php
            $sql = "SELECT name FROM employeer";
            $execution = mysqli_query($connection, $sql);
            if ($execution) {
                while ($row = mysqli_fetch_assoc($execution)) {
                    $name = $row['name'];

                    //echo $name ." | " ."\n";
                    echo "<h3>$name</h3>";
                }
            }
            ?>

        </div>
        <hr />
        <div>
            <h3>WHERE Statement</h3>
            <hr />
            <?php
            $sql = "SELECT * FROM employeer WHERE email='john@gmail.com'";
            $execution = mysqli_query($connection, $sql);
            if ($execution) {
                while ($row = mysqli_fetch_assoc($execution)) {
                    $name = $row['name'];

                    //echo $name ." | " ."\n";
                    echo "<h3>$name</h3>";
                }
            }
            ?>

        </div>
        <div>
            <h3>CREATE Statement</h3>
            <hr />
            <?php

            if (isset($_POST['pcreate'])) {
                $sql = "CREATE TABLE productsTest(ProductID int(11), ProductName varchar(110), SupplierID int(11), CategoryID int(11), Unit varchar(110), Price varchar(110))";
                $execution = mysqli_query($connection, $sql);
                if ($execution) {
                    echo "your product table create successfully";
                    header('Location: index.php');
                }
            }

            ?>
            <form action="index.php" method="post">
                <button type="submit" name="pcreate">Table Create</button>
            </form>
        </div>
        <div>
            <h3>Import data into products table</h3>
            <form action="index.php" method="post">
                <label>ProductID</label>
                <input type="text" name="ProductID" required>
                <label>ProductName</label>
                <input type="text" name="ProductName" required>
                <label>SupplierID</label>
                <input type="text" name="SupplierID" required>
                <label>CategoryID</label>
                <input type="text" name="CategoryID" required>
                <label>Unit</label>
                <input type="text" name="Unit" required>
                <label>Price</label>
                <input type="text" name="Price" required>

                <input type="submit" name="sign" value="Submit">
            </form>
            <?php
              if (isset($_POST['sign'])) {
                $pID = $_POST['ProductID'];
                $pName = $_POST['ProductName'];
                $sID = $_POST['SupplierID'];
                $cID = $_POST['CategoryID'];
                $unit = $_POST['Unit'];
                $price = $_POST['Price'];
            
                $query = "INSERT INTO products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price) VALUES (?, ?, ?, ?, ?, ?)";
                $stmtselect = $connection->prepare($query);
                $exe = $stmtselect->execute([$pID, $pName, $sID, $cID, $unit, $price]);
            
                if ($exe) {
                    echo "data submitted";
                } else {
                    echo "Failed To Submit, Please try again";
                }
            }
            ?>
        </div>
        <div>
            <h3>DELETE Statement</h3>
            <hr />
            <?php

            if (isset($_POST['remove'])) {
                $sql = "DELETE FROM products WHERE ProductName='Ikura'";
                $execution = mysqli_query($connection, $sql);
                if ($execution) {
                    echo " removed successfully";
                }
            }

            ?>
            <form action="index.php" method="post">
                <button type="submit" name="remove">Delete Table</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>

</html>
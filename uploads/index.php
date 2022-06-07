<?php

require __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$server = $_SERVER['SERVER'];
$user = $_SERVER['USERNAME'];
$password = $_SERVER['PASSWORD'];
$db = $_SERVER['DATABASE'];

$connection = new mysqli($server, $user, $password, $db);

if ($connection->connect_error) {
    echo "Connenction failed: " . $connection->connect_error;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uploading Document</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>

<body>
    <div id="content">
        <form action="index.php" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="file" class="form-control" name="uploadfile" value="" />

                <button class="btn btn-primary" type="submit" name="upload">UPLOAD</button>

                <?php
                  error_reporting(0);

                  $msg = "";

                  // If upload button is clicked ...
                  if (isset($_POST['upload'])) {

                    $filename = $_FILES["uploadfile"]["name"];
                    $tempname = $_FILES["uploadfile"]["tmp_name"];

                    // path to store the uploaded image
                    $folder = "./image/" . $filename;

                    // Get all the submitted data from the form
                    $sql = "INSERT INTO images (filename) VALUES ('$filename')";

                    // Execute query
                    mysqli_query($connection, $sql);

                    // Now let's move the uploaded image into the folder: image
                    if (move_uploaded_file($tempname, $folder)) {
                        echo "<h3>  Image uploaded successfully!</h3>";
                    } else {
                        echo "<h3>  Failed to upload image!</h3>";
                    }
                  }
                ?>

            </div>
        </form>
    </div>
    <div id="display-image">
        <?php

          $query = "SELECT * FROM images";

          //execute query
          $execution_result = mysqli_query($connection, $query);

          if ($execution_result) {
            while ($data = mysqli_fetch_assoc($execution_result)) {
                $im = $data['filename'];

                echo "<img src=image/$im />";
                echo "<br />";
            }
          }
        ?>
    </div>
</body>

</html>
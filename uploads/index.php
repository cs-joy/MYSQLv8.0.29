<?php

require __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$server = $_SERVER['SERVER'];
$user = $_SERVER['USERNAME'];
$password = $_SERVER['PASSWORD'];
$db = $_SERVER['DATABASE'];

$connection = new mysqli($server, $user, $password, $db);

if($connection->connect_error){
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

                <button class="btn btn-primary" type="submit" name="upload" >UPLOAD</button>
                
            </div>
        </form>
    </div>
    <div id="display-image">
        <?php

        $query = "SELECT * FROM images";
        $execution_result = mysqli_query($connection, $query);

        while($data = mysqli_fetch_assoc($execution_result)){
        ?>
        <img src="image/<?php echo $data['filename']; ?>">
        <?php
        }
        ?>
    </div>
</body>
</html>
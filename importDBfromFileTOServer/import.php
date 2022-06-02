<?php

require __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$host = $_ENV['SERVER'];
$user = $_ENV['USERNAME'];
$pass = $_ENV['PASSWORD'];
$db = $_ENV['DATABASE'];

?>

<?php
$message = '';
if (isset($_POST["import"])) {
    if ($_FILES["database"]["name"] != '') {
        $array = explode(".", $_FILES["database"]["name"]);
        $extension = end($array);
        if ($extension == 'sql') {
            $connect = mysqli_connect($host, $user, $pass, $db);
            $output = '';
            $count = 0;
            $file_data = file($_FILES["database"]["tmp_name"]);
            foreach ($file_data as $row) {
                $start_character = substr(trim($row), 0, 2);
                if ($start_character != '--' || $start_character != '/*' || $start_character != '//' || $row != '') {
                    $output = $output . $row;
                    $end_character = substr(trim($row), -1, 1);
                    if ($end_character == ';') {
                        if (!mysqli_query($connect, $output)) {
                            $count++;
                        }
                        $output = '';
                    }
                }
            }
            if ($count > 0) {
                $message = '<label class="text-danger">There is an error in Database Import</label>';
            } else {
                $message = '<label class="text-success">Database Successfully Imported</label>';
            }
        } else {
            $message = '<label class="text-danger">Invalid File</label>';
        }
    } else {
        $message = '<label class="text-danger">Please Select Sql File</label>';
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Importing</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>
    <br /><br />
    <div class="container" style="width:700px;">
        <h3 align="center">Import SQL File in Mysql Database using PHP</h3>
        <br />
        <div><?php echo $message; ?></div>
        <form method="post" enctype="multipart/form-data">
            <p><label>Select Sql File</label>
                <input type="file" name="database" />
            </p>
            <br />
            <input type="submit" name="import" class="btn btn-info" value="Import" />
        </form>
    </div>
</body>

</html>
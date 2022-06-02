<?php

require __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$host = $_ENV['SERVER'];
$mysql_username = $_ENV['USERNAME'];
$mysql_password = $_ENV['PASSWORD'];
$mysql_database = $_ENV['DATABASE'];

?>

<?php

// Name of the file
$filename = 'sale_pr.sql';
$table = "promotions";
// Connect to MySQL server
$con = @new mysqli($mysql_host,$mysql_username,$mysql_password,$mysql_database);

// Check connection
if ($con->connect_error) {
    echo "Failed to connect to MySQL: " . $con->connect_error;
    echo "<br/>Error: " . $con->connect_error;
}

// Temporary variable, used to store current query
$templine = '';
// Read in entire file
$lines = file($filename);
// Loop through each line
foreach ($lines as $line) {
// Skip it if it's a comment
    if (substr($line, 0, 2) == '--' || $line == '')
        continue;

// Add this line to the current segment
    $templine .= $line;
// If it has a semicolon at the end, it's the end of the query
    if (substr(trim($line), -1, 1) == ';') {
        // Perform the query
        $con->query($templine) or print('Error performing query \'<strong>' . $templine . '\': ' . $con->connect_error . '<br /><br />');
        // Reset temp variable to empty
        $templine = '';
    }
}

echo "Data imported successfully to $table table";

mysqli_close($con);
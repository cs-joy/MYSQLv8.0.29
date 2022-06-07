<?php

require __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$server = $_SERVER['SERVER'];
$user = $_SERVER['USERNAME'];
$password = $_SERVER['PASSWORD'];
$db = $_SERVER['DATABASE'];

$connect = new mysqli($server, $user, $password, $db);

if ($connect->connect_error) {
    echo "Connenction failed: " . $connect->connect_error;
}


?>
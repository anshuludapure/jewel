<?php 
// Database connection settings
$servername = "localhost";
$username = "root";
$password = "";
$database = "jewels_14_march";
try { 
     // Create a PDO instance
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    // Set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $conn;
} catch(PDOException $e) {
    // Return error message if connection fails
    echo json_encode(array('error' => 'Connection failed: ' . $e->getMessage()));
}
// Close connection
$conn = null;

?>
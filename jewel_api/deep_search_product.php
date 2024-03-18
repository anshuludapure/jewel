<?php
error_reporting(0);
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-Type: application/json');
require_once "_inc/dbc.php";

$keyword = ($_GET['query'])? $_GET['query']:'Gold';

    $sql = "SELECT * FROM products WHERE keywords LIKE '%". $_GET['query']."%'OR product_description like '%".$_GET['query']."%' UNION SELECT * FROM category WHERE keyword LIKE '%".$_GET['query']."%'";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    if ($products) {
        echo json_encode(
            array(
                'found'=>$stmt->rowCount(),
                'products'=>$products
            ));
    } else {
        echo json_encode(array('found' => 0));
    }
?>

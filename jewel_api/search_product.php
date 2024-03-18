<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-Type: application/json');
require_once "_inc/dbc.php";

$keyword = ($_GET['query'])? $_GET['query']:'Gold';

    $sql = "SELECT * FROM products WHERE product_name LIKE ? OR product_description LIKE ?";
    $stmt = $conn->prepare($sql);
    $params = array("%$keyword%","%$keyword%");
    $stmt->execute($params);
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

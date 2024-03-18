<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-Type: application/json');
require_once "../_inc/dbc.php";
sleep(1);

    $filter = (isset($_GET['filter']))? $_GET['query']:'Rings';
    $limit = (isset($_GET['limit']))? $_GET['limit']:10;

    $sql = "SELECT * FROM `category` order by rand() LIMIT $limit";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    if ($products) {
        echo json_encode(
            array(
                'found'=>$stmt->rowCount(),
                'products'=>$products
            ),JSON_PRETTY_PRINT);
    } else {
        echo json_encode(array('found' => 0));
    }
?>

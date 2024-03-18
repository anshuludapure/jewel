<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-Type: application/json');
require_once "../_inc/dbc.php";
require_once "../_inc/functions.php";
sleep(1);

    $catId = (isset($_GET['catId']))? $_GET['catId']:1;

    $sql = "SELECT * FROM `products` WHERE `cat_id` = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$catId]);
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    if ($products) {
        echo json_encode(
            array(
                'found'=>$stmt->rowCount(),
                'catName' => getCatNameById($conn,$catId),
                'products'=>$products
            ),JSON_PRETTY_PRINT);
    } else {
        echo json_encode(array('found' => 0));
    }
?>

<?php 
function getCatNameById($conn,$id) { 
    $sql = "SELECT * FROM `category` WHERE `cat_id` = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$id]);
    $categoryName = $stmt->fetch(PDO::FETCH_OBJ);
    return $categoryName->cat_name;
}

?>
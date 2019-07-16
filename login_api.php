<?php
require __DIR__. '/_db_connetion.php';  //連結資料庫

$result = [
    'success' => false,
    'code' => 0,
    'info' => '資料欄位不足',
    'post' => $_POST,

];

// TODO: 檢查欄位
if(empty($_POST['email']) or empty($_POST['password'])){
    // 兩個欄位只要有一個沒填, 就結束
    echo json_encode($result);
    exit;
}

$stmt = $pdo->prepare("SELECT `sid`, `email`, `password`,`nickname` FROM `members` WHERE `email`=? AND `password`=SHA1(?) ");

$stmt->execute([
    $_POST['email'],
    $_POST['password'],

]);

if($stmt->rowCount()==1){
    $result['success'] = true;
    $result['info'] = '會員登入成功';

    $_SESSION['loginUser'] = $stmt->fetch(PDO::FETCH_ASSOC);
} else {
    $result['info'] = '帳號或密碼錯誤';
    $result['code'] = 400;
}

echo json_encode($result, JSON_UNESCAPED_UNICODE);



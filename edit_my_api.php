<?php
require __DIR__. '/_db_connetion.php';  //連結資料庫

$result = [
    'success' => false,
    'code' => 0,
    'info' => '資料欄位不足',
    'post' => $_POST,
];

// TODO: 檢查欄位
if(empty($_POST['sid']) or empty($_POST['password']) or empty($_POST['nickname'])){
    // 三個欄位只要有一個沒填, 就結束
    echo json_encode($result);
    exit;
}

// 判斷密碼正不正確
$sql = "SELECT * FROM `members` WHERE `sid`=? AND `password`=SHA1(?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([
    $_POST['sid'],
    $_POST['password'],
]);

if( $stmt->rowCount()<1 ){
    $result['code'] = 430;
    $result['info'] = '密碼錯誤';

    echo json_encode($result);
    exit;
}

$sql = "UPDATE `members` SET `mobile`=?,`address`=?,`birthday`=?,`nickname`=? WHERE `sid`=?";

$stmt = $pdo->prepare($sql);

$stmt->execute([
    $_POST['mobile'],
    $_POST['address'],
    $_POST['birthday'],
    $_POST['nickname'],
    $_POST['sid'],
]);

if($stmt->rowCount()==1){
    $result['success'] = true;
    $result['info'] = '資料修改成功';

    $_SESSION['loginUser']['nickname'] = $_POST['nickname'];
} else {
    $result['info'] = '資料修改失敗';
    $result['code'] = 400;
}

echo json_encode($result, JSON_UNESCAPED_UNICODE);



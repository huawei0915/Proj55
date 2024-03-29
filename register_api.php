<?php
require __DIR__. '/_db_connetion.php';  //連結資料庫

$result = [
    'success' => false,
    'code' => 0,
    'info' => '新增欄位不足',
    'post' => $_POST,

];

// TODO: 檢查欄位
if(empty($_POST['email']) or empty($_POST['password']) or empty($_POST['nickname'])){
    // 三個欄位只要有一個沒填, 就結束
    echo json_encode($result);
    exit;
}

//檢查email是否有註冊過
$sql = "SELECT * FROM `members` WHERE `email`=?";
$stmt = $pdo->prepare($sql);
$stmt->execute([$_POST['email']]);
if( $stmt->rowCount()>=1 ){
    $result['code'] = 420;
    $result['info'] = '此 email 已註冊過';

    echo json_encode($result);
    exit;
}




$hash=SHA1($_POST['email'].uniqid(). rand());   // 產生一個不容易相同的字串

$stmt = $pdo->prepare("INSERT INTO `members`( `email`, `password`, `mobile`, `address`, `birthday`, `hash`,  `nickname`, `created_at`) VALUES (
     ?, SHA1(?), ?, ?,
     ?, ?, ?, NOW()
 )");

$stmt->execute([
    $_POST['email'],
    $_POST['password'],
    $_POST['mobile'],
    $_POST['address'],
    $_POST['birthday'],
    $hash,
    $_POST['nickname'],
]);

if($stmt->rowCount()==1){
    $result['success'] = true;
    $result['info'] = '資料新增成功';
} else {
    $result['info'] = '資料新增錯誤';
    $result['code'] = 400;
}

echo json_encode($result, JSON_UNESCAPED_UNICODE);



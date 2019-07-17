<?php
require __DIR__. '/_db_connetion.php'; 

$page_name = 'edit_my';

$sql = "SELECT * FROM `members` WHERE `sid`=". intval($_SESSION['loginUser']['sid']);

$row = $pdo->query($sql)->fetch(PDO::FETCH_ASSOC);


if(empty($row)){
    header('Location: ./');
    exit;
}

?>
<?php include __DIR__. '/__html_header.php' ?>


<?php include __DIR__. '/__html_nav.php' ?>
<div class="container">

    <div class="row" style="margin-top: 2rem;">
 
        <div class="col-lg-6">
        
            <div class="card">
            <div class="alert alert-success" role="alert" id="alertInfo" style="display:none;"> </div>
                <div class="card-body">

                    <h5 class="card-title">個人資料修改</h5>
                    <form method="post" onsubmit="return checkform()">
                        <div class="form-group">
                            <input type="hidden" name="sid" value="<?= $row['sid'] ?>">
                            <label for="email">信箱(帳號)</label>
                            <input type="email" class="form-control" id="email" name="email" value="<?= htmlentities($row['email']) ?>" disable>
                            <small  class="form-text"></small>
                        </div>
                        
                        
                        <div class="form-group">
                            <label for="nickname">*暱稱</label>
                            <input type="text" class="form-control" id="nickname" name="nickname" value="<?= htmlentities($row['nickname']) ?>">
                            <small  class="form-text"></small>
                        </div>
                        <div class="form-group">
                            <label for="mobile">電話</label>
                            <input type="text" class="form-control" id="mobile" name="mobile" value="<?= htmlentities($row['mobile']) ?>">
                            <small  class="form-text"></small>
                        </div>
                        <div class="form-group">
                            <label for="birthday">生日</label>
                            <input type="text" class="form-control" id="birthday" name="birthday"  value="<?= htmlentities($row['birthday']) ?>">
                            <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                        </div>
                        <div class="address">
                            <label for="address">住址</label>
                            <textarea type="text" class="form-control" rows=5 id="address" name="address" ><?= htmlentities($row['address']) ?></textarea>
                            <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                        </div>
                        <div class="form-group">
                            <label for="password">*原密碼</label>
                            <input type="password" class="form-control" id="password" name="password" >
                            <small  class="form-text"></small>
                        </div>
                        <button type="submit" class="btn btn-primary my-3" id="submitBtn">資料修改</button>
                    </form>
                </div>
            </div>





        </div>
    </div>
</div>
<?php include __DIR__. '/__html_script.php' ?>
<script>
var alertInfo=$("#alertInfo");
var submitBtn = $('#submitBtn');
var $nickname=$("#nickname");

var $password=$("#password");

var file=[$nickname,$password];


function checkform(){

file.forEach(function(val){
    val.next().text('');
});
alertInfo.hide();
// submitBtn.hide();


    var ispass=true;
    var mobileRegex = /^09\d{2}\-?\d{3}\-?\d{3}$/;

    if($nickname.val().length<2){
        ispass=false;
        $nickname.next().text("輸入長度太短");
    }
 
    if($password.val().length<6){
        ispass=false;
        $password.next().text("密碼長度太短");
    }

        if(ispass){
            $.post('edit_my_api.php',$(document.forms[0]).serialize(),function(data){
                console.log(data);

                // alert(data.info);
        if(data.success){
            // location.href = 'data_list.php';
            alertInfo.removeClass("alert-danger");
            alertInfo.addClass("alert-success");

            $('#my_nickname').text($nickname.val());
        }else{
            alertInfo.removeClass("alert-success");
            alertInfo.addClass("alert-danger");
        }   
                alertInfo.text(data.info);
                alertInfo.show();
                submitBtn.show();
            },'json')
        }
    return false;
}

</script>

<?php include __DIR__. '/__html_footer.php' ?>

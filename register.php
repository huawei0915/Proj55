<?php
include __DIR__ . '/_db_data.php';

$page_name = 'register';

?>
<?php include __DIR__. '/__html_header.php' ?>


<?php include __DIR__. '/__html_nav.php' ?>
<div class="container">

    <div class="row" style="margin-top: 2rem;">
 
        <div class="col-lg-6">
        
            <div class="card">
            <div class="alert alert-success" role="alert" id="alertInfo" style="display:none;"> </div>
                <div class="card-body">

                    <h5 class="card-title">會員註冊</h5>
                    <form method="post" onsubmit="return checkform()">
                        <div class="form-group">
                            <label for="email">*信箱(帳號)</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="信箱">
                            <small  class="form-text"></small>
                        </div>
                        <div class="form-group">
                            <label for="password">*密碼</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="密碼">
                            <small  class="form-text"></small>
                        </div>
                        <div class="form-group">
                            <label for="password_check">*密碼確認</label>
                            <input type="password" class="form-control" id="password_check" name="password_check" placeholder="密碼確認">
                            <small  class="form-text"></small>
                        </div>
                        <div class="form-group">
                            <label for="nickname">*暱稱</label>
                            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="暱稱">
                            <small  class="form-text"></small>
                        </div>
                        <div class="form-group">
                            <label for="mobile">電話</label>
                            <input type="text" class="form-control" id="mobile" name="mobile" placeholder="電話">
                            <small  class="form-text"></small>
                        </div>
                        <div class="form-group">
                            <label for="birthday">生日</label>
                            <input type="text" class="form-control" id="birthday" name="birthday" placeholder="YYYY-MM-DD">
                            <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                        </div>
                        <div class="address">
                            <label for="address">住址</label>
                            <textarea type="text" class="form-control" rows=5 id="address" name="address" ></textarea>
                            <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                        </div>
                        
                        <button type="submit" class="btn btn-primary my-3" id="submitBtn">註冊</button>
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
var $email=$("#email");
var $password=$("#password");
var $password_check=$("#password_check");
var file=[$nickname,$email,$password,$password_check];


function validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }


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
    if(! validateEmail($email.val())) {
            ispass = false;
            $email.next().text('請輸入正確的 Email 格式');
        }
    if($password.val().length<6){
        ispass=false;
        $password.next().text("密碼長度太短");
    }
    if($password.val() !== $password_check.val()){
        ispass=false;
        $password_check.next().text("密碼確認欄位與密碼欄位不相同");
    }
        // if(! mobileRegex.test($mobile.val())){
        //     ispass = false;
        //     $mobile.next().text('請輸入正確的手機格式');
        // }
        // string strip_tags ( string $str ($textarea)) )
        if(ispass){
            $.post('register_api.php',$(document.forms[0]).serialize(),function(data){
                console.log(data);

                alert(data.info);
        if(data.success){
            // location.href = 'data_list.php';
            alertInfo.removeClass("alert-danger");
            alertInfo.addClass("alert-success");
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

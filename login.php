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

                    <h5 class="card-title">會員登入</h5>
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
                        
                        <button type="submit" class="btn btn-primary my-3" id="submitBtn">登入</button>
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
// var $nickname=$("#nickname");
var $email=$("#email");
var $password=$("#password");
// var $password_check=$("#password_check");
var file=[$email,$password];


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

    // if($nickname.val().length<2){
    //     ispass=false;
    //     $nickname.next().text("輸入長度太短");
    // }
    if(! validateEmail($email.val())) {
            ispass = false;
            $email.next().text('請輸入正確的 Email 格式');
        }
    if($password.val().length<6){
        ispass=false;
        $password.next().text("密碼長度太短");
    }
    // if($password.val() !== $password_check.val()){
    //     ispass=false;
    //     $password_check.next().text("密碼確認欄位與密碼欄位不相同");
    // }
        // if(! mobileRegex.test($mobile.val())){
        //     ispass = false;
        //     $mobile.next().text('請輸入正確的手機格式');
        // }
        // string strip_tags ( string $str ($textarea)) )
        if(ispass){
            $.post('login_api.php',$(document.forms[0]).serialize(),function(data){
                console.log(data);

                // alert(data.info);
        if(data.success){
            // location.href = 'data_list.php';
            alertInfo.removeClass("alert-danger");
            alertInfo.addClass("alert-success");
            setTimeout(function(){
                location.href="./";
            }, 1000);
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

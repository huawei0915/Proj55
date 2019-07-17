<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="./">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item <?= $page_name=='data_list' ? 'active' : ''  ?>">
                    <a class="nav-link" href="data_list.php">資料列表</a>
                </li>

                <li class="nav-item <?= $page_name=='data_insert' ? 'active' : ''  ?>">
                    <a class="nav-link" href="data_insert.php">新資料列</a>
                </li>
                <li class="nav-item <?= $page_name=='account' ? 'active' :  ''  ?>">
                    <a class="nav-link" href="account.php">會員資料</a>
                </li>
                <li class="nav-item <?= $page_name=='formtest' ? 'active' :  ''  ?>">
                    <a class="nav-link" href="formtest.php">form_test</a>
                </li>
            </ul>

            <?php if(isset($_SESSION['loginUser'])): ?>
          
            <ul class="navbar-nav">
            
               <li class="nav-item <?= $page_name=='data_insert' ? 'active' : ''  ?>">
                   <a class="nav-link" href="edit_my.php" id="my_nickname"> <?= $_SESSION['loginUser']['nickname']?>  </a>
               </li>
               <li class="nav-item <?= $page_name=='account' ? 'active' :  ''  ?>">
                   <a class="nav-link" href="logout.php">登出</a>
               </li>

           </ul>
            <?php else: ?>
            <ul class="navbar-nav">
               

                <li class="nav-item <?= $page_name=='data_insert' ? 'active' : ''  ?>">
                    <a class="nav-link" href="login.php">登入</a>
                </li>
                <li class="nav-item <?= $page_name=='account' ? 'active' :  ''  ?>">
                    <a class="nav-link" href="register.php">註冊</a>
                </li>

            </ul>
            <?php endif ?>
        </div>
    </div>
</nav>
<style>
.nav-item.active{
background-color:#ccc;

}
</style>
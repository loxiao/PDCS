<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
<div class="page">

    <div class="panel">
        <div class="panel_visible">
            <!--注册表单-->
            <div class="panel_content">
                <h1 class="panel_title"> 注册 </h1>
                <form class="form">
                    <label class="form_label" for="username">用户名</label>
                    <input class="form_input" type="text" id="username" name="username">
                    <label class="form_label" for="password">密码</label>
                    <input class="form_input " type="password" id="password" name="password">
                    <label class="form_label" for="email">邮箱</label>
                    <input class="form_input" type="text" id="email" name="email">
                    <div class="msg">${msg}</div>
                    <button class="form_btn" type="button" value="Submit">注册</button>
                    <button class="form_toggle js-formToggle" type="button">Or, 登录</button>
                </form>
            </div>
            <!--登录表单-->
            <div class="panel_content panel_content-overlay js-panel_content ">
                <h1 class="panel_title"> 登录 </h1>
                <form class="form">
                    <label class="form_label" for="emailIn">邮箱</label>
                    <input class="form_input" type="text" id="emailIn" name="email">
                    <label class="form_label" for="passwordIn">密码</label>
                    <input class="form_input " type="password" id="passwordIn" name="passwordIn">
                    <!-- 角色选择 -->
                    <div class="form_role-group">
                        <label class="form_label">身份</label>
                        <div class="form_role-option">
                            <input class="form_role-input" type="radio" id="participant" name="role" value="participant">
                            <label class="form_role-label" for="participant">参赛人员</label>
                        </div>
                        <div class="form_role-option">
                            <input class="form_role-input" type="radio" id="judge" name="role" value="judge">
                            <label class="form_role-label" for="judge">评委</label>
                        </div>
                        <div class="form_role-option">
                            <input class="form_role-input" type="radio" id="admin" name="role" value="admin">
                            <label class="form_role-label" for="admin">管理员</label>
                        </div>
                    </div>
                    <button class="form_btn" type="button" value="Submit">登录</button>
                    <br>
                    <div class="msg">${msg}</div>
                    <button class="form_toggle js-formToggle" type="button">Or, 注册</button>
                </form>
            </div>
        </div>
        <div class="panel_back js-imageAnimate">
            <img class="panel_img" src="1.jpg" style="width: 235px;height: 457px" />
        </div>
    </div>

</div>
<script src="js/main.js"></script>
</body>

</html>
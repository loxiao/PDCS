<%--
  Created by IntelliJ IDEA.
  User: 邓棉茵
  Date: 2024/7/11
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
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
                    <button class="form_btn" type="button" value="Submit">Submit</button>
                    <button class="form_toggle js-formToggle" type="button">Or, 登录</button>
                </form>
            </div>
            <!--登录表单-->
            <div class="panel_content panel_content-overlay js-panel_content ">
                <h1 class="panel_title"> 登录 </h1>
                <form class="form">
                    <label class="form_label" for="usernameIn">用户名</label>
                    <input class="form_input" type="text" id="usernameIn" name="usernameIn">
                    <label class="form_label" for="passwordIn">密码</label>
                    <input class="form_input " type="password" id="passwordIn" name="passwordIn">
                    <button class="form_btn" type="button" value="Submit">登录</button>
                    <br>
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
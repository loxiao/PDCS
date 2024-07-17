<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@include file="header.jsp"%>
<link rel="stylesheet" href="css/login.css">
<div class="page">
    <div class="panel">
        <div class="panel_visible">
            <!--登录表单-->
            <div class="panel_content">
                <h1 class="panel_title"> 登录 </h1>
                <form class="form" action="${ctx}/LoginServlet" method="post">
                    <label class="form_label" for="emailIn">邮箱</label>
                    <input class="form_input" type="text" id="emailIn" name="email">
                    <label class="form_label" for="passwordIn">密码</label>
                    <input class="form_input " type="password" id="passwordIn" name="passwordIn">
                    <!-- 角色选择 -->
                    <div class="form_role-group">
                        <label class="form_label">身份</label>
                        <div class="form_role-option">
                            <input class="form_role-input" type="radio" id="participant" name="role" value="participant" checked>
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
<%--                    <div>--%>
<%--                        <label>验证码:</label>--%>
<%--                        <input type="text" name="captcha" placeholder="请输入验证码" style="width: 130px;">--%>
<%--&lt;%&ndash;                        <input type="text" name="captcha" placeholder="请输入验证码">&ndash;%&gt;--%>
<%--                        <img src="CaptchaServlet" alt="验证码" id="captchaImage">--%>
<%--                        <a href="#" onclick="refreshCaptcha()">换一张</a>--%>
<%--                    </div>--%>
                    <input class="form_btn" type="submit" value="登录">
                    <br>
                    <div class="msg">${msg}</div>
                    <button class="form_toggle js-formToggle" type="button">Or, 注册</button>
                </form>
            </div>
            <!--注册表单-->
            <div class="panel_content hidden">
                <h1 class="panel_title"> 注册 </h1>
                <form class="form" action="${ctx}/RegServlet" method="post">
                    <label class="form_label" for="username">用户名</label>
                    <input class="form_input" type="text" id="username" name="username">
                    <label class="form_label" for="password">密码</label>
                    <input class="form_input " type="password" id="password" name="password">
                    <label class="form_label" for="email">邮箱</label>
                    <input class="form_input" type="text" id="email" name="email">
                    <label class="form_label" for="address">地址</label>
                    <input class="form_input" type="text" id="address" name="address">
                    <div class="msg">${msg}</div>
                    <input class="form_btn" type="submit" value="注册">
                    <button class="form_toggle js-formToggle" type="button">Or, 登录</button>
                </form>
            </div>
        </div>
        <div class="panel_back js-imageAnimate">
            <img class="panel_img" src="img/logo.jpg" style="width: 235px;height: 457px" />
        </div>
    </div>
</div>
<script src="js/main.js"></script>
<script>
    function refreshCaptcha() {
        document.getElementById('captchaImage').src = 'CaptchaServlet?' + new Date().getTime(); // 添加时间戳以避免缓存
    }
</script>
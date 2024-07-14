<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="css/bootstrap-4.6.1.min.css">
    <link rel="stylesheet" href="css/participant.css">
    <link rel="stylesheet" href="css/font-awesome-3.2.1.min.css">
    <!-- 引入 jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- 引入 jQuery Validate 插件 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation-unobtrusive@3.2.11/dist/jquery.validate.unobtrusive.min.js"></script>
</head>
<body>
<div id="header">
    <img src="${ctx}/img/logo.jpg" alt="Logo">
    <h5 class="my-0 mr-md-auto font-weight-normal">大学生海报设计竞赛系统-个人中心</h5>
    <div id="userInfo">
        <c:if test="${empty participant}">
            <a href="${ctx}/login.jsp">登录/注册</a>
        </c:if>
        <c:if test="${!empty participant}">
            <a href="">${participant.getParticipant_name()}</a>
            <a href="${ctx}/LogoutServlet">注销</a>
        </c:if>
        <a href="${ctx}/index.jsp">首页</a>
        <a href="">帮助</a>
    </div>

</div>
</body>
</html>
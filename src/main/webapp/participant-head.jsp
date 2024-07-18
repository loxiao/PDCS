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
    <script src="js/jquery-3.6.0.min.js"></script>
    <!-- 引入 jQuery Validate 插件 -->
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/jquery.validate.unobtrusive.min.js"></script>
</head>
<body>
<div id="header">
    <img src="${ctx}/img/logo.jpg" alt="Logo">
    <h5 class="my-0 mr-md-auto font-weight-normal">大学生海报设计竞赛系统-个人中心</h5>
    <div id="userInfo">
        <a href="${ctx}/index.jsp">首页</a>
        <c:if test="${!empty participant}">
            <span>${participant.getParticipant_name()}</span>
            <a href="${ctx}/LogoutServlet">退出</a>
        </c:if>
        <a href="#">帮助</a>
    </div>

</div>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>大学生海报设计竞赛系统</title>
    <link rel="stylesheet" href="css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <style>
        .title {
            font-family: Arial, sans-serif; /* 使用Arial字体 */
            font-size: 36px; /* 主标题字号 */
            font-weight: bold; /* 加粗 */
            color: white;/* 白色 */
            text-align: left; /* 靠左对齐 */
            margin-bottom: 20px; /* 底部留白 */
        }
    </style>
</head>
<body>
<header>
    <div class="logo">
        <img src="img/logo.jpg" width="100" height="100" class="mb-2">
    </div>
    <h1 class="title">大学生海报设计竞赛系统</h1>
    <ul class="nav-list flex">
        <li><a href="${ctx}/index.jsp">首页</a></li>
        <c:if test="${empty name}">
            <li><a href="${ctx}/login.jsp">登录/注册</a></li>
        </c:if>
        <c:if test="${!empty name}">
            <li><a href="">欢迎：<b>${name}</b></a></li>
            <li><a href="${ctx}/LogoutServlet">注销</a></li>
        </c:if>

        <li><a href="">消息 </a></li>
        <li><a href="">个人中心 </a></li>
        <li><a href="">学生作品 </a></li>
    </ul>
</header>
</body>
</html>

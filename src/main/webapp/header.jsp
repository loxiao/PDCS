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
            font-size: 40px; /* 主标题字号 */
            font-weight: bold; /* 加粗 */
            color: white;/* 白色 */
            text-align: left; /* 靠左对齐 */
        }
        .message{
            width: 7px;
            height: 7px;
            border-radius: 5px;
            background-color: #dc3545;
            position: relative;
            top: -25px;
            right: -45px;
        }
    </style>
</head>
<body>
<header>
    <div class="logo">
        <img src="img/logo.jpg" width="100" height="100" class="mb-2">
    </div>
    <h1 class="title">大 学 生 海 报 设 计 竞 赛 系 统</h1>
    <ul class="nav-list flex">
        <li><a href="${ctx}/IndexServlet">首页</a></li>
        <c:choose>
            <c:when test="${!empty participant}">
                <li><a href="">欢迎：<b>${participant.participant_name}</b></a></li>
                <li><a href="${ctx}/LogoutServlet">退出</a></li>
                <li><a href="${ctx}/ParticipantServlet">个人中心 </a></li>
                <li><a href="${ctx}/PmsgServlet">消息 </a>
                    <c:if test="${messages != null}"><p class="message"></p></c:if>
                    </li>
            </c:when>
            <c:when test="${!empty admin}">
                <li><a href="">欢迎：<b>${admin.adminName}</b></a></li>
                <li><a href="${ctx}/LogoutServlet">退出</a></li>
                <li><a href="${ctx}/AdminServlet">管理员中心</a></li>
            </c:when>
            <c:when test="${!empty judges}">
                <li><a href="">欢迎：<b>${judges.judgesName}</b></a></li>
                <li><a href="${ctx}/LogoutServlet">退出</a></li>
                <li><a href="${ctx}/JmsgServlet">消息 </a> <c:if test="${messages != null}"><p class="message"></p></c:if></li>
                <li><a href="${ctx}/message.jsp">
                    <c:if test="${messages != null}"><p class="message"></p></c:if>
                    </a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${ctx}/login.jsp">登录/注册</a></li>
            </c:otherwise>
        </c:choose>

        <li><a href="WorksServlet?id=0">学生作品 </a></li>
    </ul>
</header>
</body>
</html>
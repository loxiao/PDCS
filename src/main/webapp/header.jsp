<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>大学生海报设计竞赛系统</title>
    <link rel="stylesheet" href="css/main.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .title {
            font-family: Arial, sans-serif;
            font-size: 30px;
            font-weight: bold;
            color: white;
            margin: 0;
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
    <div class="flex" style="align-items: center;padding: 11px;">
        <img src="img/logo.jpg" width="60" height="60" class="logo">
        <p class="title">大 学 生 海 报 设 计 竞 赛 系 统</p>
    </div>
    <ul class="nav-list flex" style="margin: 0">
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
<canvas id="my_canvas"></canvas>
<!-- 引入粒子插件 -->
<script src="js/particle.min.js"></script>
<script>
    // 初始化粒子（画布id）
    particle.init('my_canvas');
</script>
</body>
</html>
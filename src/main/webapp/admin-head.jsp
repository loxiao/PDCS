<%--
  Created by IntelliJ IDEA.
  User: syrup
  Date: 2024/7/11
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="css/bootstrap-4.6.1.min.css">
<link rel="stylesheet" href="css/font-awesome-3.2.1.min.css">
<link rel="stylesheet" href="css/main.css">
<style>
    .message{
        width: 7px;
        height: 7px;
        border-radius: 5px;
        background-color: #dc3545;
        position: relative;
        top: -25px;
        right: -45px;
    }

    /* 设置导航链接字体颜色 */
    .nav-list a {
        color: #3f51b5 !important;
    }
</style>
<div class="d-flex flex-column flex-md-row align-items-center p-3px-mdmb-3 bg-white border-bottom shadow-sm">
    <img src="img/logo.jpg" width="64" height="64" class="mb-2">
    <h5 class="my-0 mr-md-auto font-weight-normal">大学生海报设计竞赛系统-后台管理</h5>

    <ul class="nav-list flex">
        <li><a href="${ctx}/IndexServlet">首页</a></li>
        <c:choose>
            <c:when test="${!empty admin}">
                <li><a href="">欢迎：<b>${admin.adminName}</b></a></li>
                <li><a href="${ctx}/LogoutServlet">退出</a></li>
                <li><a href="">消息 </a> <c:if test="${messages != null}"><p class="message"></p></c:if></li>
            </c:when>
            <c:otherwise>
                <li><a href="${ctx}/login.jsp">登录/注册</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
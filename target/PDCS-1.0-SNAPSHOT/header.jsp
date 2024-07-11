<%--
  Created by IntelliJ IDEA.
  User: syrup
  Date: 2024/7/10
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>大学生海报设计竞赛系统</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/login.css">
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
        <img src="image/logo.jpg" width="100" height="100">
    </div>
    <h1 class="title">大学生海报设计竞赛系统</h1>
    <ul class="nav-list flex">
        <li><a href="">首页</a></li>
        <li><a href="">登录/注册</a></li>
        <li><a href="">消息 </a></li>
        <li><a href="">个人中心 </a></li>
        <li><a href="">学生作品 </a></li>
    </ul>
</header>

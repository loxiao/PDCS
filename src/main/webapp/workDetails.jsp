<%@ page import="com.example.pdcs.domain.Works" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="css/workDetail.css">
<div class="WorkDetails">
    <div class="head">
        <h2>${work.getWorkName()}</h2>
        <a href="WorksServlet?id=0">返回</a>
    </div>
    <div class="detail">
        <h5>作品介绍</h5>
        <p>队伍名:<span>${teams.getTeamName()}</span></p>
        <p>队长:<span>${captainname}</span></p>
        <p>队员:<span>${membername}</span></p>
        <p>竞赛类型:<span>${competitions.getCompetitionTypeName()}</span></p>
        <p>获奖情况:<span>${work.getWorkName()}</span></p>
        <p>点赞数:<span>${work.getLikes()}</span></p>
        <p>评论:<span>${work.getComments()}</span></p>
        <p class="img">作品展示:<img src="postimg/${work.getImageURL()}"></p>
    </div>
</div>
<%@include file="footer.jsp"%>

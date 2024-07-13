<%@ page import="com.example.pdcs.domain.Works" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<div class="WorkDetails">
    <div class="head">
        <h2>${work.getWorkName()}</h2>
        <a href="WorksServlet">返回</a>
    </div>
    <div class="detail">
        <h5>作品介绍</h5>
        <p>队伍名:<span>${work.getTeamID()}</span></p>
        <p>队长:<span>${work.getTeamID()}</span></p>
        <p>队员:<span>${work.getTeamID()}</span></p>
        <p>竞赛类型:<span>${work.getCompetitionID()}</span></p>
        <p>获奖情况:<span>${work.getWorkID()}</span></p>
        <p>作品展示:<img src="${work.getImageURL()}"></p>
        <p>点赞数:<span>${work.getLikes()}</span></p>
        <p>评论:<span>${work.getComments()}</span></p>
    </div>
    <div class="score">
        <a>打分</a>
    </div>
</div>
<%@include file="footer.jsp"%>

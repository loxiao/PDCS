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
        <p>获奖情况:<span>${awards.getAwardName()}</span></p>
        <p>评论:<span>${work.getComments()}</span></p>
        <p class="img">作品展示:<img src="postimg/${work.getImageURL()}"></p>
        <div class="like-button-container">
            <button id="like-button" class="gray-heart" onclick="toggleLike()">❤</button>
            <span id="like-count">${work.getLikes()}</span>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        let clickCount = 0; // 初始化点击次数计数器
        let likeCount = parseInt(${work.getLikes()}); // 初始化点赞数
        function toggleLike() {
            clickCount += 1; // 点击次数加一
            if (clickCount % 2 === 0) {
                // 如果是偶数次点击
                likeCount -= 1; // 点赞数减一
            } else {
                // 如果是奇数次点击
                likeCount += 1; // 点赞数加一
            }
            document.getElementById('like-count').innerText = likeCount;
            // 切换爱心颜色
            var heart = document.getElementById('like-button');
            if (heart.classList.contains('gray-heart')) {
                heart.classList.remove('gray-heart');
                heart.classList.add('red-heart');
            } else {
                heart.classList.remove('red-heart');
                heart.classList.add('gray-heart');
            }
        }

        // 绑定点击事件到按钮
        document.getElementById('like-button').onclick = toggleLike;
    });
</script>
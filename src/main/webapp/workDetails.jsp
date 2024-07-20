<%@ page import="com.example.pdcs.domain.Works" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<!-- 引入 jQuery -->
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="css/workDetail.css">
<div class="w">
    <div class="WorkDetails">
        <div class="head">
            <h2>${work.getWorkName()}</h2>
            <a href="WorksServlet?id=0">返回</a>
        </div>
        <h5>作品介绍</h5>
        <div class="detail">
            <p>队伍名: <span>${teams.getTeamName()}</span></p>
            <p>队长: <span>${captainname}</span></p>
            <p>队员: <span>${membername}</span></p>
            <p>竞赛类型: <span>${competitions.getCompetitionTypeName()}</span></p>
            <p>获奖情况: <span>${awards.getAwardName()}</span></p>
            <p>评论: <span>${work.getComments()}</span></p>
            <img src="postimg/${work.getImageURL()}" class="img"height="300px" >
            <button type="button" id="like-button" class="gray-heart" onclick="toggleLike(${work.getWorkID()})">❤</button>
            <span id="like-count" name="likes">${work.getLikes()}</span>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</div>
<script>
    function toggleLike(workId) {
        var likeCount = parseInt(document.getElementById('like-count').innerText);
        var heart = document.getElementById('like-button');
        if (heart.classList.contains('gray-heart')) {
            heart.classList.remove('gray-heart');
            heart.classList.add('red-heart');
            likeCount += 1;
        } else {
            heart.classList.remove('red-heart');
            heart.classList.add('gray-heart');
            likeCount -= 1;
        }
        document.getElementById('like-count').innerText = likeCount;

        // 发送AJAX请求
        $.ajax({
            type: 'POST',
            url: 'UpdateLikesServlet', // 你的servlet URL
            data: { Likes: likeCount, Id: workId },
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            success: function(response) {
                // 假设服务器返回的是更新后的点赞数
                document.getElementById('like-count').innerText = response.likesCount;
            }
        });
    }
</script>
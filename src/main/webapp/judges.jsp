<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/judges.css">
<%@include file="header.jsp"%>
<form action="${ctx}/JudgesServlet" method="post">
    <div class="judges">
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
                <p>点赞数:<span>${work.getLikes()}</span></p>
                <p>评论:<span>${work.getComments()}</span></p>
                <p class="img">作品展示:<img src="postimg/${work.getImageURL()}"></p>
            </div>
        </div>
        <div class="score">
            <label class="score_label" for="score">请打分：</label>
            <input class="score_input" type="text" id="score" name="score">
            <input class="judges_btn" type="submit" value="确认">
        </div>
        <div class="comments">
            <label class="comments_label">请评论：</label>
            <textarea id="message" name="message">在这里输入你的留言...</textarea>
        </div>
    </div>
</form>
<%@include file="footer.jsp"%>
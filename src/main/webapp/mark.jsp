<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/mark.css">
<%@include file="header.jsp"%>
<form action="${ctx}/SuccessfullyMarkServlet" method="post">
    <div class="judges">
        <div class="WorkDetails">
            <div class="head">
                <h2>${work.getWorkName()}</h2>
                <a href="judges.jsp">返回</a>
            </div>
            <div class="detail">
                <h5>作品介绍</h5>
                <p>队伍名:<span>${work.getTeamID()}</span></p>
                <p>队长:<span>${work.getTeamID()}</span></p>
                <p>队员:<span>${work.getTeamID()}</span></p>
                <p>竞赛类型:<span>${work.getCompetitionID()}</span></p>
                <p>获奖情况:<span>${work.getWorkID()}</span></p>
                <p>点赞数:<span>${work.getLikes()}</span></p>
                <p class="img">作品展示:<img src="postimg/${work.getImageURL()}"></p>
            </div>
            <div class="score">
                <label class="score_label" for="score">请打分：</label>
                <input class="score_input" type="text" id="score" name="score">
            </div>
            <div class="comments">
                <div class="comments_container">
                    <label class="comments_label" for="message">请评论：</label>
                    <textarea id="message" name="message">在这里输入你的留言...</textarea>
                </div>
            </div>
            <input class="judges_btn" type="submit" value="确认">
        </div>
    </div>
</form>
<%@include file="footer.jsp"%>
<script>
    document.getElementById('message').addEventListener('focus', function() {
        if (this.value === '在这里输入你的留言...') {
            this.value = ''; // 清除提示文字
        }
    });

    document.getElementById('message').addEventListener('blur', function() {
        if (this.value === '') {
            this.value = '在这里输入你的留言...'; // 如果用户没有输入任何内容，重新显示提示文字
        }
    });
</script>
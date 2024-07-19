<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/mark.css">
<%@include file="header.jsp"%>
<form action="${ctx}/JudgesServlet" method="post" id="markForm">
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
            <p>点赞数:<span>${work.getLikes()}</span></p>
            <p class="img">作品展示:<img src="postimg/${work.getImageURL()}" ></p>
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

    document.getElementById('markForm').addEventListener('submit', function(event) {
        const score = document.getElementById('score').value.trim();
        const message = document.getElementById('message').value.trim();

        if (score === '' && (message === '' || message === '在这里输入你的留言...')) {
            alert('请填写分数和评论。');
            event.preventDefault(); // 阻止表单提交
        } else if (score === '') {
            alert('请打分。');
            event.preventDefault(); // 阻止表单提交
        } else if (message === '' || message === '在这里输入你的留言...') {
            alert('请评论。');
            event.preventDefault(); // 阻止表单提交
        }
    });

    document.getElementById('markForm').addEventListener('submit', function(event) {
        const score = document.getElementById('score').value.trim();
        if (score <= 0 || score > 100){
            alert('分数必须在0-100之间');
            event.preventDefault();
        }
        else if (!/^\d+$/.test(score)) {
            alert('分数必须是整数');
            event.preventDefault();
        }
    });
</script>

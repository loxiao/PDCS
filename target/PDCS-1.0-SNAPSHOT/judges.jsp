<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/judges.css">
<link rel="stylesheet" href="css/some.css">
<%@include file="header.jsp"%>
<form action="${ctx}/JudgesServlet" method="post">
    <div class="work">作品的展示</div><br>
    <div class="score">
        <label class="score_label" for="score">请打分：</label>
        <input class="score_input" type="text" id="score" name="score">
        <input class="judges_btn" type="submit" value="确认">
    </div>
    <div class="comments">
        <label class="comments_label">请评论：</label>
        <textarea id="message" name="message">
        在这里输入你的留言...
    </textarea>
    </div>
</form>
<%@include file="footer.jsp"%>
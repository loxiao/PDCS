<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<link rel="stylesheet" href="css/team.css">
<div class="container">
    <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
            <p class="mb-1">${asg}</p>
            <div class="tooltip"></div>
        </a>
        <c:forEach items="${newcompetitions}" var="competitions">
            <a href="${ctx}/NewsLIstServlet?id=${competitions.getCompetitionID()}" class="list-group-item list-group-item-action">
                <p class="mb-1">>${competitions.getCompetitionName()}开始报名</p>
                <div class="tooltip"></div>
            </a>
        </c:forEach>
    </div>

    <div class="card text-center">
        <div class="card-header">
            ${competitions.getCompetitionName()} / 创建队伍
        </div>
        <div class="card-body">
            <form action="${ctx}/JudgmentServlet" method="post" class="form-group"> <%-- 修改 action 和 method 属性 --%>
                <input type="hidden" name="id" value="${competitions.getCompetitionID()}"> <%-- 传递比赛 ID --%>
                <p>队长名字:</p>
                <input type="text" class="form-control" id="captainName" name="captainName" required>
                <p>队伍名字:</p>
                <input type="text" class="form-control" id="teamName" name="teamName" required>
                <input type="submit" class="btn btn-primary" value="创建团队">
            </form>
        </div>
        <div class="card-footer text-muted">
            <p class="mb-1">${msg}</p> <%-- 显示服务器返回的信息 --%>
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>
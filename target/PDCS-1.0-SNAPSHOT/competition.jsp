<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
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
            ${competitions.getCompetitionTypeName()} / 赛事通知
        </div>
        <div class="card-body">
            <h5 class="card-title">${competitions.getCompetitionName()}</h5>
            <p class="card-text">${competitions.getCompetitionDescription()}报名截止日期和作品提交截止日期：${competitions.getRegistrationDeadline()}</p>
            <a href="${ctx}/JudgmentServlet?id=${competitions.getCompetitionID()}" class="btn btn-primary">创建团队报名</a>
            <a href="#" class="btn btn-primary">加入团队报名</a>
        </div>
        <div class="card-footer text-muted">
            <p class="mb-1">${msg}</p>
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<link rel="stylesheet" href="css/createTeam.css">
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
            <form action="" method="" class="form-group">
                <p>队长名字:</p>
                <input type="text" class="form-control" id="teamName" name="teamName" required class="form-control">
                <p>队伍名字:</p>
                <input type="text" class="form-control" id="captainName" name="captainName" class="form-control">
                <input type="submit" class="btn btn-primary" value="创建团队"></input>
            </form>
        </div>
        <div class="card-footer text-muted">
            <p class="mb-1">${msg}</p>
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>


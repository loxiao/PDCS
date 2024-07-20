<%@ page import="com.example.pdcs.dao.ParticipantDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<link rel="stylesheet" href="css/team.css">
<div class="w">
    <div class="container">
        <div class="list-group">
            <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
                <p class="mb-1">热门赛事</p>
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
                ${competitions.getCompetitionName()} / 加入队伍
            </div>
            <div class="card-body">
                <div class="card-body">
                    <table class="table panel-body">
                        <thead>
                        <tr>
                            <th>队长名称</th>
                            <th>团队名称</th>
                            <th>团队id</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${teamsList}" var="teams">
                            <tr>
                                <th> ${teams.getCaptainID()}</th>
                                <th>${teams.getTeamName()}</th>
                                <th>${teams.getTeamID()}</th>
                                <th><a href="${ctx}/JointoServlet?id=${teams.getTeamID()}">加入团队</a> </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer text-muted">
                <p class="mb-1">${msg}</p>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp"%>
</div>



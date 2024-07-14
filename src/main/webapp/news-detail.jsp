<%--
  Created by IntelliJ IDEA.
  User: syrup
  Date: 2024/7/12
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    ul{
        padding: 10px;
    }
    .card li{
        padding:7px;
        border-bottom:1px dashed #b9bbbe;
    }
    .card li a{
        width: 90%;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .time {
        width: 135px;
        white-space: nowrap;
        overflow: hidden;
    }
</style>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<div class="container">
    <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
            <p class="mb-1">最近新闻</p>
            <div class="tooltip"></div>
        </a>
        <c:forEach items="${oldcompetitions}" var="competitions">
            <a href="${ctx}/AwardServlet?id=${competitions.getCompetitionID()}" class="list-group-item list-group-item-action">
                <p class="mb-1">${competitions.getCompetitionName()}+颁奖结构</p>
                <div class="tooltip"></div>
            </a>
        </c:forEach>
    </div>

    <%--新闻列表--%>
    <c:if test="${tsg == 'more'}">
        <div class="card ">
            <div class="card-header" style="padding: 20px;">
                竞赛新闻
            </div>
            <div class="card-body">
                <ul>
                    <c:forEach items="${newcompetitionAll}" var="competitions">
                        <li>
                            <a href="#" class="list-group-item list-group-item-action">
                                <p class="mb-1">${competitions.getCompetitionName()}</p>
                                <div class="time">${competitions.getCompetitionDate()}</div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </c:if>
    <%--新闻--%>
    <c:if test="${tsg == 'one'}">
        <div class="card ">
            <div class="card-header">
                竞赛新闻
            </div>
            <div class="card-body">
                <h3 class="card-title text-center">${competitions.getCompetitionName()}获奖名单</h3>
                <h6 class="card-time text-center">赛事时间  ${competitions.getCompetitionDate()}</h6>
                <p class="card-text">
                        ${competitions.getCompetitionName()}于${competitions.getCompetitionDate()}成功落下帷幕。
                </p>
                <p>获奖名单如下：</p>
                <ul>
                    <c:if test="${!empty first}">
                        <li>一等奖: ${first}</li>
                    </c:if>
                    <c:if test="${!empty second}">
                        <li>一等奖: ${second}</li>
                    </c:if>
                    <c:if test="${!empty third}">
                        <li>一等奖: ${third}</li>
                    </c:if>
                </ul>
            </div>
            <div class="card-footer text-muted">
                2 days ago
            </div>
        </div>
    </c:if>
</div>
<%@ include file="footer.jsp"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="css/work.css">
<div class="Works">
        <div class="MatchBaseList">
            <div class="MatchTitle">
                <h3><span>竞赛列表</span></h3>
                <ul style="padding-left: 10px; padding-right: 10px;">
                    <li>
                        <c:forEach items="${oldcompetitions}" var="competitions">
                            <a href="#" class="competitions">
                                <p class="mb-1">${competitions.getCompetitionName()}</p>
                            </a>
                        </c:forEach>
                    </li>
                </ul>
            </div>
        </div>
        <div class="WorksList">
            <div class="HeadTitle">
                <h3><span>大学生海报设计竞赛</span></h3>
            </div>
            <table>
                <thead>
                <tr>
                    <th>作品名称</th>
                    <th>队名</th>
                    <th>类型</th>
                    <th>奖状</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${worksList}" var="work">
                    <tr>
                        <td><a href="WorkDetailsServlet?workId=${work.getWorkID()}">${work.getWorkName()}</a></td>
                        <td>${work.getTeamID()}</td>
                        <td>${work.getCompetitionID()}</td>
                        <td>${work.getWorkID()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
</div>
<%@include file="footer.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="css/work.css">
<div class="w">
    <div class="Works">
        <div class="MatchBaseList">
            <div class="MatchTitle">
                <h3><span>竞赛列表</span></h3>
                <ul style="padding-left: 0px; padding-right: 10px;">
                    <li>
                        <c:forEach items="${oldcompetitions}" var="competitions">
                            <a href="${ctx}/WorksServlet?id=${competitions.getCompetitionID()}" class="competitions">
                                <p class="mb-1 ellipsis">${competitions.getCompetitionName()}</p>
                            </a>
                        </c:forEach>
                    </li>
                </ul>
            </div>
        </div>
        <div class="WorksList">
            <div class="HeadTitle">
                <c:if test="${empty cname}">
                    <h3><span>大学生海报设计竞赛</span></h3>
                </c:if>
                <c:if test="${!empty cname}">
                    <h3><span>${cname}</span></h3>
                </c:if>
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
                <c:forEach var="combine" items="${combinedList}">
                    <tr>
                        <td><a href="WorkDetailsServlet?workId=${combine[4]}">${combine[0]}</a></td>
                        <td>${combine[1]}</td>
                        <td>${combine[2]}</td>
                        <td>${combine[3]}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</div>

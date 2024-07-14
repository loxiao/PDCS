<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/judges.css">
<%@include file="header.jsp"%>
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
            <th>分数</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${worksList}" var="work">
            <tr>
                <td><a href="MarkServlet?workId=${work.getWorkID()}">${work.getWorkName()}</a></td>
                <td>${work.getTeamID()}</td>
                <td>${work.getCompetitionID()}</td>
                <td>${work.getWorkID()}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="footer.jsp"%>
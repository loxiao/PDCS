<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/judges.css">
<%@include file="header.jsp"%>
<div class="w">
    <div class="container">
        <div class="HeadTitle">
        <h3><span>${JudgeCompetitionName}</span></h3>
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
        <c:forEach items="${JudgeWorkList}" var="work">
            <tr>
                <td><a href="MarkServlet?workId=${work[4]}">${work[0]}</a></td>
                <td>${work[1]}</td>
                <td>${work[2]}</td>
                <td>${work[3]}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
    <%@ include file="footer.jsp"%>
</div>
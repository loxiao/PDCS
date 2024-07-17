<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="css/work.css">
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
                <th>分数</th>
                <th>设置奖状</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="combine" items="${combinedList}">
                <tr>
                    <td><a href="WorkDetailsServlet?workId=${combine[4]}">${combine[0]}</a></td>
                    <td></td>
                    <td class="upload"><form action="" method="post">
                        <input type="hidden" name="id" value="${CompetitionID}">
                        <input type="file" id="file" name="file" class="upload-file">
                        <input type="button" id="uploadBtn" class="upload-btn" value="上传">
                    </form></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@include file="footer.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<style>
    .Works {
        position: absolute;
        left: 50%;
        top: 75%;
        transform: translate(-50%, -50%);
    }
</style>
<link rel="stylesheet" href="css/work.css">
<canvas id="my_canvas"></canvas>
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
<!-- 引入粒子插件 -->
<script src="js/particle.min.js"></script>
<script>
    // 初始化粒子（画布id）
    particle.init('my_canvas');
</script>
<%@include file="footer.jsp"%>
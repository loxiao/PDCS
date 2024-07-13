<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@include file="header.jsp"%>

<div class="container mt-5">
    <h2 class="text-center mb-4">个人中心</h2>

    <div class="row">
        <!-- 个人信息卡片 -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h5 class="card-title mb-0">个人信息</h5>
                </div>
                <div class="card-body">
                    <p><strong>用户名：</strong> ${participant.participant_name}</p>
                    <p><strong>邮箱：</strong> ${participant.participant_number}</p>
                    <p><strong>地址：</strong> ${participant.participant_address}</p>
                    <p><strong>参赛次数：</strong> ${participant.enter}</p>
                    <a href="${ctx}/editProfile.jsp" class="btn btn-primary btn-block mt-3">编辑信息</a>
                </div>
            </div>
        </div>

        <!-- 作品列表卡片 -->
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-secondary text-white">
                    <h5 class="card-title mb-0">我的作品</h5>
                </div>
                <div class="card-body">
                    <c:if test="${empty works}">
                        <p class="text-center">您还没有上传作品。</p>
                    </c:if>
                    <c:if test="${!empty works}">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>作品名称</th>
                                <th>参赛比赛</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="work" items="${works}">
                                <tr>
                                    <td>${work.WorkName}</td>
                                    <td>${work.CompetitionName}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${work.Score >= 90}">优秀</c:when>
                                            <c:when test="${work.Score >= 80}">良好</c:when>
                                            <c:when test="${work.Score >= 70}">中等</c:when>
                                            <c:when test="${work.Score >= 60}">及格</c:when>
                                            <c:otherwise>不及格</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="${ctx}/WorkDetailServlet?workId=${work.WorkID}" class="btn btn-sm btn-primary">查看</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
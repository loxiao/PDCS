<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="participant-head.jsp"%>
<div class="container-fluid">
    <div class="row">
        <%@ include file="participant-sider.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main1">
            <div>
                <div id="tabdata">
                    <h3>我的队伍</h3>
                    <hr>
                    <c:if test="${!empty myTeams}">
                        <table class="table table-striped table-bordered ">
                            <tbody>
                            <tr>
                                <th class="text-center">竞赛类别</th>
                                <th class="text-center">竞赛名称</th>
                                <th class="text-center">团队名称</th>
                                <th class="text-center">队员</th>
                                <th class="text-center">团队管理</th>
                            </tr>
                            <c:forEach items="${myTeams}" var="team">
                                <tr>
                                    <td class="text-center"></td>
                                    <td class="text-center"></td>
                                    <td class="text-center">${team.getTeamName()}</td>
                                    <td class="text-center"></td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-default btn-apply"><a href="">移除</a></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty myTeams}">
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            您还没有创建任何队伍
                        </div>
                    </c:if>
                    <h3>我加入的队伍</h3>
                    <hr>
                    <c:if test="${!empty joinedTeams}">
                        <table class="table table-striped table-bordered ">
                            <tbody>
                            <tr>
                                <th class="text-center">竞赛类别</th>
                                <th class="text-center">竞赛名称</th>
                                <th class="text-center">团队名称</th>
                                <th class="text-center">操作</th>
                            </tr>
                            <c:forEach items="${joinedTeams}" var="team">
                                <tr>
                                    <td class="text-center"></td>
                                    <td class="text-center"></td>
                                    <td class="text-center">${team.getTeamName()}</td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-default btn-apply"><a href="">退出</a></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty joinedTeams}">
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            您还没有加入任何队伍
                        </div>
                    </c:if>
                </div>
                <%@ include file="footer.jsp"%>
            </div>
        </div>
    </div>
</div>
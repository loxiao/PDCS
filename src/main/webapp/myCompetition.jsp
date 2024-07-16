<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="participant-head.jsp"%>
<div class="container-fluid">
    <div class="row">
        <%@ include file="participant-sider.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main1">
            <h3 class="left">我的队伍</h3>
            <p class="clearfix"></p>
            <hr style="margin-top: 10px">
            <c:if test="${!empty teams}">
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th class="text-center">竞赛名称</th>
                        <th class="text-center">竞赛类别</th>
                        <th class="text-center">队伍名称</th>
                        <th class="text-center">队长姓名</th>
                        <th class="text-center">队员姓名</th>
                        <th class="text-center">作品</th>
                        <th class="text-center">获奖等级</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="team" items="${teams}">
                        <tr>
                            <td class="text-center">${team.competitionName}</td>
                            <td class="text-center">${team.competitionType}</td>
                            <td class="text-center">${team.teamName}</td>
                            <td class="text-center">${team.captainName}</td>
                            <td class="text-center">${team.memberName}</td>
                            <td class="text-center">
                                <a href="${team.workUrl}" class="btn btn-default">下载</a>
                            </td>
                            <td class="text-center">${team.awardLevel}</td>
                            <td class="text-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-sm" data-toggle="dropdown">操作</button>
                                    <button type="button" class="btn btn-default dropdown-toggle btn-sm" data-toggle="dropdown">
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="${team.editUrl}">修改报名</a></li>
                                        <li><a href="${team.submitUrl}">提交作品</a></li>
                                        <li><a href="${teamawardUrl}">上传奖状</a></li>
                                        <li><a href="${team.deleteUrl}">删除报名</a></li>
                                        <li><a href="${team.orderIdUrl}">修改排名</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>
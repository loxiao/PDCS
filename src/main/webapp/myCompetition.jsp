<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="participant-head.jsp"%>
<div class="container-fluid">
    <div class="row">
        <%@include file="participant-sider.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main1">
            <div>
                <div id="tabdata">
                    <h3>我的队伍</h3>
                    <hr>
                    <table class="table table-striped table-bordered ">
                        <tbody>
                        <tr>
                            <th class="text-center">竞赛类别</th>
                            <th class="text-center">竞赛名称</th>
                            <th class="text-center">团队名称</th>
                            <th class="text-center">队员</th>
                            <th class="text-center">团队管理</th>
                        </tr>
                        <%--                        <c:forEach items="${}" var="">--%>
                        <c:forEach var="list" items="${nameandidlist}">
                            <tr>
                                <td class="text-center">${list[0]}</td>
                                <td class="text-center">${list[1]}</td>
                                <td class="text-center apply-date">${list[2]}</td>
                                <td class="text-center match-date">${list[3]}</td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-default btn-apply"><a href="${ctx}/RemoveMemberServlet?action=showDetails&tid=${list[4]}&pid=${list[5]}">移除</a></button>
                                </td>
                            </tr>
                        </c:forEach>
                        <%--                        </c:forEach>--%>
                        </tbody>
                    </table>
                    <h3>我加入的队伍</h3>
                    <hr>
                    <table class="table table-striped table-bordered ">
                        <tbody>
                        <tr>
                            <th class="text-center">竞赛类别</th>
                            <th class="text-center">竞赛名称</th>
                            <th class="text-center">团队名称</th>
                            <th class="text-center">操作</th>
                        </tr>
                        <%--                        <c:forEach items="${}" var="">--%>
                        <c:forEach items="${memberList}" var="member">
                            <tr>
                                <td class="text-center">${member[0]}</td>
                                <td class="text-center">${member[1]}</td>
                                <td class="text-center apply-date">${member[2]}</td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-default btn-apply"><a href="${ctx}/RemoveServlet?tid=${member[3]}">退出</a></button>
                                </td>
                            </tr>
                        </c:forEach>
                        <%--                        </c:forEach>--%>
                        </tbody>
                    </table>
                </div>
                <%@ include file="footer.jsp"%>
            </div>
        </div>
    </div>
</div>
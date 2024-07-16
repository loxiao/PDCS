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
                            <tr>
                                <td class="text-center">公益类</td>
                                <td class="text-center">2024年第11届国防科技创新海报大赛</td>
                                <td class="text-center apply-date">编程挑战者</td>
                                <td class="text-center match-date">刘德华</td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-default btn-apply"><a href="${ctx}/">移除</a></button>
                                </td>
                            </tr>
                        <tr>
                            <td class="text-center">公益类</td>
                            <td class="text-center">2024年第11届国防科技创新海报大赛</td>
                            <td class="text-center apply-date">编程挑战者</td>
                            <td class="text-center match-date">hlj</td>
                            <td class="text-center">
                                <button type="button" class="btn btn-default btn-apply"><a href="${ctx}/">移除</a></button>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center">公益类</td>
                            <td class="text-center">2024年第11届国防科技创新海报大赛</td>
                            <td class="text-center apply-date">编程挑战者</td>
                            <td class="text-center match-date">Lili</td>
                            <td class="text-center">
                                <button type="button" class="btn btn-default btn-apply"><a href="${ctx}/">移除</a></button>
                            </td>
                        </tr>
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
                        <tr>
                            <td class="text-center">公益类</td>
                            <td class="text-center">2024年第14届关爱留守儿童公益广告海报大赛</td>
                            <td class="text-center apply-date">编程挑战者</td>
                            <td class="text-center">
                                <button type="button" class="btn btn-default btn-apply"><a href="${ctx}/">退出</a></button>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center">国防类</td>
                            <td class="text-center">2024年第6届军事历史知识海报竞赛</td>
                            <td class="text-center apply-date">国防创新者</td>
                            <td class="text-center">
                                <button type="button" class="btn btn-default btn-apply"><a href="${ctx}/">移除</a></button>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-center">商业类</td>
                            <td class="text-center">2024年第1届绿色地球环保海报设计海报大赛</td>
                            <td class="text-center apply-date">艺术春天</td>
                            <td class="text-center">
                                <button type="button" class="btn btn-default btn-apply"><a href="${ctx}/">移除</a></button>
                            </td>
                        </tr>
                        <%--                        </c:forEach>--%>
                        </tbody>
                    </table>
                </div>
                <%@ include file="footer.jsp"%>
            </div>

        </div>

    </div>
</div>
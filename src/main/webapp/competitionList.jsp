<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="participant-head.jsp"%>
<div class="container-fluid">
    <div class="row">
        <%@include file="participant-sider.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main1">
            <h3>所有竞赛</h3>
            <hr>
            <div class="row">
                <div class="col-lg-4">
                    <div class="input-group" style="margin-bottom: 10px">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">选择竞赛类别<span class="caret"></span></button>
                            <ul class="dropdown-menu" role="menu">
                                <c:forEach items="${Types}" var="Type">
                                    <li>
                                        <a href="${ctx}/AllCompetitionListServlet?TypeId=${Type.getCompetitionTypeID()}">${Type.getTypeName()}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <form class="form-inline my-2 my-lg-0" action="${ctx}/SearchServlet" method="post">
                            <input name="Search" type="text" id="Search" class="form-control" placeholder="输入竞赛关键字">
                            <button class="btn btn-outline-primary my-2 my-sm-0 " type="submit">查询</button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4">
                </div>
            </div>
            <div>
                <div id="tabdata">
                    <table class="table table-striped table-bordered ">
                        <tbody>
                        <tr>
                            <th class="text-center">类别</th>
                            <th class="text-center">名称</th>
                            <th class="text-center">竞赛日期</th>
                            <th class="text-center">报名日期</th>
                            <th class="text-center">队伍人数限制</th>
                            <th class="text-center">操作</th>
                        </tr>
                        <c:forEach items="${competitionsList}" var="competitions" varStatus="status">
                            <tr>
                                <td class="text-center">${competitions.getCompetitionTypeName()}</td>
                                <td class="text-center">${competitions.getCompetitionName()}</td>
                                <td class="text-center match-date">${competitions.getCompetitionDate()}</td>
                                <td class="text-center apply-date">${competitions.getRegistrationDeadline()}</td>
                                <td class="text-center">${competitions.getMaxParticipants()}</td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-default btn-apply"><a href="${ctx}/NewsLIstServlet?id=${competitions.getCompetitionID()}">详情</a></button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <%@ include file="footer.jsp"%>
            </div>
        </div>

    </div>
</div>
<script>
    $(document).ready(function() {
        // 绑定点击事件到下拉菜单的按钮
        $('.dropdown-toggle').on('click', function() {
            // 显示下拉菜单
            $('.dropdown-menu').toggle();
        });

        // 绑定点击事件到下拉菜单的每个链接
        $('.dropdown-menu a.dropdown-item').on('click', function() {
            // 获取选中项的文本
            var selectedText = $(this).text();
            // 显示选中项的文本，例如在控制台中
            console.log('Selected: ' + selectedText);
            // 或者可以将文本显示在页面的某个元素中
            // $('#someElementId').text(selectedText);
            // 关闭下拉菜单
            $('.dropdown-toggle').dropdown('toggle');
        });
    });

</script>
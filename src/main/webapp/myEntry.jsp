<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="participant-head.jsp"%>
<div class="container-fluid">
    <div class="row">
        <%@include file="participant-sider.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main1">
            <h3>最新竞赛</h3>
            <hr>
            <div class="row">
                <div class="col-lg-4">
                    <div class="input-group" style="margin-bottom: 10px">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">选择竞赛类别<span class="caret"></span></button>
                            <ul class="dropdown-menu" role="menu">

                            </ul>
                        </div>
                        <!-- /btn-group -->
                        <input name="ctl00$ContentPlaceHolder1$tbMatchBase" type="text" id="ctl00_ContentPlaceHolder1_tbMatchBase" class="form-control">
                        <input name="ctl00$ContentPlaceHolder1$hdnMatchBase" type="hidden" id="ctl00_ContentPlaceHolder1_hdnMatchBase" class="form-control">
                    </div>
                    <!-- /input-group -->
                </div>
                <!-- /.col-lg-4 -->
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
                                <td class="text-center"><a href="workDetails.jsp?Id=${competitions.getCompetitionID()}" target="_blank">${competitions.getCompetitionName()}</a></td>
                                <td class="text-center match-date">${competitions.getCompetitionDate()}</td>
                                <td class="text-center apply-date">${competitions.getRegistrationDeadline()}</td>
                                <td class="text-center">${competitions.getMaxParticipants()}</td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-default">详情</button>
                                    <button type="button" class="btn btn-default btn-apply">报名</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="paged">
                        <nav>
                            <ul class="pagination text-center">
                                <c:forEach begin="1" end="5" var="page">
                                    <c:if test="${page == currentPage}">
                                        <li class="active"><a href="javascript:void(0);">${page}</a></li>
                                    </c:if>
                                    <c:if test="${page != currentPage}">
                                        <li><a href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$myPager','${page}')">${page}</a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="participant-head.jsp"%>
<div class="container-fluid">
    <div class="row">
        <%@ include file="participant-sider.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main1">
            <div>
                <div id="tabdata">
                    <h3>我的奖状</h3>
                    <hr>
                    <c:if test="${!empty awards}">
                        <table class="table table-striped table-bordered ">
                            <tbody>
                            <tr>
                                <th class="text-center">竞赛类别</th>
                                <th class="text-center">竞赛名称</th>
                                <th class="text-center">团队名称</th>
                                <th class="text-center">团队奖项</th>
                            </tr>
                            <c:forEach items="${awards}" var="award">
                                <tr>
                                    <td class="text-center">${award[1]}</td>
                                    <td class="text-center">${award[0]}</td>
                                    <td class="text-center">${award[3]}</td>
                                    <td class="text-center">${award[2]}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty awards}">
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            您还没有获得任何奖项
                        </div>
                    </c:if>
                </div>
                <%@ include file="footer.jsp"%>
            </div>
        </div>
    </div>
</div>
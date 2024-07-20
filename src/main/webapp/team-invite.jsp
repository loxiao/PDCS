<%--
  Created by IntelliJ IDEA.
  User: syrup
  Date: 2024/7/15
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<link rel="stylesheet" href="css/message.css">
<div class="w" >
    <div class="container" >
        <div class="card" style="box-shadow: 0 0 5px #e0ded7;">
            <div class="card-header" style="padding: 20px;">
                您创建的队伍(未满员)
            </div>
            <div class="card-body">
                <ul class="message-list">
                    <c:forEach items="${emptyTeams}" var="teams">
                        <li class="message-item">
                            <form action="MessageServlet" method="post">
                                <input type="hidden" name="teamID" value="${teams.getTeamID()}">
                                <input type="hidden" name="teamName" value="${teams.getTeamName()}">
                                <p class="message-haeder">队伍名 —— <span>${teams.getTeamName()}</span></p>
                                <div class="flex justify-content-around"  style="width: 50%">
                                    <input type="text" name="member" class="form-control" placeholder="请输入参赛者的账号" style="width: 60%">
                                    <input type="submit" class="btn btn-primary" value="邀请">
                                </div>
                            </form>
                        </li>
                    </c:forEach>


                </ul>
                <div class="msg">${jsg}</div>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp"%>
</div>

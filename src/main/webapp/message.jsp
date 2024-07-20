<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<link rel="stylesheet" href="css/message.css">
<div class="w">
    <div class="container">
        <div class="card" style="box-shadow: 0 0 5px #e0ded7;">
            <div class="card-header" style="padding: 20px;">
                消息中心
            </div>
            <div class="card-body">
                <ul class="message-list">

                    <c:if test="${!empty participant}">
                        <c:forEach items="${participant_messagesList}" var="participant_messages">
                            <c:if test="${participant_messages.getJudgment()==1}">
                                <li class="message-item">
                                    <div>
                                        <p class="message-haeder">邀请消息 <span class="no-read">重要</span> </p>
                                        <div class="flex justify-content-around">
                                            <p class="message-content"><span>${participant_messages.getParticipant_name()}</span>负责人邀请您成为${participant_messages.getTeam_name()}的竞赛成员<span>(队伍id${participant_messages.getTeam_id()})</span></p>
                                            <div class="justify-content-between">
                                                <a href="${ctx}/GetinServlet?mid=${participant_messages.getMessage_id()}" class="btn btn-primary">同意</a>
                                                <a href="${ctx}/RejectServlet?mid=${participant_messages.getMessage_id()}" class="btn btn-primary">拒绝</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${participant_messages.getJudgment()==0}">
                                <li class="message-item">
                                    <div>
                                        <p class="message-haeder">申请消息 <span class="no-read">重要</span> </p>
                                        <div class="flex justify-content-around">
                                            <p class="message-content"><span>${participant_messages.getParticipant_name()}</span>申请加入你<span>${participant_messages.getTeam_name()}</span>的团队成员<span>(队伍id${participant_messages.getTeam_id()})</span></p>
                                            <div class="justify-content-between">
                                                <a href="${ctx}/GoinServlet?mid=${participant_messages.getMessage_id()}" class="btn btn-primary">同意</a>
                                                <a href="${ctx}/RejectServlet?mid=${participant_messages.getMessage_id()}" class="btn btn-primary">拒绝</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${!empty judges}">
                        <c:forEach var="judge_message" items="${judge_messageList}">
                            <li class="message-item">
                                <div>
                                    <p class="message-haeder">邀请消息 <span class="no-read">重要</span> </p>
                                    <div class="flex justify-content-around">
                                        <p class="message-content">${judge_message.getCompetitionName()}需要您的评分</p>
                                        <div class="justify-content-between">
                                            <a href="${ctx}/JudgesServlet?id=${judge_message.getCompetitionID()}" class="btn btn-primary">去评分</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
                <c:if test="${messages == null}"><div class="msg">暂无消息</div></c:if>
                <div class="msg">${msg}</div>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp"%>
</div>
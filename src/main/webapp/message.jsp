<%--
  Created by IntelliJ IDEA.
  User: syrup
  Date: 2024/7/13
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<link rel="stylesheet" href="css/message.css">
<div class="container" >
    <div class="card" style="box-shadow: 0 0 5px #e0ded7;">
        <div class="card-header" style="padding: 20px;">
            消息中心
        </div>
        <div class="card-body">
            <ul class="message-list">
                <li class="message-item">
                    <div>
                        <p class="message-haeder">邀请消息 <span class="no-read">重要</span> </p>
                        <p class="message-content"><span>xxx队</span>负责人邀请您成为该竞赛的团队成员<span>(已接受邀请)</span></p>
                        <p class="time">系统 - 2023-04-01 12:00:00</p>
                        <div class="flex justify-content-around">
                            <a href="#" class="btn btn-primary">同意</a>
                            <a href="#" class="btn btn-primary">拒绝</a>
                        </div>
                    </div>
                </li>
                <li class="message-item">
                    <div>
                        <p class="message-haeder">申请消息 <span class="no-read">重要</span> </p>
                        <p class="message-content"><span>xxx</span>申请加入你<span>xxx队</span>的团队成员<span>(已接受)</span></p>
                        <p class="time">系统 - 2023-04-01 12:00:00</p>
                        <div class="flex justify-content-around">
                            <a href="#" class="btn btn-primary">同意</a>
                            <a href="#" class="btn btn-primary">拒绝</a>
                        </div>
                    </div>
                </li>
                <li class="message-item">
                    <div>
                        <p class="message-haeder">邀请消息 <span class="no-read">重要</span> </p>
                        <p class="message-content">有赛事作品需要您的评分<span>(已评分)</span></p>
                        <p class="time">系统 - 2023-04-01 12:00:00</p>
                        <a href="#" class="btn btn-primary">去评分</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>
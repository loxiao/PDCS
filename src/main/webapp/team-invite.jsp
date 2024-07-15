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
<div class="container" >
    <div class="card" style="box-shadow: 0 0 5px #e0ded7;">
        <div class="card-header" style="padding: 20px;">
            您创建的队伍
        </div>
        <div class="card-body">
            <ul class="message-list">
                <li class="message-item">
                    <p class="message-haeder"><span>xxx队</span></p>
                    <div class="flex justify-content-around"  style="width: 50%">
                        <input type="text"  class="form-control" placeholder="请输入参赛者的账号" style="width: 60%">
                        <a href="#" class="btn btn-primary">邀请</a>
                    </div>
                </li>
                <li class="message-item">
                    <p class="message-haeder"><span>xxx队</span></p>
                    <div class="flex justify-content-around"  style="width: 50%">
                        <input type="text"  class="form-control" placeholder="请输入参赛者的账号" style="width: 60%">
                        <a href="#" class="btn btn-primary">邀请</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>

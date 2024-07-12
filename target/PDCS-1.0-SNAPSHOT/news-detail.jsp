<%--
  Created by IntelliJ IDEA.
  User: syrup
  Date: 2024/7/12
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<div class="container">
    <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
            <p class="mb-1">最近新闻</p>
            <div class="tooltip"></div>
        </a>
        <a href="#" class="list-group-item list-group-item-action">
            <p class="mb-1">赛事1</p>
            <div class="tooltip"></div>
        </a>
        <a href="#" class="list-group-item list-group-item-action">
            <p class="mb-1">赛事2</p>
            <div class="tooltip"></div>
        </a>
    </div>

    <div class="card ">
        <div class="card-header">
            竞赛新闻
        </div>
        <div class="card-body">
            <h3 class="card-title text-center">xxxx年XXX赛获奖名单</h3>
            <h6 class="card-time text-center">赛事名称  2024-07-11</h6>
            <p class="card-text">
                绍兴文理学院大学生海报设计竞赛于2024年7月8日晚成功落下帷幕，x队荣获一等奖，xx队荣获二等奖，xx队荣获三等奖。
            </p>
            <p>获奖名单如下：</p>
            <ul>
                <li>一等奖: </li>
                <li>二等奖: </li>
                <li>三等奖: </li>
            </ul>
        </div>
        <div class="card-footer text-muted">
            2 days ago
        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>

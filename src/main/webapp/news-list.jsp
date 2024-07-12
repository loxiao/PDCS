<%--
  Created by IntelliJ IDEA.
  User: syrup
  Date: 2024/7/12
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<style>
    ul{
        padding: 10px;
    }
    .card li{
        padding:7px;
        border-bottom:1px dashed #b9bbbe;
    }
    .card li a{
        width: 90%;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .time {
        width: 135px;
    }
</style>
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
        <div class="card-header" style="padding: 20px;">
            竞赛新闻
        </div>
        <div class="card-body">
            <ul>
                <li>
                    <a href="#" class="list-group-item list-group-item-action">
                        <p class="mb-1">赛事1</p>
                        <div class="time">xxxx年xx月xx日</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="list-group-item list-group-item-action">
                        <p class="mb-1">赛事1</p>
                        <div class="time">xxxx年xx月xx日</div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>

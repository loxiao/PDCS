<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<div class="container">
    <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
            <p class="mb-1">热门赛事</p>
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

    <div class="card text-center">
        <div class="card-header">
            赛事通知
        </div>
        <div class="card-body">
            <h5 class="card-title">赛事标题</h5>
            <p class="card-text">赛事主体通知内容</p>
            <a href="#" class="btn btn-primary">立即报名</a>
        </div>
        <div class="card-footer text-muted">
            2 days ago
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>


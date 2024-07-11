<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<style>
    .container {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        gap: 20px;
        margin-top: 20px;
    }
    .list-group-item {
        width: 300px;
        position: relative; /* 设置为 relative  */
    }
    .list-group-item p {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        width: 100%;
    }
    .card {
        width: 1200px;
    }
    .tooltip {
        display: none;
        position: absolute;
        background-color: #333;
        color: #fff;
        padding: 5px;
        border-radius: 5px;
        z-index: 10;
        max-width: 300px;
        white-space: normal;
        word-wrap: break-word;
    }
    .footer {
        position: fixed;
        bottom: 0;
        width: 100%;
        background-color: #f8f9fa;
        text-align: center;
        padding: 10px 0;
    }
</style>

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


<%@ page import="com.example.pdcs.domain.Works" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="css/uploadWork.css">
<div class="WorkDetails">
    <div class="head">
        <h2>竞赛名称</h2>
        <a href="WorksServlet?id=0">返回</a>
    </div>
    <div class="detail">
        <div class="introduce">
            <h4>竞赛简介</h4>
            <p>jingsaijiejian</p>
        </div>
        <div class="upload">
            <h4>上传作品</h4>
            <form action="" method="post">
                <input type="file" id="file" name="file" class="upload-file">
                <input type="button" id="uploadBtn" class="upload-btn" value="上传">
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
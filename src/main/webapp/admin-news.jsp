<%--
  Created by IntelliJ IDEA.
  User: syrup
  Date: 2024/7/12
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@include file="admin-head.jsp"%>
<div class="row container">
    <%@ include file="admin-sider.jsp"%>
    <div class="col-9">
        <div class="card">
            <div class="card-header">
                <h6>奖项设置</h6>
            </div>
            <div class="card-body">
                <div class="form-qroup col-12">
                    <form action="" method="post">
                        <input type="hidden" name="id" value="${CompetitionID}">
                        <label class="col-sm-2 col-form-label">奖状</label>
                        <input type="file" id="file" name="file" class="col-sm-4">
                        <input type="button" id="uploadBtn" class="btn btn-primary col-sm-2" value="上传">
                    </form>
                </div>

            </div>
            <div class="card-footer text-center">
                <span class="text-danger">${msg}</span>
            </div>
        </div>
    </div>
<%@include file="footer.jsp"%>
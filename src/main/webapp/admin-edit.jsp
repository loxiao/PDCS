<%--
  Created by IntelliJ IDEA.
  User: syrup
  Date: 2024/7/11
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="admin-head.jsp"%>
<div class="row container">
  <%@ include file="admin-sider.jsp"%>
  <div class="col-9">
    <div class="card">
      <div class="card-header">
        <h6>发布赛事</h6>
      </div>
      <div class="card-body">
        <div class="form-qroup col-12">
          <form action="CompetitionsServlet" method="post">
            <input type="hidden" name="id" value="">
            赛事名称: <input type="text" name="name" required class="form-control"><br>
            赛事描述: <textarea class="form-control" name="description"></textarea><br>
            <div class="row" style="justify-content:space-evenly">
              <div>开始日期: <input class="form-control" type="date" name="startDate"></div>
              <div>结束日期: <input class="form-control" type="date" name="endDate" ></div>
            </div>
            <div style="text-align: right"><input type="submit" class="btn btn-primary offset-1" value="添加赛事"></div>
          </form>
        </div>

      </div>
      <div class="card-footer text-center">
        <span class="text-danger">${msg}</span>
      </div>
    </div>
  </div>
<%@include file="footer.jsp"%>
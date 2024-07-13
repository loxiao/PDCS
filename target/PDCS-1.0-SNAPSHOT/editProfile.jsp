<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@include file="header.jsp"%>

<div class="container mt-5" style="max-width: 600px;">
  <h2 class="text-center mb-4">编辑个人信息</h2>

  <c:if test="${not empty msg}">
    <div class="alert alert-success" role="alert">
        ${msg}
    </div>
  </c:if>

  <ul class="nav nav-pills mb-3">
    <li class="nav-item">
      <a class="nav-link active" href="#" onclick="showTab('profile')">修改个人信息</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#" onclick="showTab('password')">修改密码</a>
    </li>
  </ul>

  <div id="profile" class="tab-content">
    <div class="card">
      <div class="card-header bg-primary text-white">
        <h5 class="card-title mb-0">修改个人信息</h5>
      </div>
      <div class="card-body">
        <form action="${ctx}/UpdateParticipantServlet" method="post">
          <input type="hidden" name="participantId" value="${participant.participant_id}">
          <div class="mb-3">
            <label for="username" class="form-label">用户名:</label>
            <input type="text" class="form-control" id="username" name="participant_name" value="${participant.participant_name}" required>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">邮箱:</label>
            <input type="email" class="form-control" id="email" name="participant_number" value="${participant.participant_number}" required>
          </div>
          <div class="mb-3">
            <label for="address" class="form-label">地址:</label>
            <input type="text" class="form-control" id="address" name="participant_address" value="${participant.participant_address}" required>
          </div>
          <div class="d-grid">
            <button type="submit" class="btn btn-primary btn-block">保存修改</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <div id="password" class="tab-content" style="display: none;">
    <div class="card">
      <div class="card-header bg-secondary text-white">
        <h5 class="card-title mb-0">修改密码</h5>
      </div>
      <div class="card-body">
        <form id="changePasswordForm" action="${ctx}/UpdateParticipantServlet" method="post">
          <input type="hidden" name="participantId" value="${participant.participant_id}">
          <div class="mb-3">
            <label for="newPassword" class="form-label">新密码:</label>
            <input type="password" class="form-control" id="newPassword" name="participant_psd">
          </div>
          <div class="mb-3">
            <label for="confirmNewPassword" class="form-label">确认新密码:</label>
            <input type="password" class="form-control" id="confirmNewPassword">
          </div>
          <div id="passwordError" class="text-danger" style="display: none;">两次密码输入不一致</div>
          <div class="d-grid">
            <button type="submit" class="btn btn-secondary btn-block">保存新密码</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<%@include file="footer.jsp"%>

<script>
  function showTab(tabName) {
    // 隐藏所有标签
    document.getElementById('profile').style.display = 'none';
    document.getElementById('password').style.display = 'none';

    // 显示选择的标签
    document.getElementById(tabName).style.display = 'block';

    // 更新激活的导航链接
    const links = document.querySelectorAll('.nav-link');
    links.forEach(link => {
      link.classList.remove('active');
    });
    document.querySelector(`a[onclick="showTab('${tabName}')"]`).classList.add('active');
  }

  document.getElementById('changePasswordForm').addEventListener('submit', function(event) {
    var newPassword = document.getElementById('newPassword').value;
    var confirmNewPassword = document.getElementById('confirmNewPassword').value;

    if (newPassword !== confirmNewPassword) {
      event.preventDefault();
      document.getElementById('passwordError').style.display = 'block';
    }
  });
</script>

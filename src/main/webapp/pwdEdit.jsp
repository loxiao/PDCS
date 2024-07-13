<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="participant-head.jsp"%>
<form action="PwdEditServlet" method="post">
    <%@include file="participant-sider.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="container">
            <h3 style="margin-left: -1.5%; margin-top: -4px;">密码修改</h3>
            <ul>
                <li>密码长度:8 - 16</li>
                <li>密码必须包含数字,字母和字符（例如@ # *）</li>
                <li>参考密码  123223@usx  213122#usx  3213@USX</li>
            </ul>
            <hr style="width: 973px; margin-left: -1.5%">
            <div class="form-signin">
                <div class="form-group">
                    <label style="font-size: 15px; margin-right: 10px; float: left; margin-top: 10px">旧密码</label>
                    <input name="oldPwd" type="password" id="oldPwd" class="form-control" placeholder="请输入旧密码" style="width: 280px; margin-bottom: 15px;">
                </div>
                <div class="form-group">
                    <label style="font-size: 15px; margin-right: 10px; float: left; margin-top: 10px">新密码</label>
                    <input name="newPwd" type="password" id="newPwd" class="form-control" placeholder="请输入新密码" style="width: 280px; margin-bottom: 15px">
                </div>
                <div class="form-group">
                    <label style="font-size: 15px; margin-right: 10px; float: left; margin-top: 10px">新密码</label>
                    <input name="reNewPwd" type="password" id="reNewPwd" class="form-control" placeholder="再次输入新密码" style="width: 280px; margin-bottom: 20px">
                </div>
                <div class="text-center">
                    <span class="text-danger" id="msg">${msg}</span>
                </div>
                <div style="clear:both;width:380px;">
                    <input type="submit" name="btnSubmit" value="修改" class="btn btn-lg btn-primary btn-block" style="width:80px;margin: auto; padding: 5px;">
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp"%>
    </div>
</form>
</body>
</html>
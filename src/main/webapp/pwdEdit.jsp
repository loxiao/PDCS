<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="participant-head.jsp"%>
<%@include file="participant-sider.jsp"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <form id="PwdForm" action="PwdEditServlet" method="post">
        <div class="container1">
            <input type="hidden" id="participant_psd" value="${participant.participant_psd}" />
            <h3 style="margin-left: -1.5%; margin-top: -4px;">密码修改</h3>
            <ul>
                <li>密码长度:4 - 20</li>
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
    </form>
    <div class="text-center">
        <span class="text-danger">${msg1}</span>
    </div>
    <%@ include file="footer.jsp"%>
</div>
</body>
</html>
<script>
    $(function () {
        $("#PwdForm").validate({
            rules: {
                oldPwd: {
                    required: true,
                    equalTo: "#participant_psd"
                },
                newPwd: {
                    required: true,
                    minlength: 4, // 新密码最小长度
                    maxlength: 20, // 新密码最大长度
                    regex: "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+\\-={}|;':\",.<>/?]).{4,20}$",// 正则表达式验证密码复杂度
                    notEqualTo: function (element) {
                        var currentPwd = $(element).closest('form').find('input[name="oldPwd"]').val();
                        return currentPwd;
                    }
                },
                reNewPwd: {
                    required: true,
                    equalTo: "#newPwd" // 确认新密码需要与新密码相同
                }
            },
            messages: {
                oldPwd: {
                    required: "请输入原密码",
                    equalTo: "原密码不匹配，请重新输入"
                },
                newPwd: {
                    required: "请输入新密码",
                    minlength: "密码长度至少为4个字符",
                    maxlength: "密码长度不能超过20个字符",
                    regex: "密码必须包含数字、字母和特殊字符",
                    notEqualTo: "新密码不能与原密码相同"
                },
                reNewPwd: {
                    required: "请再次输入新密码",
                    equalTo: "两次输入的新密码不匹配，请重新输入"
                }
            }
        })
    })
</script>
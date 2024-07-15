<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="participant-head.jsp"%>
<%@include file="participant-sider.jsp"%>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="section1">
        <form id="InformationForm" action="ParticipantEditServlet" method="post">
            <div class="container" style="width: 650px;">
                <h3 style="margin-left: -30%; margin-top: -4px;">账号信息</h3>
                <p style="margin-left:-30%">学生信息正确完整，才能报名参赛，邮箱必填</p>
                <hr style="width:973px;margin-left:-30%">
                <div class="registerBox">
                    <div class="form-group col-6">
                        <label style="font-size: 15px; margin-left: 13%; margin-top: 5px">个人ID</label>
                        <input name="Id" type="text" id="Id" class="form-control" value="${participant.participant_id}" readonly>
                    </div>
                    <br>
                    <div class="form-group col-6">
                        <label style="font-size: 15px; margin-left: 13%; margin-top: 5px">姓名</label>
                        <input name="Name" type="text" id="Name" class="form-control" placeholder="姓名" style="width: 400px; float: right; margin-right: 15%;" value="${participant.participant_name}">
                    </div>
                    <br>
                    <div class="form-group col-6">
                        <label style="font-size: 15px; margin-left: 13%; margin-top: 5px">邮箱</label>
                        <input name="Email" type="email" id="Email" class="form-control" placeholder="邮箱" style="width: 400px; float: right; margin-right: 15%" value="${participant.participant_number}">
                    </div>
                    <br>
                    <div class="form-group col-6">
                        <label style="font-size: 15px; margin-left: 13%; margin-top: 5px">地址</label>
                        <input name="Address" type="text" id="Address" class="form-control" placeholder="地址" style="width: 400px; float: right; margin-right: 15%" value="${participant.participant_address}">
                    </div>
                    <div class="clearfix"></div>
                    <div style="width: 90px; margin: auto;">
                        <input type="submit" name="Bt_Reg" value="保存修改" id="Bt_Reg" class="btn btn-lg btn-primary">
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="text-center">
        <span class="text-danger">${msg}</span>
    </div>
    <%@include file="footer.jsp"%>
</div>
</body>
</html>
<script>
    $(function () {
        $("#InformationForm").validate({
            rules: {
                Name:{
                    required:true,
                },
                Email:{
                    required:true,
                    email:true,
                }
            },
            messages: {
                Name:{
                    required:"姓名不能为空",
                },
                Email:{
                    required:"邮箱不能为空",
                    email:"邮箱格式错误"
                }
            }
        });<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    })
</script>
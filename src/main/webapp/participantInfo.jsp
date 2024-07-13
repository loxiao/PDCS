<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="participant-head.jsp"%>
<form action="ParticipantEditServlet" method="post">
    <%@include file="participant-sider.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="section1">
            <div class="container" style="width: 650px;">
                <h3 style="margin-left: -30%; margin-top: -4px;">账号信息</h3>
                <p style="margin-left:-30%">学生信息正确完整，才能报名参赛，邮箱必填</p>
                <hr style="width:973px;margin-left:-30%">
                <div class="registerBox">
                    <div class="form-group">
                        <label style="font-size: 15px; margin-left: 13%; margin-top: 5px">姓名</label>
                        <input name="Name" type="text" id="Name" class="form-control" placeholder="姓名" style="width: 400px; float: right; margin-right: 15%;" value="${participant.getParticipant_name()}">
                    </div>
                    <br>
                    <div class="form-group">
                        <label style="font-size: 15px; margin-left: 13%; margin-top: 5px">邮箱</label>
                        <input name="Email" type="text" id="Email" class="form-control" placeholder="邮箱" style="width: 400px; float: right; margin-right: 15%" value="${participant.getParticipant_number()}">
                    </div>
                    <br>
                    <div class="form-group">
                        <label style="font-size: 15px; margin-left: 13%; margin-top: 5px">地址</label>
                        <input name="Address" type="text" id="Address" class="form-control" placeholder="地址" style="width: 400px; float: right; margin-right: 15%" value="${participant.getParticipant_address()}">
                    </div>
                    <div class="clearfix"></div>
                    <div style="width: 90px; margin: auto;">
                        <input type="submit" name="Bt_Reg" value="保存修改" id="Bt_Reg" class="btn btn-lg btn-primary">
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </div>
</form>
</body>
</html>


<%@ page import="com.example.pdcs.domain.Works" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery-3.6.0.min.js"></script>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="css/uploadWork.css">
<div class="w" >
    <div class="row container " style="margin: 0 auto;">
        <div class="WorkDetails" style="width: 320px">
            <div class="head">
                <h2>赛事介绍</h2>
                <a href="WorksServlet?id=0">返回</a>
            </div>
            <div class="detail">
                <div class="introduce">
                    <h4>${competitionWork.getCompetitionName()}</h4>
                    <h4>竞赛简介</h4>
                    <p>${competitionWork.getCompetitionDescription()}</p>
                </div>
            </div>
        </div>
        <div class="WorkDetails" style="width: 700px">
            <div class="head">
                <h2>作品提交</h2>
            </div>
            <p>你的团队 —— ${team.getTeamName()}</p>
            <div class="upload">
                <form method="post" id="uploadForm" class="row">
                    <input type="file" class="form-control"  id="file" name="file" class="upload-file" style="width: 200px" >
                    <input type="button" id="uploadBtn" value="图片上传" class="btn btn-primary offset-1" style="width: 100px">
                </form>
                <br>
                <form action="WorkUploadServletServlet" method="post">
                    <input type="hidden"  name="competitionID" value="${competitionWork.getCompetitionID()}" >
                    <input type="hidden"  name="tid" value="${team.getTeamID()}" >
                    <input type="hidden" id="photo" name="photo" value="">
                    <input type="text" class="form-control"  id="title" name="title" placeholder="作品标题"> <br>
                    <textarea id="content" class="form-control"  name="content" placeholder="作品内容"></textarea><br>
                    <div style="text-align: center">
                        <img src="" id="img" height="100" width="80" alt="图片预览"><br>
                        <input type="submit"  value="提交作品" class="btn btn-primary offset-1"  style="margin: 0 auto;">
                    </div>
                </form>
                <span class="text-danger" id="msg">${wsg}</span>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</div>
<script type="text/javascript">
    $('#img').hide();
    $(document).ready(function (){
        $('#uploadBtn').click(function (){
            let formData = new FormData($('#uploadForm')[0]);
            $.ajax({
                url: '${ctx}/FileUploadServlet',
                type: 'post',
                data: formData,
                contentType: false,
                processData: false,
                success: function (returnData){
                    $('span.text-danger').text("图片上传成功");
                    $('#img').show();
                    $('#img').prop('src','${ctx}/postimg/'+returnData);
                    $('#photo').val(returnData);
                },error:function (returnData){
                    $('span.text-danger').text("错误: " + returnData.responseText);
                }
            });
        })
    })
</script>
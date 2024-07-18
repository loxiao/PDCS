<%@ page import="com.example.pdcs.domain.Works" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/jquery-3.6.0.min.js"></script>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="css/uploadWork.css">
<div class="row container">
    <div class="WorkDetails" style="width: 400px">
        <div class="head">
            <h2>竞赛名称</h2>
            <a href="WorksServlet?id=0">返回</a>
        </div>
        <div class="detail">
            <div class="introduce">
                <h4>竞赛简介</h4>
                <p>2022年第7届大学生海洋公益海报竞赛是一项旨在提升公众海洋保护意识的年度盛事。本次竞赛鼓励学生们运用创意设计，展现海洋生态的多样性与脆弱性，倡导可持续发展的理念。参赛者将通过海报这一直观媒介，
                    传达保护海洋环境的紧迫性和重要性。我们诚邀全国在校大学生积极参与，用艺术的力量为海洋发声，共同守护我们的蓝色星球。</p>
            </div>
        </div>
    </div>
    <div class="WorkDetails" style="width: 700px">
        <div class="head">
            <h2>作品提交</h2>
        </div>
        <div class="upload">
            <form method="post" id="uploadForm">
                <input type="file" class="form-control"   id="file" name="file" class="upload-file"><br>
                <div style="text-align: center">
                    <input type="button" id="uploadBtn" value="提交作品" class="btn btn-primary offset-1" style="margin: 0">
                </div>
            </form>
            <form action="" method="post">
                <input type="text" class="form-control"  id="title" name="title" placeholder="作品标题"> <br>
                <input type="text" class="form-control"  id="team" name="team" placeholder="团队名称"><br>
                <textarea id="content" class="form-control"  name="content" placeholder="作品内容"></textarea><br>
                <img src="postimg/${works.getImageURL()}"id="img" height="100" width="80" alt="图片预览">
            </form>
            <span class="text-danger" id="msg">${msg}</span>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
<script type="text/javascript">
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
                    $('#img').prop('src','${ctx}/postimg/'+returnData);
                    $('#photo').val(returnData);
                },error:function (returnData){
                    $('span.text-danger').text("错误: " + returnData.responseText);
                }
            });
        })
    })
</script>
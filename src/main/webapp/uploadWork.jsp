<%@ page import="com.example.pdcs.domain.Works" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="css/uploadWork.css">
<script src="js/jquery-3.6.0.min.js"></script>
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
        <form id="uploadForm" method="post" enctype="multipart/form-data">
            <label class="col-sm-2 col-form-label">宠物图片</label>
            <input type="file" class="form-control" id="file" name="file"><br>
            <div style="text-align: center">
                <input type="submit" id="uploadBtn" value="提交作品" class="btn btn-primary offset-1" style="margin: 0">
            </div>
        </form>
        <div class="upload">
            <form action="" method="post" enctype="multipart/form-data">
                <input type="hidden" name="competitionId" value="${competitionId}">
                <input type="hidden" name="tid" value="${teamId}">
                <input type="text" class="form-control" id="title" name="title" placeholder="作品标题"><br>
                <input type="text" class="form-control" id="team" name="team" placeholder="团队名称"><br>
                <textarea id="content" class="form-control" name="content" placeholder="作品内容"></textarea><br>
                <div class="col-sm-2">
                    <img src="" id="img" alt="图片预览" width="80" height="100">
                </div>
            </form>
        </div>
    </div>

</div>
<script>
    $(document).ready(function () {
        $('#uploadBtn').click(function () {
            let formData = new FormData($('#uploadForm')[0]); // 获取封装表单数据
            $.ajax({
                url: 'FileUploadServlet', // 表单提交url
                type: 'post', // 表单提交方式
                data: formData, // 表单提交数据
                contentType: false, // 文件上传时需设置contentType为false
                processData: false, // 文件上传时需设置processData为false
                success: function (returnData) {
                    $('span.text-danger').text("宠物图片上传成功");
                    $('#img').prop('src', 'postimg/' + returnData); // 预览图片
                    $('#photo').val(returnData); // 表单元素photo的值设置为新文件名
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $('span.text-danger').text("宠物图片上传失败: " + textStatus + ", " + errorThrown);
                }
            });
        });
    });
</script>
<%@include file="footer.jsp"%>
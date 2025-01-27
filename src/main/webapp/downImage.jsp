<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<link rel="stylesheet" href="css/award.css">
<script src="js/html2canvas.min.js"></script>
<div class="w">
    <div class="container">
        <div class="card" style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
        <div class="card-header">奖状下载</div>
        <div class="card-body">
            <h3 class="custom-font">赛事 —— ${competitionName}</h3><br>
            <h5 class="custom-font">获奖团队:${teamName}</h5><br>

            <div id="certificate">
                <p class="custom-font">—— 荣誉证书 ——</p>
                    <p class="custom-font">将此证书颁发给 <span>${teamName}</span> </p>
                    <p class="custom-font">在参加${competitionName}中: </p>
                    <p class="custom-font">获得${teamAward} </p>
                    <p class="custom-font">特发此证，以资鼓励 </p>
                <ul>
                    <li>大学生海报设计竞赛系统</li>
                    <li>2014/7/18</li>
                </ul>
            </div>
                <!-- 添加保存按钮 -->
            <div>
                <button onclick="saveAsImage()" class="form-control" style="width: 20%;margin: 20px auto;">保存为图片</button>
            </div>
        </div>
    </div>
    </div>
    <%@ include file="footer.jsp"%>
</div>
<script>
    /*** 将奖状保存为图片 */
    function saveAsImage() {
        // 获取证书元素
        const certificateElement = document.getElementById('certificate');
        // 使用html2canvas生成canvas
        html2canvas(certificateElement).then((canvas) => {
            // 将canvas转换为图片数据URL
            const imgDataUrl = canvas.toDataURL('image/png');

            // 创建隐藏的a标签用于下载
            const downloadLink = document.createElement('a');
            downloadLink.href = imgDataUrl;
            downloadLink.download = 'result.jpg';
            downloadLink.click();
        });
    }
</script>

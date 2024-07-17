<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.3/html2canvas.min.js"></script>
<style>
    #certificate {
        width: 600px;
        height: 400px;
        margin: 50px auto;
        border: 1px solid #000;
        text-align: center;
        background-image: url('awards/result.jpg'); /* 替换为你的图片URL */
        background-size: cover; /* 调整图片大小以覆盖整个容器 */
        position: relative; /* 设置为相对定位，以便绝对定位的子元素相对于它定位 */
        padding-top: 100px; /* 假设你的模板图片有顶部留白，可以适当调整这个值 */
    }
</style>
<div class="container">
    <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
            <p class="mb-1">最近新闻</p>
            <div class="tooltip"></div>
        </a>
        <c:forEach items="${oldcompetitions}" var="competitions">
            <a href="${ctx}/AwardServlet?id=${competitions.getCompetitionID()}" class="list-group-item list-group-item-action">
                <p class="mb-1">${competitions.getCompetitionName()}颁奖结构</p>
                <div class="tooltip"></div>
            </a>
        </c:forEach>
    </div>
    <%--新闻列表--%>
    <c:if test="${tsg == 'more'}">
        <div class="card ">
            <div class="card-header" style="padding: 20px;">
                竞赛新闻
            </div>
            <div class="card-body">
                <ul class="more">
                    <c:forEach items="${newcompetitionAll}" var="competitions">
                        <li>
                            <a href="${ctx}/AwardServlet?id=${competitions.getCompetitionID()}" class="list-group-item list-group-item-action">
                                <p class="mb-1">${competitions.getCompetitionName()}获奖名单</p>
                                <div class="time">${competitions.getCompetitionDate()}</div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <nav aria-label="Page navigation example" style="margin: 0 auto;">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="PaginationServlet?more=award&page=1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach items="${pageCount}" var="page">
                        <li class="page-item"><a href="PaginationServlet?more=award&page=${page}" class="page-link">${page}</a></li>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link" href="PaginationServlet?more=award&page=${pageCount.size()}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </c:if>
    <%--新闻--%>
        <div class="card ">
            <div class="card-header">奖状下载</div>
            <div class="card-body">
<%--                这个还需要修改--%>
                <h3 class="custom-font">获奖团队:海洋卫士</h3>
                <br>
                <h5 class="custom-font">奖项名称:${competitions.getCompetitionName()}</h5>
                <br>
                <!-- 添加保存按钮 -->
                <button onclick="saveAsImage()" class="custom-font">保存为图片</button>
                <div id="certificate">
                    <p class="custom-font" style="font-size: 24px;">${competitions.getCompetitionName()}</p>
                    <c:if test="${!empty first}">
                        <p class="custom-font">海洋卫士${first}</p>
                        <li class="custom-font">一等奖: ${first}</li>
                    </c:if>
                    <c:if test="${!empty second}">
                        <p class="custom-font">海洋卫士${second}</p>
                        <li class="custom-font">二等奖: ${second}</li>
                    </c:if>
                    <c:if test="${!empty third}">
                        <p class="custom-font">海洋卫士${third}</p>
                        <li class="custom-font">三等奖: ${third}</li>
                    </c:if>
                </div>
            </div>
        </div>
</div>
<%@ include file="footer.jsp"%>
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

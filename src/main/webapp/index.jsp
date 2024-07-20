<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/index.css">
<%@include file="header.jsp"%>
<%--轮播--%>
<div class="w" style="top: 12%">
    <div class="carousel_map" >
        <div class="slide">
            <!--小圆点-->
            <input type="radio" name="pic" id="pic1" checked />
            <input type="radio" name="pic" id="pic2" />
            <input type="radio" name="pic" id="pic3" />

            <div class="labels">
                <label for="pic1"></label>
                <label for="pic2"></label>
                <label for="pic3"></label>
            </div>

            <!--需要轮播的图片-->
            <ul class="list">
                <li class="item">
                    <a href="###">
                        <img src="postimg/国际大学生创新大赛.jpg" alt="国际大学生创新大赛" style="height: 100%; width: 100%;" />
                    </a>
                </li>
                <li class="item">
                    <a href="###">
                        <img src="postimg/集成电路创新创业大赛.png" alt="通信技术大赛" style="height: 100%; width: 100%;" />
                    </a>
                </li>
                <li class="item">
                    <a href="###">
                        <img src="postimg/通信技术大赛.png" alt="集成电路创新创业大赛" style="height: 100%; width: 100%;" />
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <main style="width:1280px;margin: 0 auto;">
        <div class="card-box flex cc">
            <div class="cards">
                <div class="cards-header flex spc">
                    <div class="title" style="font-size: 30px;margin: 0">大赛通知</div>
                    <div class="more"><a href="${ctx}/PaginationServlet?more=competition&page=1">查看更多 >></a></div>
                </div>
                <div class="cards-content">
                    <c:forEach items="${newcompetitions}" var="competitions">
                        <li><a href="${ctx}/NewsLIstServlet?id=${competitions.getCompetitionID()}">${competitions.getCompetitionName()}开始报名</a></li>
                    </c:forEach>
                </div>
            </div>
            <div class="cards">
                <div class="cards-header flex spc">
                    <div class="title" style="font-size: 30px;margin: 0">最新获奖</div>
                    <div class="more"><a href="${ctx}/PaginationServlet?more=award&page=1">查看更多 >></a></div>
                </div>
                <div class="cards-content">
                    <c:forEach items="${oldcompetitions}" var="competitions">
                        <li><a href="${ctx}/AwardServlet?id=${competitions.getCompetitionID()}">${competitions.getCompetitionName()}获奖结果</a></li>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="nav-title">本届赛事</div>
        <div class="gaid-card ">
            <c:forEach items="${competitiontypesList}" var="competitiontype">
                <a href="${ctx}/NewsLIstServlet?typeId=${competitiontype.getCompetitionTypeID()}&typeName= ${competitiontype.getTypeName()}" class="card education">
                    <div class="overlay"></div>
                    <div class="circle">
                    </div>
                    <p>
                    <span>
                            ${competitiontype.getTypeName()}
                    </span><br><br>
                        点击报名
                    </p>
                </a>
            </c:forEach>
        </div>
        <%--    作品展示--%>
        <div class="nav-title">优秀作品</div>
        <div class="container" style="margin: 0px auto;min-height: 290px;">
            <c:forEach items="${excellentWorks}" var="works">
                <a href="${ctx}/WorkDetailsServlet?workId=${works.getWorkID()}" class="box">
                    <div class="img-box">
                        <img src="postimg/${works.getImageURL()}" alt="">
                    </div>
                    <div class="text-box">
                        <div>
                            <h2>${works.getWorkName()}</h2>
                            <p>${works.getComments()}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </main>
    <%@include file="footer.jsp"%>
</div>
<script src="js/particle.min.js"></script>
</script>
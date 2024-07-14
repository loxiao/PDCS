<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/index.css">
<%@include file="header.jsp"%>
<div class="carousel">
    <div class="carousel-slides">
        <div class="carousel-slide active">
            <img src="" alt="Image 1">
        </div>
        <div class="carousel-slide">
            <img src="" alt="Image 2">
        </div>
        <div class="carousel-slide">
            <img src="" alt="Image 3">
        </div>
    </div>
    <a class="prev" onclick="moveSlide(-1)">&#10094;</a>
    <a class="next" onclick="moveSlide(1)">&#10095;</a>
</div>
<main style="width:1280px;margin: 0 auto; ">
    <div class="card-box flex cc">
        <div class="cards">
            <div class="cards-header flex spc">
                <div class="title" style="font-size: 30px;margin: 0">大赛通知</div>
                <div class="more"><a href="${ctx}/NewsLIstServlet">查看更多 >></a></div>
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
                <div class="more"><a href="${ctx}/AwardServlet">查看更多 >></a></div>
            </div>
            <div class="cards-content">
                <c:forEach items="${oldcompetitions}" var="competitions">
                    <li><a href="${ctx}/AwardServlet?id=${competitions.getCompetitionID()}">${competitions.getCompetitionName()}获奖结果</a></li>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="nav-title">本届赛事</div>
    <div class="gaid-card">
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
</main>
<script src="js/index.js"></script>
<%@include file="footer.jsp"%>
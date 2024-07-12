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
        <div class="card">
            <div class="card-header flex spc">
                <div class="title" style="font-size: 30px;">大赛通知</div>
                <div class="more"><a href="">查看更多 >></a></div>
            </div>
            <div class="card-content">
                <c:forEach items="${newcompetitions}" var="competitions">
                    <li><a href="">${competitions.getCompetitionName()}开始报名</a></li>
                </c:forEach>
            </div>
        </div>
        <div class="card">
            <div class="card-header flex spc">
                <div class="title" style="font-size: 30px;">最新获奖</div>
                <div class="more"><a href="">查看更多 >></a></div>
            </div>
            <div class="card-content">
                <c:forEach items="${oldcompetitions}" var="competitions">
                    <li><a href="">${competitions.getCompetitionName()}获奖结果</a></li>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="nav-title">本届赛事</div>
    <div class="gaid-card">
        <a href="#" class="card education">
            <div class="overlay"></div>
            <div class="circle">

            </div>
            <p>点击报名</p>
        </a>
    </div>
</main>
<script src="js/index.js"></script>
<%@include file="footer.jsp"%>
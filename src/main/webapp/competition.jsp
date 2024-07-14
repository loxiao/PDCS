<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/detail.css">
<script src="js/jquery-3.6.0.min.js" ></script>
<script src="js/pagination.js" defer></script>
<div class="container">
    <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
            <p class="mb-1">${asg}</p>
            <div class="tooltip"></div>
        </a>
        <c:forEach items="${newcompetitions}" var="competitions">
            <a href="${ctx}/NewsLIstServlet?id=${competitions.getCompetitionID()}" class="list-group-item list-group-item-action" >
                <p class="mb-1">>${competitions.getCompetitionName()}</p>
                <div class="tooltip"></div>
            </a>
        </c:forEach>
    </div>

    <%--    //某类型竞赛简介--%>
    <c:if test="${empty tsg}">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title text-center">${tsg}竞赛简介</h1>
                <h4>一、竞赛简介</h4>
                <p class="card-text">
                    浙江省大学生${tsg}海报竞赛是由浙江省大学生科技竞赛委员会主办，浙江传媒学院承办一项大学生竞赛。
                    竞赛宗旨是为推动海报绘画专业人才的培养和公共艺术教育的发展，促进课程体系和教学内容的改革，提高指导教师能力水平；
                    丰富大学校园文化，鼓励大学生用海报作品讴歌“美丽中国”、展现对“中国梦”的追求与向往，
                    引导大学生提高摄影专业能力和创作水平，培养大学生的创新意识和能力。
                </p>
                <h4>三、竞赛的主要内容</h4>
                <p class="card-text">
                    1.绍兴文理学院普通全日制在校本专科生均可参赛。基地根据学生报名参赛情况进行选拔赛。
                    2.参赛学生必须了解竞赛有关内容并按规定时间和要求参加竞赛。竞赛期间，参赛学生可以使用手绘和计算机按照竞赛要求创作作品，竞赛基地组织指导教师进行定期讲评作品并引导参赛学生进行相关主题创作。
                    3.浙江省大学生海报竞赛每年四月份发布竞赛通知，注意报名/作品提交日期，逾期未提交作品视为弃权。
                </p>
                <h4>二、竞赛基本信息</h4>
                <p class="card-text">
                    1.浙江省大学生摄影竞赛采取统一命题的形式，学生根据命题进行主题创作。
                    2.参赛作品分多个主题。
                    3.竞赛评比主要从主题表达、艺术感染力、作品质量3个方面对参赛作品进行评比。
                    评分点包括作品标题，思想内涵，艺术观念，画面创意，画面构思，审美情趣，表达的准确完整性，信息量；
                    画面形式感，绘画技巧，瞬间把握，光影构成。
                    4．所有作品须为我校大学生的原创作品，参赛者对参赛作品拥有充分、完全、排他的知识产权，不侵犯任何他人的任何知识产权、名誉权、隐私权、肖像权等。
                    若有知识产权、名誉权、隐私权、肖像权纠纷或争议，其法律责任由投稿者自行负责
                </p>
            </div>
        </div>
    </c:if>
    <c:if test="${!empty tsg and tsg == 'more'}">
        <div class="card">
            <div class="card-header" style="padding: 20px;">
                竞赛
            </div>
            <div class="card-body">
                <ul class="more">
                    <c:forEach items="${newcompetitionAll}" var="competitions">
                        <li>
                            <a href="${ctx}/NewsLIstServlet?id=${competitions.getCompetitionID()}" class="list-group-item list-group-item-action">
                                <p class="mb-1">${competitions.getCompetitionName()}</p>
                                <div class="tooltip"></div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <nav aria-label="Page navigation example" style="margin: 0 auto;">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a href="PaginationServlet?page=1" class="page-link">1</a></li>
                    <li class="page-item"><a href="PaginationServlet?page=2" class="page-link">2</a></li>
                    <li class="page-item"><a href="PaginationServlet?page=3" class="page-link">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

    </c:if>
    <%--    竞赛--%>
    <c:if test="${!empty tsg and tsg == 'one'}">
        <div class="card">
            <div class="card-header">
                赛事通知
            </div>
            <div class="card-body">
                <h3 class="card-title text-center">${competitions.getCompetitionName()}</h3>
                <h5>竞赛简介</h5>
                <p class="card-text">${competitions.getCompetitionDescription()}</p>
                <h5>参赛形式</h5>
                <p class="card-text">
                    以个人或小组（每组人数按参赛类别确定）形式报名参加。
                    参赛小组成员需要在绍大竞赛网 注册，组长负责参赛报名。
                </p>
                <h5>报名/作品提交日期:</h5>
                <p class="card-text">${competitions.getPublishDate()} -- ${competitions.getCompetitionDate()}</p>
                <div class="flex justify-content-around">
                    <a href="${ctx}/JudgmentServlet?id=${competitions.getCompetitionID()}" class="btn btn-primary">创建团队报名</a>
                    <a href="#" class="btn btn-primary">加入团队报名</a>
                </div>

            </div>
            <p class="mb-1 text-center" style="color: red">${msg}</p>
        </div>
    </c:if>

</div>
</div>

<%@ include file="footer.jsp"%>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="sidebar">
    <div class="menu-item">
        <a href="${ctx}/ParticipantServlet?view=myCompetition"><i class="icon-heart"></i>  我的竞赛</a>
    </div>
    <div class="menu-item">
        <a href="${ctx}/ParticipantServlet?view=myEntry"><i class="icon-hand-right"></i>  我要报名</a>
    </div>
    <div class="menu-item">
        <a href="${ctx}/ParticipantServlet?view=myAwards"><i class="icon-home"></i>  我的奖状</a>
    </div>
    <div class="menu-item">
        <a href="${ctx}/ParticipantServlet?view=competitionList"><i class="icon-table"></i>  竞赛列表</a>
    </div>
    <div class="menu-item active">
        <a href="${ctx}/ParticipantServlet?view=participantInfo"><i class="icon-user"></i>  账户信息</a>
    </div>
    <div class="menu-item">
        <a href="${ctx}/ParticipantServlet?view=pwdEdit"><i class="icon-wrench"></i>  修改密码</a>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var currentPath = window.location.pathname; // 获取当前页面的路径
        var navLinks = document.querySelectorAll('.nav-link'); // 获取所有导航链接

        navLinks.forEach(function(link) {
            if (link.getAttribute('href') === currentPath) {
                link.classList.add('active'); // 如果路径匹配，添加active类
            }
        });
    });
</script>
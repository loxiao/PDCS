<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="sidebar">
    <div class="menu-item">
        <a href="${ctx}/ParticipantServlet?view=myCompetition"><i class="icon-heart"></i>  我的竞赛</a>
    </div>
    <div class="menu-item">
        <a href="${ctx}/ParticipantServlet?view=myEntry"><i class="icon-hand-right"></i>  我要报名</a>
    </div>
    <hr>
    <div class="menu-item">
        <a href="${ctx}/ParticipantServlet?view=myAwards"><i class="icon-home"></i>  我的奖状</a>
    </div>
    <div class="menu-item">
        <a href="${ctx}/ParticipantServlet?view=competitionList"><i class="icon-table"></i>  竞赛列表</a>
    </div>
    <hr>
    <div class="menu-item active">
        <a href="${ctx}/ParticipantServlet?view=participantInfo"><i class="icon-user"></i>  账户信息</a>
    </div>
    <div class="menu-item">
        <a href="${ctx}/ParticipantServlet?view=pwdEdit"><i class="icon-wrench"></i>  修改密码</a>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 获取当前页面的路径
        var currentPath = window.location.pathname;

        // 获取所有的菜单项
        var menuItems = document.querySelectorAll('.menu-item');

        // 遍历菜单项，移除所有菜单项的active类
        menuItems.forEach(function(item) {
            item.classList.remove('active');
        });

        // 遍历菜单项，为当前页面对应的菜单项添加active类
        menuItems.forEach(function(item) {
            // 假设URL参数中的view参数值与菜单项的href属性值相匹配
            var menuItemPath = item.querySelector('a').getAttribute('href').split('?view=')[1];
            if (currentPath.includes(menuItemPath)) {
                item.classList.add('active');
            }
        });
    });
</script>
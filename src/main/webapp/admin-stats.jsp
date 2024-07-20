<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>数据统计</title>
  <script src="https://cdn.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
  <style>
    /* 使图表容器居中 */
    .chart-container {
      width: 800px;
      height: 600px;
      margin: 0 auto; /* 水平居中 */
      display: none;
    }

    .chart-container.active {
      display: block;
    }
  </style>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="container">
  <h2>数据统计</h2>
  <ul class="nav nav-tabs" id="statsTabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" id="competitionStatsTab" data-toggle="tab" href="#competitionStats" role="tab"
         aria-controls="competitionStats" aria-selected="true">竞赛统计</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="topCompetitionsTab" data-toggle="tab" href="#topCompetitions" role="tab"
         aria-controls="topCompetitions" aria-selected="false">热门竞赛</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" id="participantTrendTab" data-toggle="tab" href="#participantTrend" role="tab"
         aria-controls="participantTrend" aria-selected="false">参赛人数趋势</a>
    </li>
  </ul>
  <div class="tab-content" id="statsTabsContent">
    <div class="tab-pane fade show active chart-container" id="competitionStats" role="tabpanel"
         aria-labelledby="competitionStatsTab">
      <div class="btn-group mb-3" role="group" aria-label="Chart type">
        <button type="button" class="btn btn-secondary active" data-chart-type="bar">柱状图</button>
        <button type="button" class="btn btn-secondary" data-chart-type="pie">饼图</button>
      </div>
      <div id="competitionStatsChart" style="width: 100%; height: 100%;"></div>
    </div>
    <div class="tab-pane fade chart-container" id="topCompetitions" role="tabpanel"
         aria-labelledby="topCompetitionsTab">
      <div class="btn-group mb-3" role="group" aria-label="Chart type">
        <button type="button" class="btn btn-secondary active" data-chart-type="bar">柱状图</button>
        <button type="button" class="btn btn-secondary" data-chart-type="pie">饼图</button>
      </div>
      <div id="topCompetitionsChart" style="width: 100%; height: 100%;"></div>
    </div>
    <div class="tab-pane fade chart-container" id="participantTrend" role="tabpanel"
         aria-labelledby="participantTrendTab">
      <div id="participantTrendChart" style="width: 100%; height: 100%;"></div>
    </div>
  </div>
</div>
<%@ include file="footer.jsp"%>
<script>
  $(document).ready(function () {
    // 页面加载时默认加载竞赛统计
    loadCompetitionStats();

    // 监听标签页切换事件
    $('#statsTabs a').on('click', function (e) {
      e.preventDefault();
      $(this).tab('show');

      // 获取当前激活的标签页 ID
      const activeTabId = $(this).attr('href');

      // 隐藏所有图表容器
      $('.chart-container').removeClass('active');

      // 显示当前激活的图表容器
      $(activeTabId).addClass('active');

      // 根据当前激活的标签页加载相应的数据
      if (activeTabId === '#competitionStats') {
        loadCompetitionStats();
      } else if (activeTabId === '#topCompetitions') {
        loadTopCompetitionsStats();
      } else if (activeTabId === '#participantTrend') {
        loadParticipantTrendStats();
      }
    });

    // 按钮点击事件处理
    $('.btn-group button').click(function() {
      $(this).addClass('active').siblings().removeClass('active'); // 更新按钮组选中状态

      // 获取当前激活的标签页 ID
      const activeTabId = $('#statsTabs .nav-link.active').attr('href');

      // 根据当前激活的标签页重新渲染图表
      if (activeTabId === '#competitionStats') {
        loadCompetitionStats();
      } else if (activeTabId === '#topCompetitions') {
        loadTopCompetitionsStats();
      }
    });
  });

  function loadCompetitionStats() {
    $.ajax({
      url: '${pageContext.request.contextPath}/CompetitionStatsServlet',
      type: 'GET',
      data: {chartType: 'competitionStats'},
      dataType: 'json',
      success: function (data) {
        renderCompetitionStatsChart(data);
      }
    });
  }

  function loadTopCompetitionsStats() {
    $.ajax({
      url: '${pageContext.request.contextPath}/CompetitionStatsServlet',
      type: 'GET',
      data: {chartType: 'competitionStats'},
      dataType: 'json',
      success: function (data) {
        renderTopCompetitionsChart(data);
      }
    });
  }

  function loadParticipantTrendStats() {
    $.ajax({
      url: '${pageContext.request.contextPath}/CompetitionStatsServlet',
      type: 'GET',
      data: {chartType: 'participantTrend', timeRange: 'month'},
      dataType: 'json',
      success: function (data) {
        renderParticipantTrendChart(data);
      }
    });
  }

  function renderCompetitionStatsChart(data) {
    const chart = echarts.init(document.getElementById('competitionStatsChart'));
    const chartType = $('#competitionStats .btn-group .active').data('chart-type');
    const categories = Object.keys(data.competitionStats);
    const counts = Object.values(data.competitionStats);

    let option = {
      title: {
        text: '各比赛种类参赛队伍数量统计'
      },
      tooltip: {},
    };

    if (chartType === 'bar') {
      option.xAxis = {
        type: 'category',
        data: categories
      };
      option.yAxis = {
        type: 'value'
      };
      option.series = [{
        data: counts,
        type: 'bar'
      }];
    } else if (chartType === 'pie') {
      option.series = [{
        name: '参赛队伍数量',
        type: 'pie',
        radius: '50%',
        data: categories.map((category, index) => ({
          value: counts[index],
          name: category
        }))
      }];
    }

    chart.setOption(option);
  }

  function renderTopCompetitionsChart(data) {
    const chart = echarts.init(document.getElementById('topCompetitionsChart'));
    const chartType = $('#topCompetitions .btn-group .active').data('chart-type');

    let option = {
      title: {
        text: '热门竞赛'
      },
      tooltip: {},
    };

    if (chartType === 'bar') {
      option.xAxis = {
        type: 'category',
        data: data.topCompetitionNames
      };
      option.yAxis = {
        type: 'value'
      };
      option.series = [{
        data: data.topCompetitionCounts,
        type: 'bar'
      }];
    } else if (chartType === 'pie') {
      option.series = [{
        name: '参赛队伍数量',
        type: 'pie',
        radius: '50%',
        data: data.topCompetitionNames.map((name, index) => ({
          value: data.topCompetitionCounts[index],
          name: name
        }))
      }];
    }

    chart.setOption(option);
  }

  function renderParticipantTrendChart(data) {
    const chart = echarts.init(document.getElementById('participantTrendChart'));

    // 获取日期键并排序
    let dates = Object.keys(data.participantTrend);
    dates.sort((a, b) => new Date(a) - new Date(b)); // 按日期升序排序

    const counts = dates.map(date => data.participantTrend[date]); // 按照排序后的日期获取对应人数

    chart.setOption({
      title: {
        text: '参赛人数趋势 (近一个月)'
      },
      xAxis: {
        type: 'category',
        data: dates
      },
      yAxis: {
        type: 'value'
      },
      tooltip: {},
      series: [{
        data: counts,
        type: 'line'
      }]
    });
  }
</script>
</body>
</html>
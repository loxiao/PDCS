package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.CompetitiontypesDao;
import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.dao.WorksDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Competitiontypes;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@WebServlet("/CompetitionStatsServlet")
public class CompetitionStatsServlet extends HttpServlet {
    private final CompetitionsDao competitionsDao = new CompetitionsDao();
    private final CompetitiontypesDao competitiontypesDao = new CompetitiontypesDao();
    private final ParticipantDao participantDao = new ParticipantDao();
    private final WorksDao worksDao = new WorksDao();
    private final TeamDao teamDao = new TeamDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        String chartType = request.getParameter("chartType");
        Map<String, Object> jsonData = new HashMap<>();

        if ("competitionStats".equals(chartType)) {
            jsonData = getCompetitionStatsData();
        } else if ("participantTrend".equals(chartType)) {
            String timeRange = request.getParameter("timeRange");
            jsonData = getParticipantTrendData(timeRange);
        } else if ("workSubmission".equals(chartType)) {
            jsonData = getWorkSubmissionData();
        }

        String jsonResponse = new Gson().toJson(jsonData);
        response.getWriter().write(jsonResponse);
    }

    private Map<String, Object> getCompetitionStatsData() {
        // 获取所有竞赛类型
        List<Competitiontypes> competitiontypesList = competitiontypesDao.getList();

        // 获取每个竞赛类型的参赛队伍数量
        Map<String, Integer> statsData = new HashMap<>();
        for (Competitiontypes type : competitiontypesList) {
            List<Competitions> competitionsList = competitionsDao.getByTypeId(type.getCompetitionTypeID());
            statsData.put(type.getTypeName(), competitionsList.size());
        }

        // 获取参赛队伍数量最多的 5 个竞赛
        List<Map.Entry<String, Integer>> sortedStatsData = new ArrayList<>(statsData.entrySet());
        sortedStatsData.sort(Map.Entry.<String, Integer>comparingByValue().reversed());
        List<String> topCompetitionNames = new ArrayList<>();
        List<Integer> topCompetitionCounts = new ArrayList<>();
        for (int i = 0; i < Math.min(5, sortedStatsData.size()); i++) {
            topCompetitionNames.add(sortedStatsData.get(i).getKey());
            topCompetitionCounts.add(sortedStatsData.get(i).getValue());
        }

        // 将数据添加到 JSON 中
        Map<String, Object> jsonData = new HashMap<>();
        jsonData.put("competitionStats", statsData);
        jsonData.put("topCompetitionNames", topCompetitionNames);
        jsonData.put("topCompetitionCounts", topCompetitionCounts);
        return jsonData;
    }

    private Map<String, Object> getParticipantTrendData(String timeRange) {
        List<LocalDate> dates;
        if ("month".equals(timeRange)) {
            dates = getPastMonthDates();
        } else { // 默认 year
            dates = getPastYearDates();
        }

        // 对日期进行排序
        Collections.sort(dates);

        Map<String, Integer> trendData = new HashMap<>();
        for (LocalDate date : dates) {
            int count = participantDao.getAllParticipants().size();
            trendData.put(date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")), count);
        }

        Map<String, Object> jsonData = new HashMap<>();
        jsonData.put("participantTrend", trendData);
        return jsonData;
    }

    private Map<String, Object> getWorkSubmissionData() {
        List<Competitions> competitionsList = competitionsDao.getCompetitionList();
        Map<String, Map<String, Integer>> submissionData = new HashMap<>();
        for (Competitions competition : competitionsList) {
            int workCount = worksDao.getBycompetitionidandaward(competition.getCompetitionID()).size();
            int teamCount = teamDao.getbyCompetitionID(competition.getCompetitionID(), competition.getMaxParticipants())
                    .size();
            Map<String, Integer> competitionData = new HashMap<>();
            competitionData.put("submittedWorks", workCount);
            competitionData.put("averageSubmission", teamCount > 0 ? workCount / teamCount : 0);
            submissionData.put(competition.getCompetitionName(), competitionData);
        }

        Map<String, Object> jsonData = new HashMap<>();
        jsonData.put("workSubmission", submissionData);
        return jsonData;
    }

    private List<LocalDate> getPastMonthDates() {
        List<LocalDate> dates = new ArrayList<>();
        LocalDate today = LocalDate.now();
        for (int i = 30; i >= 0; i--) {
            dates.add(today.minusDays(i));
        }
        return dates;
    }

    private List<LocalDate> getPastYearDates() {
        List<LocalDate> dates = new ArrayList<>();
        LocalDate today = LocalDate.now();
        for (int i = 365; i >= 0; i--) {
            dates.add(today.minusDays(i));
        }
        return dates;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
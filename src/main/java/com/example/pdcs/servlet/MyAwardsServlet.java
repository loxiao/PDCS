package com.example.pdcs.servlet;


import com.example.pdcs.dao.*;
import com.example.pdcs.domain.Awards;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Works;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "MyAwardsServlet", value = "/MyAwardsServlet")
public class MyAwardsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        AwardsDao awardsDao = new AwardsDao();
        Participant participant = (Participant) request.getSession().getAttribute("participant");
        List<Awards> awards = awardsDao.getByparticipantnid(participant.getParticipant_id());
        List<List<String>> awardslist = new ArrayList<>();

        // 创建DAO实例
        CompetitionsDao competitionsDao = new CompetitionsDao();
        TeamDao teamDao = new TeamDao();
        WorksDao worksDao = new WorksDao();

        for (Awards awards1 : awards) {
            try {
                Competitions competition = competitionsDao.getbyid(awards1.getCompetitionID());
                Works works = worksDao.getWorkById(awards1.getWorkID());
                String teamname = teamDao.getbyteamid(works.getTeamID()).getTeamName();
                awardslist.add(Arrays.asList(
                        competition.getCompetitionName(),
                        competition.getCompetitionTypeName(),
                        awards1.getAwardName(),
                        teamname
                ));
            } catch (Exception e) {
                // 处理异常，例如记录日志
                e.printStackTrace();
            }
        }

        request.setAttribute("awards", awardslist);
        request.getRequestDispatcher("myAwards.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

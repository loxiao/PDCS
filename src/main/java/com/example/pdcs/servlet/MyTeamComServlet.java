package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.dao.WorksDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;
import com.example.pdcs.domain.Works;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "MyTeamComServlet", value = "/MyTeamComServlet")
public class MyTeamComServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Participant participant = (Participant) request.getSession().getAttribute("participant");
        CompetitionsDao competitionsDao = new CompetitionsDao();
        List<Competitions> newcompetitionsList = competitionsDao.getnewcompetitions();
        TeamDao teamDao=new TeamDao();
        WorksDao worksDao=new WorksDao();
        List<Competitions> competitionsList=new ArrayList<>();
        for(Competitions competitions:newcompetitionsList){
            Teams teams=teamDao.getcaptianteam(competitions.getCompetitionID(),participant.getParticipant_id());
            if(teams!=null){
                Works works=worksDao.getbyteamid(teams.getTeamID());
                if(works==null){
                    competitionsList.add(competitions);
                }
            }
        }
        request.getSession().setAttribute("competitionsList",competitionsList);
        request.getRequestDispatcher("myTeamWork.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;
import com.mysql.cj.PreparedQuery;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
@WebServlet(name = "MyTeamServlet", value = "/MyTeamServlet")
public class MyTeamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CompetitionsDao competitionsDao=new CompetitionsDao();
        List<Competitions> competitionsList=competitionsDao.getnewcompetitions();
        Participant participant=(Participant) request.getSession().getAttribute("participant");
        List<Teams> captianteams=new ArrayList<>();
        TeamDao teamDao=new TeamDao();
        for(Competitions competitions:competitionsList){
            if(teamDao.getcaptianteam(competitions.getCompetitionID(),participant.getParticipant_id())!=null){
                captianteams.add(teamDao.getcaptianteam(competitions.getCompetitionID(),participant.getParticipant_id()));
            }
        }
        request.getSession().setAttribute("captianteams",captianteams);
        List<List<String>> nameandidlist=new ArrayList<>();
        for(Teams teams:captianteams){
            ParticipantDao participantDao=new ParticipantDao();
            if(teams.getMember1ID()!=null){
                Participant participant1=participantDao.getbyParticipant(teams.getMember1ID());
                Competitions competitions=competitionsDao.getbyid(teams.getCompetitionID());
                nameandidlist.add(Arrays.asList(competitions.getCompetitionTypeName(),competitions.getCompetitionName(),teams.getTeamName(),participant1.getParticipant_name(),String.valueOf(teams.getTeamID()),String.valueOf(teams.getMember1ID())));
            }
            if(teams.getMember2ID()!=null){
                Participant participant1=participantDao.getbyParticipant(teams.getMember1ID());
                Competitions competitions=competitionsDao.getbyid(teams.getCompetitionID());
                nameandidlist.add(Arrays.asList(competitions.getCompetitionTypeName(),competitions.getCompetitionName(),teams.getTeamName(),participant1.getParticipant_name(),String.valueOf(teams.getTeamID()),String.valueOf(teams.getMember2ID())));
            }
            if(teams.getMember3ID()!=null){
                Participant participant1=participantDao.getbyParticipant(teams.getMember1ID());
                Competitions competitions=competitionsDao.getbyid(teams.getCompetitionID());
                nameandidlist.add(Arrays.asList(competitions.getCompetitionTypeName(),competitions.getCompetitionName(),teams.getTeamName(),participant1.getParticipant_name(),String.valueOf(teams.getTeamID()),String.valueOf(teams.getMember3ID())));
            }
        }
        request.getSession().setAttribute("nameandidlist",nameandidlist);
        response.sendRedirect(request.getContextPath()+"/myCompetition.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

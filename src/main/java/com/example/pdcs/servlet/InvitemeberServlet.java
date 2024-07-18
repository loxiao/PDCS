package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "InvitemeberServlet", value = "/InvitemeberServlet")
public class InvitemeberServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CompetitionsDao competitionsDao=new CompetitionsDao();
        List<Competitions> competitionsList=competitionsDao.getnewcompetitions();
        List<Teams> teamsList=new ArrayList<>();
        Participant user= (Participant) request.getSession().getAttribute("participant");
        TeamDao teamDao=new TeamDao();
        for(Competitions competitions:competitionsList){
            Teams teams=teamDao.getByCaptainID(user.getParticipant_id(), competitions.getCompetitionID());
            if(teams!=null){
                teamsList.add(teams);
            }
        }

        request.getSession().setAttribute("emptyTeams",teamsList);
        response.sendRedirect("team-invite.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

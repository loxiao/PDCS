package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.ParticipantDao;
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

@WebServlet(name = "WorkDetailsServlet", value = "/WorkDetailsServlet")
public class WorkDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String workId = request.getParameter("workId");
        WorksDao worksDao = new WorksDao();
        Works work = worksDao.getWorkById(Integer.parseInt(workId));
        request.setAttribute("work",work);
        CompetitionsDao competitionsDao=new CompetitionsDao();
        Competitions competitions=competitionsDao.getbyid(work.getCompetitionID());
        TeamDao teamDao=new TeamDao();
        Teams teams=teamDao.getbyteamid(work.getTeamID());
        ParticipantDao participantDao=new ParticipantDao();
        Participant participant=participantDao.getbyParticipant(teams.getCaptainID());
        String captainname=participant.getParticipant_name();
        String membername="";
        if(teams.getMember1ID()!=null){
            membername=membername+participantDao.getbyParticipant(teams.getMember1ID()).getParticipant_name()+" ";
        }
        if(teams.getMember2ID()!=null){
            membername=membername+participantDao.getbyParticipant(teams.getMember2ID()).getParticipant_name()+" ";
        }
        if(teams.getMember3ID()!=null){
            membername=membername+participantDao.getbyParticipant(teams.getMember3ID()).getParticipant_name()+" ";
        }
        request.getSession().setAttribute("work",work);
        request.getSession().setAttribute("teams",teams);
        request.getSession().setAttribute("membername",membername);
        request.getSession().setAttribute("captainname",captainname);
        request.getSession().setAttribute("competitions",competitions);
        request.getRequestDispatcher("/workDetails.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

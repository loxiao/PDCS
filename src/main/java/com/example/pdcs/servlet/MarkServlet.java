package com.example.pdcs.servlet;


import com.example.pdcs.dao.*;
import com.example.pdcs.domain.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "MarkServlet", value = "/MarkServlet")
public class MarkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String workId = request.getParameter("workId");
        WorksDao worksDao = new WorksDao();
        AwardsDao awardsDao=new AwardsDao();
        Awards awards=awardsDao.getbyworkid(Integer.parseInt(workId));
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
        request.getSession().setAttribute("awards",awards);
        request.getSession().setAttribute("work",work);
        request.getSession().setAttribute("teams",teams);
        request.getSession().setAttribute("membername",membername);
        request.getSession().setAttribute("captainname",captainname);
        request.getSession().setAttribute("competitions",competitions);
        request.getRequestDispatcher("/mark.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

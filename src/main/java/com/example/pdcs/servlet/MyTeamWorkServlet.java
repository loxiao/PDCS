package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.CompetitiontypesDao;
import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Competitiontypes;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyTeamWorkServlet", value = "/MyTeamWorkServlet")
public class MyTeamWorkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int competitionID = Integer.parseInt(request.getParameter("competitionID"));
        CompetitionsDao competitionsDao = new CompetitionsDao();
        Competitions competitions = competitionsDao.getbyid(competitionID);
        request.getSession().setAttribute("competitionWork",competitions);
        Participant participant = (Participant) request.getSession().getAttribute("participant");
        TeamDao teamDao = new TeamDao();
        request.getSession().setAttribute("team",teamDao.getcaptianteam(competitionID,participant.getParticipant_id()));
        response.sendRedirect("uploadWork.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

package com.example.pdcs.servlet;

import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyTeamServlet", value = "/MyTeamServlet")
public class MyTeamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Participant participant = (Participant) request.getSession().getAttribute("participant");
        String id = String.valueOf(participant.getParticipant_id());
        int pid = Integer.parseInt(id);
        TeamDao teamDao = new TeamDao();
        List<Teams> teams = teamDao.getByPID(pid);
        request.setAttribute("teams",teams);
        request.getRequestDispatcher("myCompetitions.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

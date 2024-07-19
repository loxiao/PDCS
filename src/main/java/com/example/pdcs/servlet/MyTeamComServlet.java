package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyTeamComServlet", value = "/MyTeamComServlet")
public class MyTeamComServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Participant participant = (Participant) request.getSession().getAttribute("participant");
        CompetitionsDao competitionsDao = new CompetitionsDao();
        List<Competitions> competitionsList = competitionsDao.getcaptaincompetition(participant.getParticipant_id());
        request.getSession().setAttribute("competitionsList",competitionsList);
        request.getRequestDispatcher("myTeamWork.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

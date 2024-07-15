package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.WorksDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Works;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CompetitionsListServlet", value = "/CompetitionsListServlet")
public class CompetitionsListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CompetitionsDao competitionsDao = new CompetitionsDao();
        List<Competitions> competitionsList = competitionsDao.getnewcompetitions();
        request.getSession().setAttribute("competitionsList",competitionsList);
        request.getRequestDispatcher("myEntry.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

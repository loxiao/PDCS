package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.CompetitiontypesDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Competitiontypes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllCompetitionListServlet", value = "/AllCompetitionListServlet")
public class AllCompetitionListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CompetitionsDao competitionsDao = new CompetitionsDao();
        CompetitiontypesDao competitiontypesDao = new CompetitiontypesDao();
        String Typeid = request.getParameter("TypeId");
        if (Typeid != null){
            int id = Integer.parseInt(Typeid);
            List<Competitions> competitionsList = competitionsDao.getAllCompetitionsByTypeOrAll(id);
            request.getSession().setAttribute("competitionsList",competitionsList);
        }else {
            List<Competitions> competitionsList = competitionsDao.getAllCompetitionsByTypeOrAll(0);
            request.getSession().setAttribute("competitionsList",competitionsList);
        }
        List<Competitiontypes> competitiontypes = competitiontypesDao.getList();
        request.getSession().setAttribute("Types",competitiontypes);
        request.getRequestDispatcher("competitionList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

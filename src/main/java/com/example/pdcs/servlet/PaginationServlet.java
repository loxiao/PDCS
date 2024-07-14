package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.domain.Competitions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "PaginationServlet", value = "/PaginationServlet")
public class PaginationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page= Integer.parseInt(request.getParameter("page"));
        CompetitionsDao competitionsDao = new CompetitionsDao();
        List<Competitions> competitions = competitionsDao.getCompetitionList();
        int i=0;
        List<Competitions> newCompetitions=new ArrayList<>();
        for (Competitions item:competitions) {
            i++;
            if(i<=page*15&& i>(page-1)*15){
                newCompetitions.add(item);
            }
        }
        request.getSession().setAttribute("newcompetitionAll",newCompetitions);
        response.sendRedirect(request.getContextPath()+"/competition.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

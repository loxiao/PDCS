package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.domain.Competitions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NewsLIstServlet", value = "/NewsLIstServlet")
public class NewsLIstServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        CompetitionsDao competitionsDao=new CompetitionsDao();
        Competitions competitions=competitionsDao.getbyid(id);
        request.getSession().setAttribute("competitions",competitions);
        response.sendRedirect(request.getContextPath()+"/competition.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }
}

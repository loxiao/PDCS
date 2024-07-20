package com.example.pdcs.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DownImageServlet", value = "/DownImageServlet")
public class DownImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String competitionType = request.getParameter("competitionType");
        String competitionName = request.getParameter("competitionName");
        String teamName = request.getParameter("teamName");
        String teamAward = request.getParameter("teamAward");
        request.setAttribute("competitionType", competitionType);
        request.setAttribute("competitionName", competitionName);
        request.setAttribute("teamName", teamName);
        request.setAttribute("teamAward", teamAward);
        request.getRequestDispatcher("downImage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

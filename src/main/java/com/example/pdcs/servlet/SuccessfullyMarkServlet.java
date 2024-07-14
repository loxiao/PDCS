package com.example.pdcs.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SuccessfullyMarkServlet", value = "/SuccessfullyMarkServlet")
public class SuccessfullyMarkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String score = request.getParameter("score");
        String message = request.getParameter("message");
        HttpSession session = request.getSession();
        session.setAttribute("score",score);
        session.setAttribute("message",message);
        request.getRequestDispatcher("/judges.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

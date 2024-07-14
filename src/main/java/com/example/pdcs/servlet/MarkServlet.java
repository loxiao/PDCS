package com.example.pdcs.servlet;


import com.example.pdcs.dao.WorksDao;
import com.example.pdcs.domain.Works;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MarkServlet", value = "/MarkServlet")
public class MarkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String workId = request.getParameter("workId");
        WorksDao worksDao = new WorksDao();
        Works work = worksDao.getWorkById(Integer.parseInt(workId));
        request.setAttribute("work",work);
        request.getRequestDispatcher("/mark.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

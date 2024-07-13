package com.example.pdcs.servlet;

import com.example.pdcs.dao.WorksDao;
import com.example.pdcs.domain.Works;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "WorksServlet", value = "/WorksServlet")
public class WorksServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        WorksDao worksDao = new WorksDao();
            List<Works> worksList = worksDao.getWorks();
            request.getSession().setAttribute("worksList",worksList);
//            for(Works works:worksList){
//
//            }
            request.getRequestDispatcher("work.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

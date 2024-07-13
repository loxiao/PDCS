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
        System.out.println(worksList); // 打印 worksList 内容进行调试
        HttpSession session = request.getSession();
        session.setAttribute("worksList", worksList);
        request.getRequestDispatcher("work.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

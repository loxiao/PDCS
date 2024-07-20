package com.example.pdcs.servlet;

import com.example.pdcs.dao.WorksDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "WorkUploadServletServlet", value = "/WorkUploadServletServlet")
public class WorkUploadServletServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int competitionID = Integer.parseInt(request.getParameter("competitionID"));
        int   tid = Integer.parseInt(request.getParameter("tid"));
        String title = request.getParameter("title");
        String path = request.getParameter("photo");
        WorksDao worksDao = new WorksDao();
        worksDao.addworks(competitionID,title,tid,path,0);
        request.getSession().setAttribute("wsg","上传作品成功");
        response.sendRedirect("uploadWork.jsp");
    }
}

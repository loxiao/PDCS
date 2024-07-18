package com.example.pdcs.servlet;

import com.example.pdcs.dao.WorksDao;
import com.example.pdcs.domain.Works;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateLikesServlet", value = "/UpdateLikesServlet")
public class UpdateLikesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int likesCount = Integer.parseInt(request.getParameter("Likes"));
        int workId = Integer.parseInt(request.getParameter("Id"));
        WorksDao worksDao = new WorksDao();
        Works works = worksDao.updateLikes(likesCount, workId);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{\"likesCount\": " + works.getLikes() + "}"); // 返回JSON格式的点赞数
        out.flush();
    }
}

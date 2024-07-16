package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.domain.Competitions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //假设你从请求中获取了搜索关键词
        request.setCharacterEncoding("utf-8");
        String searchKeyword = request.getParameter("Search");
        CompetitionsDao competitionsDao = new CompetitionsDao();
        // 调用搜索方法
        List<Competitions> competitionsList = competitionsDao.searchCompetitionsByName(searchKeyword);

        // 将搜索结果设置到请求属性中，以便JSP页面可以访问
        request.setAttribute("competitionsList", competitionsList);
        request.getRequestDispatcher("/myEntry.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

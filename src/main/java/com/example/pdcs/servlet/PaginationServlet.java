package com.example.pdcs.servlet;

import com.example.pdcs.dao.AwardsDao;
import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.domain.Awards;
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
        String type=request.getParameter("more");
        CompetitionsDao competitionsDao = new CompetitionsDao();
        AwardsDao awardsDao = new AwardsDao();
        String url="";
        //点击赛more进入
        List<Competitions> competitionList;
        if(type.equals("competition")){
            url="/competition.jsp";
            competitionList = competitionsDao.getCompetitionList();
        }else{
            url="/news-detail.jsp";
            List<Awards> awardsList = awardsDao.getall();
            competitionList = awardsList.stream()
                    .map(Awards::getCompetitionID) // 将Awards对象映射为其竞赛ID
                    .map(id -> competitionsDao.getbyid(id)) // 使用竞赛ID查询Competitions对象
                    .collect(Collectors.toList()); // 收集结果到List中
        }
        //限制15条
        int i=0;
        List<Competitions> newCompetitions=new ArrayList<>();
        for (Competitions item:competitionList) {
            i++;
            if(i<=page*15&& i>(page-1)*15){
                newCompetitions.add(item);
            }
        }

        int pageCount = (competitionList.size() + 15 - 1) / 15; // 向上取整
        List<Integer> pageNumbers = new ArrayList<>();
        for (int j = 1; j <= pageCount; j++) {
            pageNumbers.add(j);
        }
        request.getSession().setAttribute("pageCount",pageNumbers);
        request.getSession().setAttribute("tsg","more");
        request.getSession().setAttribute("newcompetitionAll",newCompetitions);
        response.sendRedirect(request.getContextPath()+url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

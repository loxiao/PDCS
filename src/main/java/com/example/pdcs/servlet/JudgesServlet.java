package com.example.pdcs.servlet;

import com.example.pdcs.dao.*;
import com.example.pdcs.domain.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "JudgesServlet", value = "/JudgesServlet")
public class JudgesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        WorksDao worksDao = new WorksDao();
        List<Works> works = worksDao.getWorks();
        List<List<Object>> workslist = new ArrayList<>();
        // 创建DAO实例
        CompetitionsDao competitionsDao = new CompetitionsDao();
        TeamDao teamDao = new TeamDao();
        for (Works works1 : works) {
            try {
                Competitions competition = competitionsDao.getbyid(works1.getCompetitionID());
                Teams team = teamDao.getbyteamid(works1.getTeamID());
                workslist.add(Arrays.asList(
                        works1.getWorkID(),
                        works1.getWorkName(),
                        team.getTeamName(),
                        competition.getCompetitionTypeName(),
                        works1.getScore()
                ));
            } catch (Exception e) {
                // 处理异常，例如记录日志
                e.printStackTrace();
            }
        }
        request.getSession().setAttribute("worksList",workslist);
        request.getRequestDispatcher("judges.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

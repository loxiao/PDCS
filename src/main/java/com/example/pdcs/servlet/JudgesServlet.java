package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.dao.WorksDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Teams;
import com.example.pdcs.domain.Works;

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
        WorksDao worksDao = new WorksDao();
        int cid=Integer.parseInt(request.getParameter("id"));
        List<Works> worksList=worksDao.getjudgeworkbyCompetitionID(cid);
        List<List<String>> JudgeWorkList=new ArrayList<>();
        TeamDao teamDao=new TeamDao();
        CompetitionsDao competitionsDao=new CompetitionsDao();
        String JudgeCompetitionName="";
        for(Works works:worksList){
            Teams teams=teamDao.getbyteamid(works.getTeamID());
            Competitions competitions=competitionsDao.getbyid(works.getCompetitionID());
            JudgeCompetitionName=competitions.getCompetitionName();
            JudgeWorkList.add(Arrays.asList(works.getWorkName(),teams.getTeamName(),competitions.getCompetitionTypeName(),String.valueOf(works.getScore()),String.valueOf(works.getWorkID())));
        }
        request.getSession().setAttribute("worksList",worksList);
        request.getSession().setAttribute("JudgeCompetitionName",JudgeCompetitionName);
        request.getSession().setAttribute("JudgeWorkList",JudgeWorkList);
        response.sendRedirect(request.getContextPath()+"/judges.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

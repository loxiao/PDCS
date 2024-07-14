package com.example.pdcs.servlet;

import com.example.pdcs.dao.AwardsDao;
import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.dao.WorksDao;
import com.example.pdcs.domain.Awards;
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

@WebServlet(name = "WorksServlet", value = "/WorksServlet")
public class WorksServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int cid=Integer.parseInt(request.getParameter("id"));
       if(cid==0){//所有竞赛
           WorksDao worksDao=new WorksDao();
           List<Works> worksList=worksDao.getWorks();//获取所有获奖作品
           CompetitionsDao competitionsDao=new CompetitionsDao();
           TeamDao teamDao=new TeamDao();
           AwardsDao awardsDao=new AwardsDao();
           List<List<String>> combinedList = new ArrayList<>();
           request.getSession().setAttribute("cname","");
           for(Works works:worksList){
               Competitions competitions=competitionsDao.getbyid(works.getCompetitionID());
               Teams teams=teamDao.getbyteamid(works.getTeamID());
               Awards awards=awardsDao.getbyworkid(works.getWorkID());
               combinedList.add(Arrays.asList(works.getWorkName(),teams.getTeamName(),competitions.getCompetitionTypeName(),awards.getAwardName(),String.valueOf(works.getWorkID())));
           }
           request.getSession().setAttribute("combinedList",combinedList);
           response.sendRedirect(request.getContextPath()+"/work.jsp");
       }
       else {
           WorksDao worksDao=new WorksDao();
           List<Works> worksList=worksDao.getBycompetitionidandaward(cid);
           CompetitionsDao competitionsDao=new CompetitionsDao();
           TeamDao teamDao=new TeamDao();
           AwardsDao awardsDao=new AwardsDao();
           List<List<String>> combinedList = new ArrayList<>();
           Competitions competitions=competitionsDao.getbyid(cid);
           request.getSession().setAttribute("cname",competitions.getCompetitionName());
           for(Works works:worksList){
               Teams teams=teamDao.getbyteamid(works.getTeamID());
               Awards awards=awardsDao.getbyworkid(works.getWorkID());
               combinedList.add(Arrays.asList(works.getWorkName(),teams.getTeamName(),competitions.getCompetitionTypeName(),awards.getAwardName(),String.valueOf(works.getWorkID())));
           }
           request.getSession().setAttribute("combinedList",combinedList);
           response.sendRedirect(request.getContextPath()+"/work.jsp");
       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

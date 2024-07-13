package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.CompetitiontypesDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Competitiontypes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "IndexServlet", value = "/IndexServlet")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CompetitionsDao competitionsDao=new CompetitionsDao();//获取最新竞赛dao
        List<Competitions> competitions=competitionsDao.getnewcompetitions();//获取还未结束报名的
        if(competitions.size()>10){//那前10个
            List<Competitions> newcompetitions=new ArrayList<>();
            int i=0;
            for(Competitions competitions1:competitions){
                newcompetitions.add(competitions1);
                i++;
                if(i==10){
                    break;
                }
            }
            request.getSession().setAttribute("newcompetitions",newcompetitions);
        }
        else{
            request.getSession().setAttribute("newcompetitions",competitions);
        }
        competitions=competitionsDao.getoldcompetition();//获取结束竞赛已颁奖的竞赛
        if(competitions.size()>10){//那前10个
            List<Competitions> oldcompetitions=new ArrayList<>();
            int i=0;
            for(Competitions competitions1:competitions){
                oldcompetitions.add(competitions1);
                i++;
                if(i==10){
                    break;
                }
            }
            request.getSession().setAttribute("oldcompetitions",oldcompetitions);
        }
        else{
            request.getSession().setAttribute("oldcompetitions",competitions);
        }

        /*竞赛类别*/
        CompetitiontypesDao competitiontypesDao=new CompetitiontypesDao();
        List<Competitiontypes> competitiontypesList=competitiontypesDao.getList();
        request.getSession().setAttribute("competitiontypesList",competitiontypesList);

        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }
}

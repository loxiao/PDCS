package com.example.pdcs.servlet;

import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveMemberServlet", value = "/RemoveMemberServlet")
public class RemoveMemberServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tid=Integer.parseInt(request.getParameter("tid"));
        Integer pid=Integer.parseInt(request.getParameter("pid"));
        TeamDao teamDao=new TeamDao();
        Teams teams=teamDao.getbyteamid(tid);
        if(teams.getMember1ID()==pid){
            teamDao.addmember1(tid,null);
        }
        if(teams.getMember2ID()==pid){
            teamDao.addmember2(tid,null);
        }
        if(teams.getMember3ID()==pid){
            teamDao.addmember3(tid,null);
        }
        request.getRequestDispatcher("MyTeamServlet").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

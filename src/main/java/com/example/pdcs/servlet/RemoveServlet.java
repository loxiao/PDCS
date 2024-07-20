package com.example.pdcs.servlet;

import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveServlet", value = "/RemoveServlet")
public class RemoveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tid=Integer.parseInt(request.getParameter("tid"));
        Participant participant=(Participant) request.getSession().getAttribute("participant");
        Integer pid=participant.getParticipant_id();
        TeamDao teamDao=new TeamDao();
        Teams teams=teamDao.getbyteamid(tid);
        if(teams.getMember1ID()==pid){
            teamDao.addmember1(tid,null);
        }
        else if(teams.getMember2ID()==pid){
            teamDao.addmember2(tid,null);
        }
        else if(teams.getMember3ID()==pid){
            teamDao.addmember3(tid,null);
        }
        request.getRequestDispatcher("MyTeamServlet").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

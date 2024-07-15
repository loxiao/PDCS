package com.example.pdcs.servlet;

import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CreatteamServlet", value = "/CreatteamServlet")
public class CreatteamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int cid=Integer.parseInt(request.getParameter("id"));
        String tname=request.getParameter("teamName");
        if(tname.isEmpty()){
            request.getSession().setAttribute("msg","创建失败，队伍名称为必填项！");
        }
       else {
            Participant participant=(Participant) request.getSession().getAttribute("participant");
            TeamDao teamDao=new TeamDao();
            if(teamDao.addteams(participant.getParticipant_id(),cid,tname)){
             response.sendRedirect(request.getContextPath()+"/competition.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }
}

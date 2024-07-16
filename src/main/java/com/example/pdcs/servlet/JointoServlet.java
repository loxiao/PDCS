package com.example.pdcs.servlet;

import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Participant_messages;
import com.example.pdcs.domain.Teams;
import com.example.pdcs.dao.participant_msgDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "JointoServlet", value = "/JointoServlet")
public class JointoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tid=Integer.parseInt(request.getParameter("id"));
        Participant participant=(Participant) request.getSession().getAttribute("participant");
        TeamDao teamDao=new TeamDao();
        Teams teams=teamDao.getbyteamid(tid);
        participant_msgDao participant_msgDao=new participant_msgDao();
        if(participant_msgDao.addmsg(participant.getParticipant_id(),tid,0,participant.getParticipant_name(),teams.getTeamName(),teams.getCaptainID())){
            request.getSession().setAttribute("msg","已提交加入申请，等待队长同意");
            response.sendRedirect(request.getContextPath()+"/addTeam.jsp");
        }else {
            request.getSession().setAttribute("msg","加入失败，请稍后再试！");
            response.sendRedirect(request.getContextPath()+"/addTeam.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

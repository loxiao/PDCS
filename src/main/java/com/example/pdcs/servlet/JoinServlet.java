package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "JoinServlet", value = "/JoinServlet")
public class JoinServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Participant participant = (Participant) request.getSession().getAttribute("participant");
        request.getSession().setAttribute("msg", "");
        if (participant == null) {
            request.getSession().setAttribute("msg", "非参赛人员不得参赛！");
            response.sendRedirect(request.getContextPath() + "/competition.jsp");
            return;
        }

        int cid = Integer.parseInt(request.getParameter("id"));
        TeamDao teamDao = new TeamDao();
        Teams teams = teamDao.getbycompetitionidandpeopleid(participant.getParticipant_id(), cid);
        if (teams == null) {
            CompetitionsDao competitionsDao=new CompetitionsDao();
            Competitions competitions=competitionsDao.getbyid(cid);
            List<Teams> teamsList=teamDao.getbyCompetitionID(competitions.getCompetitionID(),competitions.getMaxParticipants());
            request.getSession().setAttribute("teamsList",teamsList);
            response.sendRedirect(request.getContextPath()+"/addTeam.jsp");
        } else {
            request.getSession().setAttribute("msg", "创建失败，已有竞赛队伍");
            response.sendRedirect(request.getContextPath() + "/competition.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

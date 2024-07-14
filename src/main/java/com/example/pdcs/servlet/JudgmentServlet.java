package com.example.pdcs.servlet;

import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "JudgmentServlet", value = "/JudgmentServlet")
public class JudgmentServlet extends HttpServlet {
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
            response.sendRedirect(request.getContextPath() + "/createTeam.jsp?id=" + cid);
        } else {
            request.getSession().setAttribute("msg", "创建失败，已有竞赛队伍");
            response.sendRedirect(request.getContextPath() + "/competition.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Participant participant = (Participant) request.getSession().getAttribute("participant");
        if (participant == null) {
            request.getSession().setAttribute("msg", "非参赛人员不得参赛！");
            response.sendRedirect(request.getContextPath() + "/competition.jsp");
            return;
        }

        String captainName = request.getParameter("captainName");
        String teamName = request.getParameter("teamName");
        int cid = Integer.parseInt(request.getParameter("id"));

        if (captainName.isEmpty() || teamName.isEmpty()) {
            // 处理错误：队长姓名或队伍名称为空
            request.getSession().setAttribute("msg", "队长名字和队伍名字不能为空！");
            response.sendRedirect(request.getContextPath() + "/CreateTeam.jsp?id=" + cid);
            return;
        }

        TeamDao teamDao = new TeamDao();
        boolean success = teamDao.addteams(participant.getParticipant_id(), cid, teamName);

        if (success) {
            request.getSession().setAttribute("msg", "创建成功");
        } else {
            request.getSession().setAttribute("msg", "创建失败，请重试");
        }
        response.sendRedirect(request.getContextPath() + "/competition.jsp");
    }
}
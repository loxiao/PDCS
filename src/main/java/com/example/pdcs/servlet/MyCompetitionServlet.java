package com.example.pdcs.servlet;

import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

@WebServlet(name = "MyCompetitionServlet", value = "/MyCompetitionServlet")
public class MyCompetitionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 假设你有一个DAO类，用于数据库操作
        TeamDao teamDao = new TeamDao();
        Participant participant = (Participant) request.getSession().getAttribute("participant");
        // 获取当前用户ID，这里假设你已经从会话中获取了用户ID
        int Id = participant.getParticipant_id();

        // 根据用户ID获取用户创建的队伍和加入的队伍
        List<Teams> myTeams = teamDao.getbyCaptainID(Id);
        List<Teams> joinedTeams = teamDao.getbyParticipantID(Id);

        // 将队伍信息设置为请求属性
        request.setAttribute("myTeams", myTeams);
        request.setAttribute("joinedTeams", joinedTeams);

        // 转发请求到JSP页面
        request.getRequestDispatcher("/myCompetition.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

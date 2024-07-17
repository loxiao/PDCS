package com.example.pdcs.servlet;

import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.dao.Participant_msgDao;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MessageServlet", value = "/MessageServlet")
public class MessageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int teamID= Integer.parseInt(request.getParameter("teamID"));
        String member= request.getParameter("member");
        String teamName=request.getParameter("teamName");
        Participant participant= (Participant) request.getSession().getAttribute("participant");
        ParticipantDao participantDao=new ParticipantDao();
        int memberId=participantDao.getbyNumber(member);
        Participant_msgDao msgDao=new Participant_msgDao();
        if(msgDao.addmsg(participant.getParticipant_id(),teamID,1,participant.getParticipant_name(),teamName,memberId)){
            request.getSession().setAttribute("jsg","邀请成功");
        }else{
            request.getSession().setAttribute("jsg","邀请失败");
        }
        response.sendRedirect("team-invite.jsp");
    }
}

package com.example.pdcs.servlet;

import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "InvitemeberServlet", value = "/InvitemeberServlet")
public class InvitemeberServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Participant user= (Participant) request.getSession().getAttribute("participant");
        TeamDao teamDao=new TeamDao();
        List<Teams> teamsList=teamDao.getByCaptainID(user.getParticipant_id());
        request.getSession().setAttribute("emptyTeams",teamsList);
        response.sendRedirect("team-invite.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

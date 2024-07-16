package com.example.pdcs.servlet;

import com.example.pdcs.dao.Participant_msgDao;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Participant_messages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PmsgServlet", value = "/PmsgServlet")
public class PmsgServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Participant participant=(Participant) request.getSession().getAttribute("participant");
        Participant_msgDao participant_msgDao=new Participant_msgDao();
        List<Participant_messages> participant_messagesList=participant_msgDao.getBtrecipient_id(participant.getParticipant_id());
        request.getSession().setAttribute("participant_messagesList",participant_messagesList);
        response.sendRedirect(request.getContextPath()+"/message.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

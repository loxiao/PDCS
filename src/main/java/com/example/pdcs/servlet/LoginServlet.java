package com.example.pdcs.servlet;

import com.example.pdcs.dao.AdminDao;
import com.example.pdcs.dao.JudgesDao;
import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.dao.Participant_msgDao;
import com.example.pdcs.domain.Admin;
import com.example.pdcs.domain.Judges;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("passwordIn");
        String role = request.getParameter("role");

        ParticipantDao participantDao = new ParticipantDao();
        AdminDao adminDao = new AdminDao();
        JudgesDao judgesDao = new JudgesDao();

        try {
            Participant participant = participantDao.getbynumberandpwd(email, password);
            Admin admin = adminDao.getadmin(email, password);
            Judges judges = judgesDao.getbyidandpwd(email, password);

            if (role == null) {
                // 登录失败
                request.setAttribute("msg", "登录失败，未选择身份");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // 登录成功，根据角色重定向到相应页面
            HttpSession session = request.getSession();
            session.setAttribute("role", role);

            //是否有消息未读
//            Participant_msgDao participant_msgDao = new Participant_msgDao();
//            if (participant_msgDao.getBtrecipient_id(participant.getParticipant_id()).size() != 0){
//                session.setAttribute("messages", "您有未读消息");
//            }

            if (participant != null && "participant".equals(role)) {
                session.setAttribute("participant", participant);
                session.setAttribute("name", participant.getParticipant_name());
               request.getRequestDispatcher("IndexServlet").forward(request,response);
            } else if (admin != null && "admin".equals(role)) {
                session.setAttribute("admin", admin);
                session.setAttribute("name", admin.getAdminName());
                request.getRequestDispatcher("IndexServlet").forward(request,response);
            } else if (judges != null && "judge".equals(role)) {
                session.setAttribute("judges", judges);
                session.setAttribute("name", judges.getJudgesName());
                request.getRequestDispatcher("IndexServlet").forward(request,response);
            } else {
                // 登录失败
                request.setAttribute("msg", "登录失败，用户名或密码错误或身份选择错误");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "登录失败，服务器错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
package com.example.pdcs.servlet;

import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String email = request.getParameter("email");
        String password = request.getParameter("passwordIn");
        String role = request.getParameter("role");
        ParticipantDao participantDao = new ParticipantDao();
        try {
            Participant participant = participantDao.getbynumberandpwd(email, password);
            if (participant != null) {
                // 登录成功，根据角色重定向到相应页面
                HttpSession session = request.getSession();
                session.setAttribute("participant", participant);
                session.setAttribute("role", role);

                if ("participant".equals(role)) {
                    response.sendRedirect("participantPage.jsp");
                } else if ("judge".equals(role)) {
                    response.sendRedirect("judgePage.jsp");
                } else if ("admin".equals(role)) {
                    response.sendRedirect("adminPage.jsp");
                } else {
                    response.sendRedirect("login.jsp");
                }
            } else {
                // 登录失败
                request.setAttribute("msg", "登录失败，用户名或密码错误");
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
        doGet(request,response);
    }
}

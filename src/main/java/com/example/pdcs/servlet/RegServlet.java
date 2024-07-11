package com.example.pdcs.servlet;

import com.example.pdcs.dao.ParticipantDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegServlet", value = "/RegServlet")
public class RegServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String number = request.getParameter("email");
        String pwd = request.getParameter("password");
        String address = request.getParameter("address");
        ParticipantDao participantDao = new ParticipantDao();
        try {
            boolean success = participantDao.addParticipant(name, number, pwd, address);
            if (success) {
                // 注册成功，重定向到登录页面
                response.sendRedirect("login.jsp");
            } else {
                // 注册失败
                request.setAttribute("msg", "注册失败，可能是因为编号已存在");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "注册失败，服务器错误");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

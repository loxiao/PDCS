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

        // 检查输入是否为空
        if (name == null || name.trim().isEmpty() ||
                number == null || number.trim().isEmpty() ||
                pwd == null || pwd.trim().isEmpty() ||
                address == null || address.trim().isEmpty()) {
            // 如果任何一个输入为空，设置错误消息并转发回注册页面
            request.setAttribute("msg", "所有字段都是必填的，请确保没有字段为空。");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            ParticipantDao participantDao = new ParticipantDao();
            try {
                boolean success = participantDao.addParticipant(name, number, pwd, address);
                if (success) {
                    // 注册成功，重定向到登录页面
                    response.sendRedirect("login.jsp");
                } else {
                    // 注册失败
                    request.setAttribute("msg", "注册失败，可能是因为邮箱已存在");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("msg", "注册失败，服务器错误");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

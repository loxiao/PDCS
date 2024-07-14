package com.example.pdcs.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 检查管理员是否已登录
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            // 管理员未登录，跳转到登录页面
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // 管理员已登录，跳转到管理员首页 (例如 admin-edit.jsp)
        response.sendRedirect(request.getContextPath() + "/admin-edit.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
package com.example.pdcs.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("msg","");
        //1.清除用户Session内容
        if(request.getSession().getAttribute("participant") != null){
            request.getSession().invalidate();
        }
        if(request.getSession().getAttribute("admin") != null){
            request.getSession().invalidate();
        }
        if(request.getSession().getAttribute("judges") != null){
            request.getSession().invalidate();
        }
        //2.重定向首页
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

package com.example.pdcs.servlet;

import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PersonalCenterServlet", value = "/PersonalCenterServlet")
public class PersonalCenterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 检查用户是否已登录
        HttpSession session = request.getSession();
        Object participantObj = session.getAttribute("participant");

        if (participantObj != null && participantObj instanceof Participant) {
            // 用户已登录，获取用户信息
            Participant participant = (Participant) participantObj;

            // 将用户信息传递给个人中心页面
            request.setAttribute("participant", participant);

            // 跳转到个人中心页面
            request.getRequestDispatcher("personalCenter.jsp").forward(request, response);
        } else {
            // 用户未登录，提示并跳转到登录页面
            request.setAttribute("msg", "请先登录！");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
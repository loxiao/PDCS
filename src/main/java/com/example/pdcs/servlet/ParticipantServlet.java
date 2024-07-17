package com.example.pdcs.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ParticipantServlet", value = "/ParticipantServlet")
public class ParticipantServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 判断 Session 中是否存在 participant 对象
        if (request.getSession().getAttribute("participant") != null) {
            // 获取请求参数 viewName
            String viewName = request.getParameter("view");

            // 根据 viewName 跳转到不同的 JSP 页面
            if (viewName != null) {
                switch (viewName) {
                    case "participantInfo":
                        response.sendRedirect(request.getContextPath() + "/participantInfo.jsp");
                        break;
                    case "myEntry":
                        response.sendRedirect(request.getContextPath() + "/CompetitionsListServlet");
                        break;
                    case "myCompetition":
                        response.sendRedirect(request.getContextPath() + "/MyTeamServlet");
                        break;
                    case "myAwards":
                        response.sendRedirect(request.getContextPath() + "/myAwards.jsp");
                        break;
                    case "competitionList":
                        response.sendRedirect(request.getContextPath() + "/AllCompetitionListServlet");
                        break;
                    case "pwdEdit":
                        response.sendRedirect(request.getContextPath() + "/pwdEdit.jsp");
                        break;
                    default:
                        response.sendRedirect(request.getContextPath() + "/participantInfo.jsp");
                        break;
                }
            } else {
                // 默认跳转到 participantInfo.jsp
                response.sendRedirect(request.getContextPath() + "/participantInfo.jsp");
            }
        } else {
            // Session 中 user 对象不存在，表示用户未登录或者 Session 超时，需要重新登录
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
package com.example.pdcs.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ParticipantServlet", value = "/ParticipantServlet")
public class ParticipantServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.判断Session中的participant对象
        if (request.getSession().getAttribute("participant") != null){
            String viewName = request.getParameter("view");
            String name = request.getParameter("name");
            HttpSession session = request.getSession();
            session.setAttribute("name", name);
            //默认展示用户个人信息视图
            if (viewName == null){
                viewName = "participantInfo";
            }
            switch (viewName){
                case "participantInfo":
                    response.sendRedirect(request.getContextPath()+"/participantInfo.jsp");
                    break;
                case "myEntry":
                    response.sendRedirect(request.getContextPath()+"/myEntry.jsp");
                    break;
                case "myCompetition":
                    response.sendRedirect(request.getContextPath()+"/myCompetition.jsp");
                    break;
                case "myAwards":
                    response.sendRedirect(request.getContextPath()+"/myAwards.jsp");
                    break;
                case "competitionList":
                    response.sendRedirect(request.getContextPath()+"/competitionList.jsp");
                    break;
                case "pwdEdit":
                    response.sendRedirect(request.getContextPath()+"/pwdEdit.jsp");
                    break;
                default:
                    response.sendRedirect(request.getContextPath()+"/participantInfo.jsp");
                    break;
            }
        }else {
            //Session中user对象不存在，表示用户未登录或者Session超时，需要重新登录
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

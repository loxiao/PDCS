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
        request.setCharacterEncoding("utf-8");
        String usernameIn=request.getParameter("usernameIn");//获取用户账号
        String passwordIn=request.getParameter("passwordIn");//获取用户密码
        String role=request.getParameter("role");//获取人员身份
        if(role==null){
            request.getSession().setAttribute("msg","请选择你的身份！");
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
        if (role.equals("participant")){
            ParticipantDao participantDao=new ParticipantDao();
            Participant participant=participantDao.getbynumberandpwd(usernameIn,passwordIn);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

package com.example.pdcs.servlet;

import com.example.pdcs.dao.Participant_msgDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RejectServlet", value = "/RejectServlet")
public class RejectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int mid=Integer.parseInt(request.getParameter("mid"));
        Participant_msgDao participant_msgDao=new Participant_msgDao();
        if(participant_msgDao.deletebymsgid(mid)){
            request.getSession().setAttribute("msg","拒绝成功");
        }else {
            request.getSession().setAttribute("msg","服务器错误");
        }
        request.getRequestDispatcher("PmsgServlet").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }
}

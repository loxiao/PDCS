package com.example.pdcs.servlet;

import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RegServlet", value = "/RegServlet")
public class RegServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("username");
        String number = request.getParameter("email");
        String pwd = request.getParameter("password");
        String address = request.getParameter("address");

        // 检查输入是否为空
        if (name == null || name.trim().isEmpty() || number == null || number.trim().isEmpty() || pwd == null || pwd.trim().isEmpty() ||
                address == null || address.trim().isEmpty()) {
            // 如果任何一个输入为空，设置错误消息并转发回注册页面
            request.setAttribute("msg", "所有字段都是必填的，请确保没有字段为空。");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            ParticipantDao participantDao = new ParticipantDao();
            List<Participant> participantList=participantDao.getAllParticipants();
            int cnt=0;//判断有无相同的账号
            for(Participant participant:participantList){
                if(participant.getParticipant_number().equals(number)){
                    cnt=1;break;
                }
            }
            if(cnt==1){
                request.getSession().setAttribute("msg","注册失败，已有相同账号！");
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
            if(cnt==0){
                boolean result=participantDao.addParticipant(name,number,pwd,address);
                Participant participant=participantDao.getbynumberandpwd(number,pwd);
                request.getSession().setAttribute("participant",participant);
                String username=participant.getParticipant_name();
                request.getSession().setAttribute("name",username);
                request.getRequestDispatcher("IndexServlet").forward(request,response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

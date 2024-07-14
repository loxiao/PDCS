package com.example.pdcs.servlet;

import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ParticipantEditServlet", value = "/ParticipantEditServlet")
public class ParticipantEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // 获取表单提交的数据
        int id = Integer.parseInt(request.getParameter("Id"));
        String name = request.getParameter("Name");
        String email = request.getParameter("Email");
        String address = request.getParameter("Address");

        // 创建Participant对象并设置属性
        Participant participant = new Participant();
        participant.setParticipant_id(id);
        participant.setParticipant_name(name);
        participant.setParticipant_number(email);
        participant.setParticipant_address(address);

        // 获取ParticipantDao实例
        ParticipantDao participantDao = new ParticipantDao();

        // 调用updateParticipant方法更新数据库中的记录
        boolean updateSuccess = participantDao.updateParticipant(participant);

        // 根据更新结果进行响应
        if (updateSuccess) {
            //更新信息成功
            request.getSession().setAttribute("msg","信息修改成功！");
            request.getSession().setAttribute("participant",participantDao.getbyParticipant(id));
            request.getRequestDispatcher("participantInfo.jsp").forward(request,response);
        }else{
            //更新信息失败
            request.getSession().setAttribute("msg","信息修改失败！");
            request.getSession().setAttribute("participant",participantDao.getbyParticipant(id));
            request.getRequestDispatcher("participantInfo.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

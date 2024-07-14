package com.example.pdcs.servlet;

import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PwdEditServlet", value = "/PwdEditServlet")
public class PwdEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // 获取表单提交的数据
        Participant participant = (Participant) request.getSession().getAttribute("participant");
        int id = participant.getParticipant_id();
        String pwd = request.getParameter("newPwd");
        // 创建Participant对象并设置属性
        Participant participant1 = new Participant();
        participant1.setParticipant_id(id);
        participant1.setParticipant_psd(pwd);
        // 获取ParticipantDao实例
        ParticipantDao participantDao = new ParticipantDao();

        // 调用updateParticipant方法更新数据库中的记录
        boolean updateSuccess = participantDao.updatePwd(participant1);

        // 根据更新结果进行响应
        if (updateSuccess) {
            //更新信息成功
            request.getSession().setAttribute("msg1","密码修改成功！");
            request.getSession().setAttribute("participant",participantDao.getbyParticipant(id));
            request.getRequestDispatcher("pwdEdit.jsp").forward(request,response);
        }else{
            //更新信息失败
            request.getSession().setAttribute("msg1","密码修改失败！");
            request.getSession().setAttribute("participant",participantDao.getbyParticipant(id));
            request.getRequestDispatcher("pwdEdit.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

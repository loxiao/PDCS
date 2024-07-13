package com.example.pdcs.servlet;

import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.domain.Participant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UpdateParticipantServlet", value = "/UpdateParticipantServlet")
public class UpdateParticipantServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应的编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 从请求参数中获取更新后的用户信息
        int participantId = Integer.parseInt(request.getParameter("participantId"));
        String participantName = request.getParameter("participant_name");
        String participantNumber = request.getParameter("participant_number");
        String participantAddress = request.getParameter("participant_address");
        String participantPsd = request.getParameter("participant_psd");

        // 创建 Participant 对象并设置更新后的值
        Participant participant = new Participant();
        participant.setParticipant_id(participantId);
        participant.setParticipant_name(participantName);
        participant.setParticipant_number(participantNumber);
        participant.setParticipant_address(participantAddress);

        // 如果新密码不为空，则设置新密码
        if (participantPsd != null && !participantPsd.isEmpty()) {
            participant.setParticipant_psd(participantPsd); // 这里应该对密码进行加密处理
        }

        // 创建 ParticipantDao 对象并调用更新方法
        ParticipantDao participantDao = new ParticipantDao();
        boolean success = participantDao.updateParticipant(participant);

        // 根据更新结果，设置提示信息并跳转
        if (success) {
            // 更新成功，将更新后的用户信息设置到 session 中
            HttpSession session = request.getSession();
            session.setAttribute("participant", participant);

            // 设置成功提示信息
            request.setAttribute("msg", "个人信息更新成功！");
        } else {
            // 更新失败，设置失败提示信息
            request.setAttribute("msg", "个人信息更新失败，请稍后重试！");
        }

        // 跳转回个人中心页面
        request.getRequestDispatcher("PersonalCenterServlet").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
package com.example.pdcs.servlet;

import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "JudgmentServlet", value = "/JudgmentServlet")
public class JudgmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Participant participant=(Participant) request.getSession().getAttribute("participant");
        request.getSession().setAttribute("msg","");
        if(participant==null){
            request.getSession().setAttribute("msg","非参赛人员不得参赛！");
            response.sendRedirect(request.getContextPath()+"/createTeam.jsp");
        }else{
            int cid=Integer.parseInt(request.getParameter("id"));

            TeamDao teamDao=new TeamDao();
            Teams teams=teamDao.getbycompetitionidandpeopleid(participant.getParticipant_id(),cid);
            if(teams==null){//需要再修改一下，修改完成之后删除注释
                request.getSession().setAttribute("msg","创建成功");
                response.sendRedirect(request.getContextPath()+"/createTeam.jsp");
            }else {
                request.getSession().setAttribute("msg","创建失败，已有竞赛队伍");
                response.sendRedirect(request.getContextPath()+"/createTeam.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

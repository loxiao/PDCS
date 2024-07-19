package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.CompetitiontypesDao;
import com.example.pdcs.dao.Judge_msgDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Judge_message;
import com.example.pdcs.domain.Judges;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "JmsgServlet", value = "/JmsgServlet")
public class JmsgServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CompetitionsDao competitionsDao=new CompetitionsDao();
        List<Competitions> competitionsList=competitionsDao.getjudgecompetition();
        Judges judges=(Judges) request.getSession().getAttribute("judges");
        Judge_msgDao judge_msgDao=new Judge_msgDao();
        for(Competitions competitions:competitionsList){
            List<Judge_message> judge_messageList=judge_msgDao.getbycompetition(competitions.getCompetitionID());
            if(judge_messageList.size()<3&&judge_msgDao.getbyCompetitionIDandJudgeID(competitions.getCompetitionID(),judges.getJudgeID())==null){
                judge_msgDao.addmsg(competitions.getCompetitionID(),judges.getJudgeID(),competitions.getCompetitionName());
            }
        }
        List<Judge_message> judge_messageList=judge_msgDao.getbyjudgeid(judges.getJudgeID());
        request.getSession().setAttribute("judge_messageList",judge_messageList);
        response.sendRedirect(request.getContextPath()+"/message.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

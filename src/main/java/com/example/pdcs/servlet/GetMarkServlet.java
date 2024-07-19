package com.example.pdcs.servlet;

import com.example.pdcs.dao.Judge_msgDao;
import com.example.pdcs.dao.WorksDao;
import com.example.pdcs.domain.Judges;
import com.example.pdcs.domain.Works;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetMarkServlet", value = "/GetMarkServlet")
public class GetMarkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int wokrid=Integer.parseInt(request.getParameter("workid"));
        int score=Integer.parseInt(request.getParameter("score"));
        String message=request.getParameter("message");
        WorksDao worksDao=new WorksDao();
        worksDao.addscoreandComment(wokrid,score,message);
        Works works=worksDao.getWorkById(wokrid);
       List<List<String>> JudgeWorkList=(List<List<String>>) request.getSession().getAttribute("JudgeWorkList");
       for(int i=0;i<JudgeWorkList.size();i++){
           String wid= JudgeWorkList.get(i).get(4);
           if(wid.equals(String.valueOf(wokrid))){
               JudgeWorkList.remove(JudgeWorkList.get(i));
           }
       }
       request.getSession().setAttribute("JudgeWorkList",JudgeWorkList);
       if(JudgeWorkList.size()==0){
           Judge_msgDao judge_msgDao=new Judge_msgDao();
           Judges judges=(Judges) request.getSession().getAttribute("judges");
           judge_msgDao.setjudge_msg(judges.getJudgeID(),works.getCompetitionID());
           request.getRequestDispatcher("JmsgServlet").forward(request,response);
       }
        else {
           response.sendRedirect(request.getContextPath()+"/judges.jsp");
       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

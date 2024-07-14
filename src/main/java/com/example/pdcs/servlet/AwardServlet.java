package com.example.pdcs.servlet;

import com.example.pdcs.dao.AwardsDao;
import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.ParticipantDao;
import com.example.pdcs.domain.Admin;
import com.example.pdcs.domain.Awards;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Participant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "AwardServlet", value = "/AwardServlet")
public class AwardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String cid = request.getParameter("id");
        String tsg = "";
        AwardsDao awardsDao = new AwardsDao();
        CompetitionsDao competitionsDao = new CompetitionsDao();

        if (cid == null) {
            tsg = "more";
            List awardsList = awardsDao.getall();
            List<Competitions> competitionList = new ArrayList();
            Iterator var9 = awardsList.iterator();

            while(var9.hasNext()) {
                Awards item = (Awards)var9.next();
                Competitions competitions = competitionsDao.getbyid(item.getCompetitionID());
                competitionList.add(competitions);
            }
            request.getSession().setAttribute("newcompetitionAll", competitionList);
        } else {
            tsg = "one";
            List<Awards> awardsList=awardsDao.getBycompetitionid(Integer.parseInt(cid));
            String first="";
            String second="";
            String third="";
            ParticipantDao participantDao=new ParticipantDao();
            for(Awards awards:awardsList){
                if(awards.getAwardName().equals("一等奖")){
                    if(awards.getWinner1ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner1ID());
                        first=first+participant.getParticipant_name()+" ";
                    }
                    if(awards.getWinner2ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner2ID());
                        first=first+participant.getParticipant_name()+" ";
                    }
                    if(awards.getWinner3ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner3ID());
                        first=first+participant.getParticipant_name()+" ";
                    }
                    if(awards.getWinner4ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner4ID());
                        first=first+participant.getParticipant_name()+" ";
                    }
                }
                if(awards.getAwardName().equals("二等奖")){
                    if(awards.getWinner1ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner1ID());
                        second=second+participant.getParticipant_name()+" ";
                    }
                    if(awards.getWinner2ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner2ID());
                        second=second+participant.getParticipant_name()+" ";
                    }
                    if(awards.getWinner3ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner3ID());
                        second=second+participant.getParticipant_name()+" ";
                    }
                    if(awards.getWinner4ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner4ID());
                        second=second+participant.getParticipant_name()+" ";
                    }
                }
                if(awards.getAwardName().equals("三等奖")){
                    if(awards.getWinner1ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner1ID());
                        third=third+participant.getParticipant_name()+" ";
                    }
                    if(awards.getWinner2ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner2ID());
                        third=third+participant.getParticipant_name()+" ";
                    }
                    if(awards.getWinner3ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner3ID());
                        third=third+participant.getParticipant_name()+" ";
                    }
                    if(awards.getWinner4ID()!=null){
                        Participant participant=participantDao.getbyParticipant(awards.getWinner4ID());
                        third=third+participant.getParticipant_name()+" ";
                    }
                }
            }
            Competitions competitions=competitionsDao.getbyid(Integer.parseInt(cid));
            request.getSession().setAttribute("competitions",competitions);
            request.getSession().setAttribute("first",first);
            request.getSession().setAttribute("second",second);
            request.getSession().setAttribute("third",third);
        }


        request.getSession().setAttribute("tsg", tsg);
        response.sendRedirect(request.getContextPath()+"/news-detail.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

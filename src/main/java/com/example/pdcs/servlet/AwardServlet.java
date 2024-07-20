package com.example.pdcs.servlet;

import com.example.pdcs.dao.*;
import com.example.pdcs.domain.*;

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
        int cid=Integer.parseInt(request.getParameter("id"));
        AwardsDao awardsDao=new AwardsDao();
        WorksDao worksDao=new WorksDao();
        List<Works> worksList=worksDao.getjudgeworkbyCompetitionID(cid);
        int f= (int) ((int) worksList.size()*0.1);
        TeamDao teamDao=new TeamDao();
        for(int i=0;i<f;i++){
           if(i<worksList.size()){
               if(worksList.get((i))!=null){
                   Teams teams=teamDao.getbyteamid(worksList.get((i)).getTeamID());
                   if(awardsDao.getbyworkid(worksList.get(i).getWorkID())==null){
                       awardsDao.addawards(worksList.get(i).getWorkID(),"一等奖",cid,teams.getCaptainID(),teams.getMember1ID(),teams.getMember2ID(),teams.getMember3ID());
                   }
               }
           }
        }
        int s= (int) ((int) worksList.size()*0.2)+f;
        for(int i=f;i<s;i++){
           if(i<worksList.size()){
               if(worksList.get((i))!=null){
                   Teams teams=teamDao.getbyteamid(worksList.get((i)).getTeamID());
                   if(awardsDao.getbyworkid(worksList.get(i).getWorkID())==null){
                       awardsDao.addawards(worksList.get(i).getWorkID(),"二等奖",cid,teams.getCaptainID(),teams.getMember1ID(),teams.getMember2ID(),teams.getMember3ID());
                   }
               }
           }
        }
        int t= (int) ((int) worksList.size()*0.3)+s;
        for(int i=s;i<t;i++){
            if(i<worksList.size()){
                if(worksList.get((i))!=null){
                    Teams teams=teamDao.getbyteamid(worksList.get((i)).getTeamID());
                    if(awardsDao.getbyworkid(worksList.get(i).getWorkID())==null){
                        awardsDao.addawards(worksList.get(i).getWorkID(),"三等奖",cid,teams.getCaptainID(),teams.getMember1ID(),teams.getMember2ID(),teams.getMember3ID());
                    }
                }
            }
        }
        List<Awards> awardsList=awardsDao.getBycompetitionid(cid);
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
        CompetitionsDao competitionsDao=new CompetitionsDao();
        Competitions competitions=competitionsDao.getbyid(cid);
        request.getSession().setAttribute("competitions",competitions);
        request.getSession().setAttribute("first",first);
        request.getSession().setAttribute("second",second);
        request.getSession().setAttribute("third",third);
        request.getSession().setAttribute("tsg","one");
        response.sendRedirect(request.getContextPath()+"/news-detail.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

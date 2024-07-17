package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.Participant_msgDao;
import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Participant_messages;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GoinServlet", value = "/GoinServlet")
public class GoinServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int mid=Integer.parseInt(request.getParameter("mid"));
        Participant_msgDao participant_msgDao=new Participant_msgDao();
        Participant_messages participant_messages=participant_msgDao.getbymsgid(mid);
        int tid=participant_messages.getTeam_id();
        TeamDao teamDao=new TeamDao();
        Teams teams=teamDao.getbyteamid(tid);
        Participant participant=(Participant) request.getSession().getAttribute("participant");
        CompetitionsDao competitionsDao=new CompetitionsDao();
        Competitions competitions=competitionsDao.getbyid(teams.getCompetitionID());
        int mx=1;
        if(teams.getMember1ID()!=null){
            mx++;
        }
        if(teams.getMember2ID()!=null){
            mx++;
        }
        if(teams.getMember3ID()!=null){
            mx++;
        }
        if(mx>=competitions.getMaxParticipants()){
            request.getSession().setAttribute("msg","加入失败，队伍已满员！");
            List<Participant_messages> participant_messagesList=(List<Participant_messages>) request.getSession().getAttribute("participant_messagesList");
            participant_msgDao.deletebymsgid(mid);
            participant_messagesList.remove(participant_messages);
            request.getSession().setAttribute("participant_messagesList",participant_messagesList);
            request.getRequestDispatcher("PmsgServlet").forward(request,response);
        }
        else if(mx<competitions.getMaxParticipants()){
            competitions=competitionsDao.getbyid(teams.getCompetitionID());
            if(teamDao.getbycompetitionidandpeopleid(participant_messages.getParticipant_id(),competitions.getCompetitionID())!=null){
                request.getSession().setAttribute("msg","加入失败，该队员已有参赛队伍");
                participant_msgDao.deletebymsgid(mid);
                request.getRequestDispatcher("PmsgServlet").forward(request,response);
            }else {
                if(teamDao.getbyteamidandpeopleid(participant_messages.getParticipant_id(),tid)!=null){
                    request.getSession().setAttribute("msg","加入失败，该队员已加入你的队伍！");
                    participant_msgDao.deletebymsgid(mid);
                    request.getRequestDispatcher("PmsgServlet").forward(request,response);
                }
                else{
                    if(mx==1){
                        if(teamDao.addmember1(tid,participant.getParticipant_id())){
                            request.getSession().setAttribute("msg","加入成功！");
                            participant_msgDao.deletebymsgid(mid);
                            request.getRequestDispatcher("PmsgServlet").forward(request,response);
                        }
                    }
                    else if(mx==2){
                        if(teamDao.addmember2(tid,participant.getParticipant_id())){
                            request.getSession().setAttribute("msg","加入成功！");
                            participant_msgDao.deletebymsgid(mid);
                            request.getRequestDispatcher("PmsgServlet").forward(request,response);
                        }
                    }
                    else if(mx==3){
                        if(teamDao.addmember3(tid,participant.getParticipant_id())){
                            request.getSession().setAttribute("msg","加入成功！");
                            participant_msgDao.deletebymsgid(mid);
                            request.getRequestDispatcher("PmsgServlet").forward(request,response);
                        }
                    }
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

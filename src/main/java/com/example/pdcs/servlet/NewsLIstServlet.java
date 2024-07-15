package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.domain.Competitions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "NewsLIstServlet", value = "/NewsLIstServlet")
public class NewsLIstServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String competitionId = request.getParameter("id");
        String competitionTypeId = request.getParameter("typeId");
        String competitionTypeName = request.getParameter("typeName");
        CompetitionsDao competitionsDao = new CompetitionsDao();
        String tsg = "";
        String amg = "热门赛事";
        if (competitionId == null) {
            //点击赛事类别进入
            amg = competitionTypeName;
            List<Competitions> competitions = competitionsDao.getByTypeId(Integer.parseInt(competitionTypeId));
            List<Competitions> newCompetitions = competitions.size() > 10 ?
                    competitions.stream().limit(10L).collect(Collectors.toList()) :
                    competitions;
            request.getSession().setAttribute("newcompetitions", newCompetitions);
        } else {
            //点击进入具体的赛事
            tsg = "one";
            Competitions competition = competitionsDao.getbyid(Integer.parseInt(competitionId));
            request.getSession().setAttribute("competitions", competition);
        }

        request.getSession().setAttribute("asg", amg);
        request.getSession().setAttribute("tsg", tsg);

        response.sendRedirect(request.getContextPath()+"/competition.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }
}

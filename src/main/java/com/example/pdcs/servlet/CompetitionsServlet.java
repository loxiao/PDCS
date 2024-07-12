package com.example.pdcs.servlet;

import com.example.pdcs.dao.CompetitionsDao;
import com.example.pdcs.dao.CompetitiontypesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "CompetitionsServlet", value = "/CompetitionsServlet")
public class CompetitionsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从admin-edit.jsp页面中获取数据
        request.setCharacterEncoding("utf-8");
        String competitionDescription=request.getParameter("description");
        String competitionTypeName=request.getParameter("type");
        int maxParticipants=Integer.parseInt(request.getParameter("maxNumber"));
        String theme=request.getParameter("theme");
        String competitionDateString = request.getParameter("startDate");
        String registrationDeadlineString = request.getParameter("endDate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String competitionName= request.getParameter("competitionname");

        Date competitionDate = null;
        Date registrationDeadLine = null;

        try {
            competitionDate = dateFormat.parse(competitionDateString);
            registrationDeadLine = dateFormat.parse(registrationDeadlineString);
        } catch (ParseException e) {
            e.printStackTrace();
        }

// 将java.util.Date转换为java.sql.Date
        java.sql.Date sqlCompetitionDate = new java.sql.Date(competitionDate.getTime());
        java.sql.Date sqlRegistrationDeadLine = new java.sql.Date(registrationDeadLine.getTime());

        if (sqlCompetitionDate != null && sqlRegistrationDeadLine != null) {
            CompetitionsDao competitionsDao = new CompetitionsDao();
            CompetitiontypesDao competitiontypesDao = new CompetitiontypesDao();
            int competitionTypeId = competitiontypesDao.getId(competitionTypeName);
            String msg = competitionsDao.add(competitionName, sqlCompetitionDate, sqlRegistrationDeadLine, competitionTypeId, competitionTypeName, competitionDescription, maxParticipants, theme);

            request.getSession().setAttribute("msg", msg);
            request.getRequestDispatcher("/admin-edit.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }
}

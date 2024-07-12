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
        String competitionName= request.getParameter("name");
        String competitionDescription=request.getParameter("description");
        String competitionTypeName=request.getParameter("type");
        int maxParticipants=Integer.parseInt(request.getParameter("maxNumber"));
        String theme=request.getParameter("theme");
        String competitionDateString = request.getParameter("startDate");
        String registrationDeadlineString = request.getParameter("endDate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date competitionDate = null;
        Date registrationDeadLine = null;

        try {
            competitionDate = dateFormat.parse(competitionDateString);
            registrationDeadLine = dateFormat.parse(registrationDeadlineString);
        } catch (ParseException e) {
            // 处理解析异常，可能是输入的日期格式不正确
            e.printStackTrace();
            // 如果解析失败，你可以选择返回错误信息，终止程序执行，或者采取其他措施
            // 这里简单起见，我们只是打印堆栈跟踪
        }

        if (competitionDate != null && registrationDeadLine != null) {
            // 开始业务逻辑
            CompetitionsDao competitionsDao = new CompetitionsDao();
            CompetitiontypesDao competitiontypesDao = new CompetitiontypesDao();
            int competitionTypeId = competitiontypesDao.getId(competitionTypeName);
            String msg = competitionsDao.add(competitionName, competitionDate, registrationDeadLine, competitionTypeId, competitionTypeName, competitionDescription, maxParticipants, theme);

            request.getSession().setAttribute("msg",msg);
                request.getRequestDispatcher("/admin-edit.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    this.doGet(request,response);
    }
}

package com.example.pdcs.servlet;

import com.example.pdcs.dao.WorksDao;
import com.example.pdcs.domain.Teams;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UploadWorkServlet", value = "/UploadWorkServlet")
public class UploadWorkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Teams> captianteams=(List<Teams>) request.getSession().getAttribute("captianteams");
        List<Teams> uploadlist=new ArrayList<>();
        WorksDao worksDao=new WorksDao();
        for(Teams teams:captianteams){
            if(worksDao.getbyteamid(teams.getTeamID())==null){
                uploadlist.add(teams);
            }
        }
        request.getSession().setAttribute("uploadlist",uploadlist);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

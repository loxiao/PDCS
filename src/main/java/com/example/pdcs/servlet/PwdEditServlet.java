package com.example.pdcs.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PwdEditServlet", value = "/PwdEditServlet")
public class PwdEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取请求参数 id、oldPwd、newPwd
        int id = Integer.parseInt(request.getParameter("id"));
        String oldPwd = request.getParameter("oldPwd");
        String newPwd = request.getParameter("newPwd");
        //2.使用模型（M）对象执行业务方法
//        ReaderDao readerDao = new ReaderDao();
//        if (readerDao.setPassword(id,oldPwd,newPwd)){
//            //3.1修改密码成功
//            request.setAttribute("msg","密码修改成功！");
//            request.getRequestDispatcher("/readerpwd.jsp").forward(request,response);
//        }else{
//            //3.2修改密码失败
//            request.setAttribute("msg","密码修改失败！");
//            request.getRequestDispatcher("/readerpwd.jsp").forward(request,response);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

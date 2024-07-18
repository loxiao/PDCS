package com.example.pdcs.servlet;

import com.example.pdcs.dao.TeamDao;
import com.example.pdcs.dao.WorksDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "FileUploadServlet", value = "/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //DiskFileItemFactory 是创建FileItem 对象的工厂
        DiskFileItemFactory factory = new DiskFileItemFactory() ;
        //ServletFileUpload负责处理上传的文件数据
        ServletFileUpload upload = new ServletFileUpload(factory) ;
        upload.setHeaderEncoding("UTF-8");
        try {
            List<FileItem> itemList=upload.parseRequest(request);
            for (FileItem item: itemList) {

                if (item.getFieldName().equals("file")) {

                    String extName =
                            item.getName().substring(item.getName().lastIndexOf("."));
                    String fileName = UUID.randomUUID().toString();
                    String newFileName = fileName + extName;

                    //设定存储文件夹
                    String path = this.getServletContext().getRealPath("/postimg");
                    File file = new File(path, newFileName);
                    item.write(file);
                    response.getWriter().print(newFileName);//响应输出新文件名
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}

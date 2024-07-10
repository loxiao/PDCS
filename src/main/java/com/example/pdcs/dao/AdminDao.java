package com.example.pdcs.dao;

import com.example.pdcs.domain.Admin;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class AdminDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    public List<Admin> getadminlist(){
        List<Admin> adminList=null;
        try {
            String sql="SELECT * from admin;";
            adminList=template.query(sql,new BeanPropertyRowMapper<>(Admin.class));
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            return adminList;
        }
    }
    public Admin getadmin(String Number,String pwd){
        Admin admin=null;
        try {
            String sql="SELECT *FROM admin where AdminNumber=?and AdminPsd=?;";
            admin=template.queryForObject(sql,new BeanPropertyRowMapper<>(Admin.class),Number,pwd);
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            return admin;
        }
    }

}
package com.example.poster.dao;

import com.example.poster.daomin.admin;
import com.example.poster.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class adminDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    public List<admin> getadminlist(){
        List<admin> adminList=null;
        try {
            String sql="SELECT * from admin;";
            adminList=template.query(sql,new BeanPropertyRowMapper<>(admin.class));
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            return adminList;
        }
    }

}

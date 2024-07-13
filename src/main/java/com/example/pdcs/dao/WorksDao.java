package com.example.pdcs.dao;


import com.example.pdcs.domain.Works;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class WorksDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    // 获取所有作品信息
    public List<Works> getWorks(){
        List<Works> worksList=null;
        try{
            String sql="SELECT * FROM works;";
            worksList=template.query(sql,new BeanPropertyRowMapper<>(Works.class));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return worksList;
        }
    }
}

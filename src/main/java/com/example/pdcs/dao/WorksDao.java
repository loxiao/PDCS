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
            String sql="SELECT *FROM works WHERE EXISTS(SELECT 1 FROM awards a WHERE a.WorkID = WorkID)";
            worksList=template.query(sql,new BeanPropertyRowMapper<>(Works.class));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return worksList;
        }
    }
    public Works getWorkById(int workId) {
        Works work = null;
        try {
            String sql = "SELECT * FROM works WHERE WorkID = ?";
            work = template.queryForObject(sql, new BeanPropertyRowMapper<>(Works.class), workId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return work;
    }
}

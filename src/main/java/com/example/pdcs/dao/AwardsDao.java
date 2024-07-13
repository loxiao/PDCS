package com.example.pdcs.dao;

import com.example.pdcs.domain.Awards;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class AwardsDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    public List<Awards> getBycompetitionid(int cid){
        List<Awards> awards=null;
        try {
            String sql="SELECT *FROM awards WHERE CompetitionID=?";
            awards=template.query(sql,new BeanPropertyRowMapper<>(Awards.class),cid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return awards;
        }
    }
    public List<Awards> getall(){
        List<Awards> awards=null;
        try {
            String sql="SELECT *FROM awards ";
            awards=template.query(sql,new BeanPropertyRowMapper<>(Awards.class));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return awards;
        }
    }
}

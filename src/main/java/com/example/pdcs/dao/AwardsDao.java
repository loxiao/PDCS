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
    public List<Awards> getByparticipantnid(int pid){//查询个人获奖记录
        List<Awards> awards=null;
        try {
            String sql="SELECT*FROM awards WHERE Winner1ID=? or Winner2ID=? or Winner3ID=? OR Winner4ID=?";
            awards=template.query(sql,new BeanPropertyRowMapper<>(Awards.class),pid,pid,pid,pid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return awards;
        }
    }
    public Awards getbyworkid(int wid){
        Awards awards=null;
        try {
            String sql="SELECT*FROM awards WHERE WorkID=?";
            awards=template.queryForObject(sql,new BeanPropertyRowMapper<>(Awards.class),wid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return awards;
        }
    }
}

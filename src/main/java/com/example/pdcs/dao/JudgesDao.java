package com.example.pdcs.dao;

import com.example.pdcs.domain.Admin;
import com.example.pdcs.domain.Judges;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class JudgesDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    // 获取所有评委信息
    public List<Judges> getjuages(){
        List<Judges> judgesList=null;
        try{
            String sql="SELECT *FROM judges;";
            judgesList=template.query(sql,new BeanPropertyRowMapper<>(Judges.class));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return judgesList;
        }
    }
    // 根据编号和密码获取评委信息
    public Judges getbyidandpwd(String Number,String pwd){
        Judges judges=null;
        try {
            String sql="SELECT *FROM judges WHERE JudgesNumber=? and JudgesPsd=?;";
            judges=template.queryForObject(sql,new BeanPropertyRowMapper<>(Judges.class),Number,pwd);
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            return judges;
        }
    }
}

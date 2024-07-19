package com.example.pdcs.dao;

import com.example.pdcs.domain.Judge_message;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class Judge_msgDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    public List<Judge_message> getbyjudgeid(int jid){//根据评委id查询还未评奖的竞赛
        List<Judge_message> judge_messageList=null;
        try {
            String sql="SELECT*FROM judge_messages WHERE JudgeID=? and IsAwarded=0";
            judge_messageList=template.query(sql,new BeanPropertyRowMapper<>(Judge_message.class),jid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return judge_messageList;
        }
    }
    public List<Judge_message> getbycompetition(int cid){
        List<Judge_message> judge_messageList=null;
        try {
            String sql="";
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return judge_messageList;
        }
    }

}

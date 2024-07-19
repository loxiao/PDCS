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
            String sql="SELECT*FROM judge_messages WHERE CompetitionID=?";
            judge_messageList=template.query(sql,new BeanPropertyRowMapper<>(Judge_message.class),cid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return judge_messageList;
        }
    }
    public boolean addmsg(int cid,int jid,String cname){
        int affrow=0;
        try {
            String sql="INSERT INTO judge_messages (competitionID,JudgeID,IsAwarded,CompetitionName) VALUES(?,?,0,?)";
            affrow=template.update(sql,cid,jid,cname);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return affrow>0;
        }
    }
    public Judge_message getbyCompetitionIDandJudgeID(int cid,int jid){
        Judge_message judge_message=null;
        try {
            String sql="SELECT*FROM judge_messages WHERE CompetitionID=? AND JudgeID=?";
            judge_message=template.queryForObject(sql,new BeanPropertyRowMapper<>(Judge_message.class),cid,jid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return judge_message;
        }
    }
    public boolean setjudge_msg(int jid,int cid){
        int affecrrow=0;
        try {
            String sql="UPDATE judge_messages SET IsAwarded=1 WHERE CompetitionID=? AND JudgeID=?";
            affecrrow=template.update(sql,cid,jid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return affecrrow>0;
        }
    }
}

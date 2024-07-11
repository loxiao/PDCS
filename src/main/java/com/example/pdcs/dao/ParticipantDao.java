package com.example.pdcs.dao;

import com.example.pdcs.domain.Participant;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class ParticipantDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    public Participant getbynumberandpwd(String Number,String pwd){
        Participant participant=null;
        try{
            String sql="SELECT*FROM participant WHERE participant_number=?AND participant_psd=?;";
            participant=template.queryForObject(sql,new BeanPropertyRowMapper<>(Participant.class),Number,pwd);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return participant;
        }
    }
    public boolean addParticipant(String name,String Number,String pwd,String address){
        int affectrows=0;
        try {
            String sql="INSERT INTO participant(participant_name,participant_number,participant_psd,participant_address,enter) VALUES(?,?,?,?,0)";
            affectrows=template.update(sql,name,Number,pwd ,address);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return affectrows>0;
        }
    }
}

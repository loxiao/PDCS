package com.example.pdcs.dao;

import com.example.pdcs.domain.Participant;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class ParticipantDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    // 根据参与者编号和密码获取参与者信息
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
    // 添加新参与者
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

    // 更新参与者信息
    public boolean updateParticipant(Participant participant) {
        int affectrows=0;
        try{
            String sql = "UPDATE participant SET participant_name=?, participant_number=?, participant_psd=?, participant_address=? WHERE participant_id=?";
            affectrows = template.update(sql, participant.getParticipant_name(), participant.getParticipant_number(), participant.getParticipant_psd(), participant.getParticipant_address(), participant.getParticipant_id());
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return affectrows>0;
        }
    }

    // 删除参与者
    public boolean deleteParticipant(int participantId) {
        int affectrows=0;
        try{
            String sql = "DELETE FROM participant WHERE participant_id=?";
            affectrows = template.update(sql, participantId);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return affectrows>0;
        }
    }

    // 获取所有参与者信息
    public List<Participant> getAllParticipants() {
        String sql = "SELECT * FROM participant";
        return template.query(sql, new BeanPropertyRowMapper<>(Participant.class));
    }
}

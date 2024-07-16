package com.example.pdcs.dao;

import com.example.pdcs.domain.Participant_messages;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class participant_msgDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    public List<Participant_messages> getBtrecipient_id(int rid){
        List<Participant_messages> participant_messagesList=null;
        try {
            String sql="SELECT*from participant_messages WHERE recipient_id=?";
            participant_messagesList=template.query(sql,new BeanPropertyRowMapper<>(Participant_messages.class),rid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return participant_messagesList;
        }
    }
}

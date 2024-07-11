package com.example.pdcs.dao;

import com.example.pdcs.domain.Competitions;
import com.example.pdcs.domain.Participant;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class CompetitionsDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    //赛事添加
    public boolean add(String CompetitionName, Date CompetitionDate, Date RegistrationDeadline, int CompetitionTypeID,String CompetitionTypeName,String CompetitionDescription,int MaxParticipants,String Theme){
        int affectRows = 0;
        try {
            String sql = "insert into Competitions(CompetitionName, CompetitionDate, RegistrationDeadline, CompetitionTypeID, CompetitionTypeName,CompetitionDescription, MaxParticipants,Theme) values(?,?,?,?,?,?,?,?)";
            //2.调用update方法，写入数据库
            affectRows = template.update(sql,CompetitionName, CompetitionDate, RegistrationDeadline, CompetitionTypeID, CompetitionTypeName,CompetitionDescription, MaxParticipants,Theme);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }
    public List<Competitions> getCompetitionList(){
        List<Competitions> competitionsArrayList=null;
        String sql = "SELECT * FROM Competitions";
        competitionsArrayList=template.query(sql, new BeanPropertyRowMapper<>(Competitions.class));
        return competitionsArrayList;
    }
}

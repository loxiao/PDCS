package com.example.pdcs.dao;

import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.Date;

public class CompetitionsDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    //赛事添加
    public boolean add(String CompetitionName, Date CompetitionDate, Date RegistrationDeadline, int CompetitionTypeID,String CompetitionTypeName){
        int affectRows = 0;
        try {
            String sql = "insert into Competitions(CompetitionName, CompetitionDate, RegistrationDeadline, CompetitionTypeID, CompetitionTypeName) values(?,?,?,?,?)";
            //2.调用update方法，写入数据库
            affectRows = template.update(sql,CompetitionName, CompetitionDate, RegistrationDeadline, CompetitionTypeID, CompetitionTypeName);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }
}

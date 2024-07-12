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

    public String add(String CompetitionName, Date CompetitionDate, Date RegistrationDeadline, int CompetitionTypeID,String CompetitionTypeName,String CompetitionDescription,int MaxParticipants,String Theme){ //赛事添加
        try {
            String sql = "insert into Competitions (CompetitionName, CompetitionDate, RegistrationDeadline, CompetitionTypeID, CompetitionTypeName,CompetitionDescription, MaxParticipants,Theme) values(?,?,?,?,?,?,?,?)";
            //2.调用update方法，写入数据库
            template.update(sql,CompetitionName, CompetitionDate, RegistrationDeadline, CompetitionTypeID, CompetitionTypeName,CompetitionDescription, MaxParticipants,Theme);
        } catch (Exception e) {
            e.printStackTrace();
            return "发布失败，请管理员检查内容是否正确";
        } finally {
            return "发布成功";
        }
    }

    public List<Competitions> getCompetitionList(){//获取所有的竞赛信息
        List<Competitions> competitionsArrayList=null;
        try {
            String sql = "SELECT * FROM Competitions";
            competitionsArrayList=template.query(sql, new BeanPropertyRowMapper<>(Competitions.class));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return competitionsArrayList;
        }

    }

    public List<Competitions> getoldcompetition(){//获取已经结束的竞赛作为新闻
        List<Competitions>competitionsList=null;
        try {
            String sql="SELECT *FROM competitions WHERE CompetitionDate <= CURDATE() ORDER BY CompetitionDate DESC LIMIT 10;";
            competitionsList=template.query(sql,new BeanPropertyRowMapper<>(Competitions.class));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return competitionsList;
        }
    }

    public List<Competitions> getnewcompetitions(){//获取截至报名前的竞赛作为新闻
        List<Competitions> competitionsList=null;
        try {
            String sql="SELECT *FROM competitions WHERE RegistrationDeadline > CURDATE() ORDER BY RegistrationDeadline DESC LIMIT 10;";
            competitionsList=template.query(sql,new BeanPropertyRowMapper<>(Competitions.class));
        }finally {
            return competitionsList;
        }
    }

}

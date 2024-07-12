package com.example.pdcs.dao;

import com.example.pdcs.domain.Competitions;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.Date;
import java.util.List;

public class CompetitionsDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    //赛事添加
    public String add(String CompetitionName, Date CompetitionDate, Date RegistrationDeadline, int CompetitionTypeID,String CompetitionTypeName,String CompetitionDescription,int MaxParticipants,String Theme){ //赛事添加
        int affectrow=0;
        try {
            String sql = "insert into Competitions (CompetitionName, CompetitionDate, RegistrationDeadline, CompetitionTypeID, CompetitionTypeName,CompetitionDescription, MaxParticipants,Theme) values(?,?,?,?,?,?,?,?)";
            //2.调用update方法，写入数据库
            affectrow=template.update(sql,CompetitionName, CompetitionDate, RegistrationDeadline, CompetitionTypeID, CompetitionTypeName,CompetitionDescription, MaxParticipants,Theme);
        } catch (Exception e) {
            e.printStackTrace();
            return "发布失败，请管理员检查内容是否正确";
        } finally {
            if(affectrow>0){
                return "发布成功";
            }
            else{
                return "发布失败，请管理员检查内容是否正确";
            }
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
    public List<Competitions> getoldcompetition(){//获取已经结束并且完成颁奖的竞赛作为新闻
        List<Competitions>competitionsList=null;
        try {
            String sql="SELECT \n" +
                    "    c.CompetitionID,\n" +
                    "    c.CompetitionName,\n" +
                    "    c.CompetitionDate,\n" +
                    "    c.RegistrationDeadline,\n" +
                    "    c.CompetitionTypeID,\n" +
                    "    c.CompetitionTypeName,\n" +
                    "    c.CompetitionDescription,\n" +
                    "    c.MaxParticipants,\n" +
                    "    c.Theme\n" +
                    "FROM \n" +
                    "    competitions c\n" +
                    "WHERE \n" +
                    "    c.CompetitionDate <= CURDATE()\n" +
                    "    AND EXISTS (\n" +
                    "        SELECT 1\n" +
                    "        FROM awards a\n" +
                    "        WHERE a.CompetitionID = c.CompetitionID\n" +
                    "    )\n" +
                    "ORDER BY c.CompetitionDate DESC;";
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
            String sql="SELECT *\n" +
                    "FROM competitions\n" +
                    "WHERE RegistrationDeadline > NOW()\n" +
                    "ORDER BY RegistrationDeadline ASC;";
            competitionsList=template.query(sql,new BeanPropertyRowMapper<>(Competitions.class));
        }finally {
            return competitionsList;
        }
    }
    public Competitions getbyid(int id){
        Competitions competitions=null;
        try {
            String sql="SELECT*FROM competitions WHERE CompetitionID=?";
            competitions=template.queryForObject(sql,new BeanPropertyRowMapper<>(Competitions.class),id);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return competitions;
        }
    }

}

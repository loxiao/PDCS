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
            String sql = "insert into Competitions (CompetitionName, CompetitionDate, RegistrationDeadline, CompetitionTypeID, CompetitionTypeName,CompetitionDescription, MaxParticipants,Theme,PublishDate) values(?,?,?,?,?,?,?,?,now())";
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
            String sql = "SELECT * FROM Competitions  WHERE RegistrationDeadline > NOW() ORDER BY PublishDate DESC";
            competitionsArrayList=template.query(sql, new BeanPropertyRowMapper<>(Competitions.class));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return competitionsArrayList;
        }

    }
    //获取已经结束并且完成颁奖的竞赛作为新闻
    public List<Competitions> getoldcompetition(){
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
                    "    c.Theme,\n" +
                    "    c.PublishDate\n" +
                    "FROM \n" +
                    "    competitions c\n" +
                    "INNER JOIN \n" +
                    "    awards a \n" +
                    "ON \n" +
                    "    c.CompetitionID = a.CompetitionID\n" +
                    "WHERE \n" +
                    "    c.CompetitionDate <= CURDATE();";
            competitionsList=template.query(sql,new BeanPropertyRowMapper<>(Competitions.class));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return competitionsList;
        }
    }
    //获取截至评分后的竞赛作为新闻
    public List<Competitions> getnewcompetitions(){
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
            String sql="SELECT * FROM competitions WHERE CompetitionID=?";
            competitions=template.queryForObject(sql,new BeanPropertyRowMapper<>(Competitions.class),id);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return competitions;
        }
    }
    public List<Competitions> getByTypeId(int typeId) {
        List competitionsList = null;

        try {
            String sql = "SELECT * FROM competitions WHERE CompetitionTypeID=? and RegistrationDeadline > NOW() ORDER BY RegistrationDeadline ASC;";
            competitionsList = this.template.query(sql, new BeanPropertyRowMapper(Competitions.class), new Object[]{typeId});
            return competitionsList;
        } finally {
            ;
        }
    }
    //获取所有竞赛并根据typeId筛选
    public List<Competitions> getAllCompetitionsByTypeOrAll(int typeId) {
        List<Competitions> competitionsList = null;

        try {
            if (typeId != 0) {
                String sql = "SELECT * FROM competitions WHERE CompetitionTypeID = ? ORDER BY RegistrationDeadline DESC;";
                competitionsList = this.template.query(sql, new BeanPropertyRowMapper<>(Competitions.class), (Object[]) (typeId != 0 ? new Object[]{typeId} : new Object[0]));
            }else{
                String sql = "SELECT * FROM Competitions ORDER BY RegistrationDeadline DESC;";
                competitionsList=template.query(sql, new BeanPropertyRowMapper<>(Competitions.class));
            }} finally {
            // 无需在这里返回值，因为返回值应该在try块中处理
        }

        return competitionsList;
    }
    //获取截至报名前的竞赛并根据typeId筛选
    public List<Competitions> getCompetitionsByTypeOrAll(int typeId) {
        List<Competitions> competitionsList = null;

        try {

            if (typeId != 0) {
                String sql = "SELECT * FROM competitions WHERE RegistrationDeadline > NOW() AND CompetitionTypeID = ? ORDER BY RegistrationDeadline DESC;";
                competitionsList = this.template.query(sql, new BeanPropertyRowMapper<>(Competitions.class), (Object[]) (typeId != 0 ? new Object[]{typeId} : new Object[0]));
            }else{
                String sql = "SELECT * FROM Competitions WHERE RegistrationDeadline > NOW() ORDER BY RegistrationDeadline DESC;";
                competitionsList=template.query(sql, new BeanPropertyRowMapper<>(Competitions.class));
            }
        } finally {
            // 无需在这里返回值，因为返回值应该在try块中处理
        }

        return competitionsList;
    }

    public List<Competitions> searchCompetitionsByName(String searchKeyword) {
        List<Competitions> competitionsList = null;
        try {
            String sql = "SELECT * FROM competitions WHERE CompetitionName LIKE ? AND RegistrationDeadline > NOW()";
            competitionsList = this.template.query(sql, new BeanPropertyRowMapper<>(Competitions.class), "%" + searchKeyword + "%");
        } finally {
            // 清理资源的代码（如果有的话）
        }
        return competitionsList;
    }
}

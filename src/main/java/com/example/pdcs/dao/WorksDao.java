package com.example.pdcs.dao;


import com.example.pdcs.domain.Works;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class WorksDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    // 获取所有作品信息
    public boolean addworks(int competitionId,String title,int tid,String path){
        String sql="INSERT INTO works(WorkName,CompetitionID,TeamID,ImageURL) VALUES(?,?,?,?)";
        return template.update(sql,title,competitionId,tid,path)>0;
    }
    public List<Works> getWorks(){
        List<Works> worksList=null;
        try{
            String sql="SELECT *FROM works w WHERE EXISTS(SELECT 1 FROM awards a WHERE a.WorkID = w.WorkID)";
            worksList=template.query(sql,new BeanPropertyRowMapper<>(Works.class));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return worksList;
        }
    }
    public Works getWorkById(int workId) {
        Works work = null;
        try {
            String sql = "SELECT * FROM works WHERE WorkID = ?";
            work = template.queryForObject(sql, new BeanPropertyRowMapper<>(Works.class), workId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return work;
    }
    public List<Works> getBycompetitionidandaward(int cid){//根据竞赛id获取获奖作品
        List<Works> worksList=null;
        try{
            String sql="SELECT *FROM works WHERE CompetitionID=? and EXISTS(SELECT 1 FROM awards a WHERE a.WorkID = WorkID)";
            worksList=template.query(sql,new BeanPropertyRowMapper<>(Works.class),cid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return worksList;
        }
    }
    public Works getbyteamid(int tid){
        Works works=null;
        try {
            String sql="SELECT*from works WHERE TeamID=?";
            works=template.queryForObject(sql,new BeanPropertyRowMapper<>(Works.class),tid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return works;
        }
    }

    public Works updateLikes(int likesCount, int workId) {
        Works works=null;
        try {
            String sql = "UPDATE works SET Likes = ? WHERE WorkID = ?";
            template.update(sql, likesCount, workId);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return works;
        }
    }
    public List<Works> getjudgeworkbyCompetitionID(int cid){
        List<Works> worksList=null;
        try {
            String sql="SELECT *FROM works WHERE CompetitionID=? ORDER BY Score DESC;";
            worksList=template.query(sql,new BeanPropertyRowMapper<>(Works.class),cid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return worksList;
        }
    }
    public boolean addscoreandComment(int wid,int score,String comment){
        int affectrow=0;
        try {
            String sql="UPDATE works SET Score = Score+?, Comments = ? WHERE WorkID = ?;";
            affectrow=template.update(sql,score,comment,wid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return affectrow>0;
        }
    }
    /*获取优秀作品*/
    public List<Works> getExcellentWorks(){
        List<Works> worksList=null;
        try {
            String sql="WITH ExcellentWorks AS (\n" +
                    "    SELECT w.* FROM works w\n" +
                    "    JOIN (\n" +
                    "        SELECT CompetitionID, MAX(Score) AS MaxScore\n" +
                    "        FROM works\n" +
                    "        GROUP BY CompetitionID\n" +
                    "    ) wm\n" +
                    "    ON w.CompetitionID = wm.CompetitionID AND w.Score = wm.MaxScore\n" +
                    ")\n" +
                    "SELECT * FROM ExcellentWorks ORDER BY RAND() LIMIT 4";
            worksList=template.query(sql,new BeanPropertyRowMapper<>(Works.class));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return worksList;
        }
    }
}

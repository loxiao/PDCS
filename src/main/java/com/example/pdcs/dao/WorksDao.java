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
}

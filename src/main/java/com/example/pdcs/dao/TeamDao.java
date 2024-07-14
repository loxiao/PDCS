package com.example.pdcs.dao;

import com.example.pdcs.domain.Teams;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class TeamDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    public Teams getbycompetitionidandpeopleid(int pid,int cid){
        Teams teams=null;
        try {
            String sql="SELECT *FROM teams WHERE (CaptainID = ?  OR Member1ID = ? OR Member2ID = ? OR Member3ID = ? )AND CompetitionID = ?;";
            teams=template.queryForObject(sql,new BeanPropertyRowMapper<>(Teams.class),pid,pid,pid,pid,cid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return teams;
        }
    }
    public boolean addteams(int pid,int cid,String teamname){
        int affectrow=0;
        try {
            String sql="INSERT INTO teams (TeamName, CaptainID, CompetitionID) VALUES\n" +
                    "(?, ?, ?);";
            affectrow=template.update(sql,teamname,pid,cid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return affectrow>0;
        }
    }
    public Teams getbyteamid(int tid){
        Teams teams=null;
        try {
            String sql="SELECT*FROM teams WHERE TeamID=?";
            teams=template.queryForObject(sql,new BeanPropertyRowMapper<>(Teams.class),tid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return teams;
        }
    }
}

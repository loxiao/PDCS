package com.example.pdcs.dao;

import com.example.pdcs.domain.Teams;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

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
    public List<Teams> getbyCompetitionID(int cid,int maxpoeple){
        List<Teams> teams=null;
        try {
            String sql="SELECT *FROM teams WHERE CompetitionID=? and\n" +
                    "    (\n" +
                    "        CASE\n" +
                    "            WHEN CaptainID IS NOT NULL THEN 1\n" +
                    "            ELSE 0\n" +
                    "        END\n" +
                    "        +\n" +
                    "        CASE\n" +
                    "            WHEN Member1ID IS NOT NULL THEN 1\n" +
                    "            ELSE 0\n" +
                    "        END\n" +
                    "        +\n" +
                    "        CASE\n" +
                    "            WHEN Member2ID IS NOT NULL THEN 1\n" +
                    "            ELSE 0\n" +
                    "        END\n" +
                    "        +\n" +
                    "        CASE\n" +
                    "            WHEN Member3ID IS NOT NULL THEN 1\n" +
                    "            ELSE 0\n" +
                    "        END\n" +
                    "    ) < ?;";
            teams=template.query(sql,new BeanPropertyRowMapper<>(Teams.class),cid,maxpoeple);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return teams;
        }
    }
    public boolean addfirstParticipant(int pid,int tid){
        int affectrow=0;
        try {

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return affectrow>0;
        }
    }

    public List<Teams> getByCaptainID(int id){
        List<Teams> teams=null;
        try {
            String sql="SELECT t.*  \n" +
                    "FROM teams t  \n" +
                    "WHERE t.CaptainID = ?  \n" +
                    "  AND (  \n" +
                    "    (SELECT c.MaxParticipants FROM competitions c WHERE c.CompetitionID = t.CompetitionID) - 1 >  \n" +
                    "    (  \n" +
                    "      CASE WHEN t.Member1ID IS NOT NULL THEN 1 ELSE 0 END +  \n" +
                    "      CASE WHEN t.Member2ID IS NOT NULL THEN 1 ELSE 0 END +  \n" +
                    "      CASE WHEN t.Member3ID IS NOT NULL THEN 1 ELSE 0 END  \n" +
                    "    )  \n" +
                    "  );";
            teams=template.query(sql,new BeanPropertyRowMapper<>(Teams.class),id);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return  teams;
        }
    }

    public List<Teams> getByPID(int pid){
        List<Teams> teams=null;
        try {
            String sql = "SELECT * FROM teams WHERE CaptainID = ? OR Member1ID = ? OR Member2ID = ? OR Member3ID = ?;";
            teams = template.query(sql, new BeanPropertyRowMapper<>(Teams.class), pid,pid,pid,pid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return teams;
        }
    }

}

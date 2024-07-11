package com.example.pdcs.dao;


import com.example.pdcs.domain.Competitiontypes;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CompetitiontypesDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    public List<Competitiontypes> getList(){
        List<Competitiontypes> competitiontypesList=null;
        try {
            String sql="SELECT * from competitiontypes;";
            competitiontypesList=template.query(sql,new BeanPropertyRowMapper<>(Competitiontypes.class));
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            return competitiontypesList;
        }
    }
}

package com.example.pdcs.dao;


import com.example.pdcs.domain.Competitiontypes;
import com.example.pdcs.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CompetitiontypesDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    //获取所有赛事类别
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
    //提供类别的名称选出相应类别的id
    public int getId(String competitionTypeName) {
        Competitiontypes competitiontypes=null;
        try {
            String sql = "SELECT*FROM competitiontypes WHERE TypeName=?";
            competitiontypes=template.queryForObject(sql,new BeanPropertyRowMapper<>(Competitiontypes.class),competitionTypeName);
        } catch (Exception e) {
            e.printStackTrace();
            // 可能需要处理异常情况，比如当查询结果为空时
        }
        finally {
            return competitiontypes.getCompetitionTypeID();
        }
    }
}

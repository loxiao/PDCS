package com.example.pdcs.dao;

import com.example.pdcs.domain.Competitions;
import org.junit.jupiter.api.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CompetitionsDaoTest {
    CompetitionsDao competitionsDao=new CompetitionsDao();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
    @Test
    void add() throws ParseException {
        Date utilStartDate = sdf.parse("2024/07/11");
        Date utilEndDate = sdf.parse("2024/08/11");

        // 转换为java.sql.Date
        java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
        java.sql.Date sqlEndDate = new java.sql.Date(utilEndDate.getTime());
        competitionsDao.add("海报比赛",sqlStartDate,sqlEndDate,1,"公益类","该比赛……",1,"为了……");

    }
    @Test
    void getall(){
        List<Competitions> competitions=null;
        competitions=competitionsDao.getCompetitionList();
        assertEquals(false,competitions.isEmpty());
        for(Competitions competitions1:competitions){
            System.out.println(competitions1.getCompetitionName());
        }
    }
}
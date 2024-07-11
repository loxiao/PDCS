package com.example.pdcs.dao;

import com.example.pdcs.domain.Admin;
import com.example.pdcs.domain.Judges;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class JudgesDaoTest {
JudgesDao judgesDao;
    @BeforeEach
    public void init(){
        judgesDao=new JudgesDao();
    }
    @Test
    void getjudges() {
        List<Judges> judgesList=judgesDao.getjuages();
        assertEquals(false,judgesList.isEmpty());
        for(Judges judges:judgesList){
            System.out.println(judges.getJudgeID()+" "+judges.getJudgesName());
        }
    }
    @Test
    void  getbyidandpwd(){
       Judges judges=judgesDao.getbyidandpwd("1224.com","1234");
        assertEquals("Jhon",judges.getJudgesName());
    }
}
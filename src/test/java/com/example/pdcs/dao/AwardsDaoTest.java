package com.example.pdcs.dao;

import com.example.pdcs.domain.Awards;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class AwardsDaoTest {
    AwardsDao awardsDao;
    @BeforeEach
    void init(){
        awardsDao=new AwardsDao();
    }
    @Test
    void getBycompetitionid() {
        List<Awards> awards=awardsDao.getBycompetitionid(1);
        assertEquals(false,awards.isEmpty());
        for(Awards awards1:awards){
            System.out.println(awards1.getAwardName());
        }
    }
    @Test
    void getall(){
        List<Awards> awardsList=awardsDao.getall();
        assertEquals(false,awardsList.isEmpty());
        for(Awards awards:awardsList){
            System.out.println(awards.getAwardName()+" "+awards.getWinner1ID()+" "+awards.getWinner2ID()+" "+awards.getWinner3ID()+" "+awards.getWinner4ID());
        }
    }
}
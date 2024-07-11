package com.example.pdcs.dao;

import com.example.pdcs.domain.Participant;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ParticipantDaoTest {
    ParticipantDao participantDao;
    @BeforeEach
    public void init(){
        participantDao=new ParticipantDao();
    }
    String name="Lili";
    String Number="9868.com";
    String pwd="6521";
    String address="天海市";
    //每次测试时将参赛人员表中Lili删除
    @Test
    void addParticipant() {
        boolean result=participantDao.addParticipant(name,Number,pwd,address);
        assertEquals(true,result);
    }
    @Test
    void getbynumberandpwd() {
        Participant participant=participantDao.getbynumberandpwd(Number,pwd);
        assertEquals("Lili",participant.getParticipant_name());
    }
}
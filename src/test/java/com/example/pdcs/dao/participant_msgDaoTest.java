package com.example.pdcs.dao;

import com.example.pdcs.domain.Participant;
import com.example.pdcs.domain.Participant_messages;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.example.pdcs.dao.Participant_msgDao;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class participant_msgDaoTest {
    Participant_msgDao participant_msgDao;
    @BeforeEach
    void init(){
        participant_msgDao=new Participant_msgDao();
    }

    @Test
    void getBtrecipient_id() {
        List<Participant_messages> participant_messages= participant_msgDao.getBtrecipient_id(1);
        assertEquals(false,participant_messages.isEmpty());
        for(Participant_messages participant_messages1:participant_messages){
            System.out.println(participant_messages1.getParticipant_name());
        }
    }

    @Test
    void addmsg() {
        boolean result=participant_msgDao.addmsg(6,102,0,"李四","强国在心中队",1);
        assertEquals(true,result);
    }
}
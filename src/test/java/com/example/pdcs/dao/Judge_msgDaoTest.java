package com.example.pdcs.dao;

import com.example.pdcs.domain.Judge_message;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class Judge_msgDaoTest {
Judge_msgDao judge_msgDao;
@BeforeEach
void init(){
    judge_msgDao=new Judge_msgDao();
}
    @Test
    void getbyjudgeid() {
        List<Judge_message> judge_messageList=judge_msgDao.getbyjudgeid(1);
        assertEquals(false,judge_messageList.isEmpty());
        for(Judge_message judge_message:judge_messageList){
            System.out.println(judge_message.getCompetitionName());
        }
    }

    @Test
    void getbycompetition() {
    }

    @Test
    void addmsg() {
    }

    @Test
    void getbyCompetitionIDandJudgeID() {
    }
}
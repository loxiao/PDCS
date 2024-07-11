package com.example.pdcs.dao;

import com.example.pdcs.domain.Participant;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

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
    @Test
    void updateParticipant() {
        // 创建一个Participant对象并设置要更新的属性
        Participant participantToUpdate = new Participant();
        participantToUpdate.setParticipant_id(1); // 假设ID为1的参与者存在
        participantToUpdate.setParticipant_name("New Name");
        participantToUpdate.setParticipant_number("New Number");
        participantToUpdate.setParticipant_psd("New Password");
        participantToUpdate.setParticipant_address("New Address");

        // 更新参与者信息
        boolean isUpdated = participantDao.updateParticipant(participantToUpdate);

        // 验证更新是否成功
        assertTrue(isUpdated);
    }
    @Test
    void deleteParticipant() {
        // 删除ID为1的参与者
        boolean isDeleted = participantDao.deleteParticipant(1);

        // 验证是否删除成功
        assertTrue(isDeleted);
    }

    @Test
    void getAllParticipants() {
        // 获取所有参与者信息
        List<Participant> participants = participantDao.getAllParticipants();

        // 验证获取的参与者列表不为空
        assertNotNull(participants);
        assertFalse(participants.isEmpty());
    }
}
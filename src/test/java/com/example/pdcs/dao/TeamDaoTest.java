package com.example.pdcs.dao;

import com.example.pdcs.domain.Teams;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class TeamDaoTest {
private TeamDao teamDao;
@BeforeEach
void init(){
    teamDao=new TeamDao();
}
    @Test
    void getbycompetitionidandpeopleid() {
        Teams teams=teamDao.getbycompetitionidandpeopleid(1,1);
        System.out.println(teams.getTeamName());
        teams=teamDao.getbycompetitionidandpeopleid(1,10);
        System.out.println(teams.getTeamName());
    }

    @Test
    void addteams() {
    boolean result=teamDao.addteams(1,10,"编码大王");
    assertEquals(true,result);
    }
    @Test
    void getbycomptitionid(){
        List<Teams> teams=teamDao.getbyCompetitionID(12,4);
        assertEquals(false,teams.isEmpty());
        for(Teams teams1:teams){
            System.out.println(teams1.getTeamName());
        }
    }

}
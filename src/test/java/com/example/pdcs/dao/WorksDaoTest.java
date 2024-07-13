package com.example.pdcs.dao;

import com.example.pdcs.domain.Admin;
import com.example.pdcs.domain.Works;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class WorksDaoTest {
    private WorksDao worksDao;
    @BeforeEach
    public void init(){
        worksDao=new WorksDao();
    }
    @Test
    void getWorks() {
        List<Works> worksList=worksDao.getWorks();
        assertEquals(false,worksList.isEmpty());
        for(Works works:worksList){
            System.out.println(works.getWorkID()+" "+works.getWorkName()+" "+works.getTeamID()+" "+ works.getCompetitionID()+" "+works.getImageURL());
        }
    }
    @Test
    void etBycompetitionidandaward(){
        List<Works> worksList=worksDao.getBycompetitionidandaward(1);
        assertEquals(false,worksList.isEmpty());
        for(Works works:worksList){
            System.out.println(works.getWorkID()+" "+works.getWorkName()+" "+works.getTeamID()+" "+ works.getCompetitionID()+" "+works.getImageURL());
        }
    }
}
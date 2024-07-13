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
        List<Works> worksDaoList=worksDao.getWorks();
        assertEquals(false,worksDaoList.isEmpty());
        for(Works works:worksDaoList){
            System.out.println(works.getWorkName()+" "+works.getTeamID()+" "+ works.getCompetitionID());
        }
    }
}
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
        List<Works> worksList=worksDao.getBycompetitionidandaward(15);
        int f= (int) ((int) worksList.size()*0.1);
        int s= (int) ((int) worksList.size()*0.2)+f;
        int t= (int) ((int) worksList.size()*0.3)+s;
        System.out.println(f+" "+s+" "+t);
        assertEquals(false,worksList.isEmpty());
        for(Works works:worksList){
            System.out.println(works.getWorkID()+" "+works.getWorkName()+" "+works.getTeamID()+" "+ works.getCompetitionID()+" "+works.getImageURL());
        }
    }
    @Test
    void updateLikesSuccessfullyUpdatesLikes() {
        // Arrange
        int likesCount = 5;
        int workId = 1;

        // Act
        worksDao.updateLikes(likesCount, workId);
        List<Works> worksList=worksDao.getWorks();
        for(Works works:worksList){
            System.out.println(works.getWorkID()+" "+works.getWorkName()+" "+works.getTeamID()+" "+ " " + works.getLikes()+" "+works.getCompetitionID()+" "+works.getImageURL());
        }

    }
//    @Test
//    void getExcellentWorks(){
//        List<Works> worksList=worksDao.getExcellentWorks();
//        assertEquals(false,worksList.isEmpty());
//        for(Works works:worksList){
//            System.out.println(works.getWorkName());
//        }
//    }
}
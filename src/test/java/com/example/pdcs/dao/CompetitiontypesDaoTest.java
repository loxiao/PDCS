package com.example.pdcs.dao;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CompetitiontypesDaoTest {
    CompetitiontypesDao competitiontypesDao;
    @BeforeEach
    void init(){
        competitiontypesDao=new CompetitiontypesDao();
    }

    @Test
    void getList() {
    }

    @Test
    void getId() {
        int id=competitiontypesDao.getId("公益类");
        assertEquals(1,id);
        System.out.println(id);
    }
}
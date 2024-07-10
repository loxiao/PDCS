package com.example.poster.dao;

import com.example.poster.daomin.admin;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class adminDaoTest {
    private adminDao adminDao;
    @BeforeEach
    public void init(){
        adminDao=new adminDao();
    }

    @Test
    void getadminlist() {
        List<admin> adminDaoList=adminDao.getadminlist();
        assertEquals(false,adminDaoList.isEmpty());
        for(admin admins:adminDaoList){
            System.out.println(admins.getAdminID()+" "+admins.getAdminName());
        }
    }
}
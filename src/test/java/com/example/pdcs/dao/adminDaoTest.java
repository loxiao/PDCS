package com.example.pdcs.dao;

import com.example.pdcs.domain.Admin;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class adminDaoTest {
    private AdminDao adminDao;
    @BeforeEach
    public void init(){
        adminDao=new AdminDao();
    }

    @Test
    void getadminlist() {
        List<Admin> adminDaoList=adminDao.getadminlist();
        assertEquals(false,adminDaoList.isEmpty());
        for(Admin admins:adminDaoList){
            System.out.println(admins.getAdminID()+" "+admins.getAdminName());
        }
    }
    @Test
    void  getadmin(){
        Admin admin=adminDao.getadmin("admin@1234.com","1234");
        assertEquals("Alice",admin.getAdminName());
    }


}
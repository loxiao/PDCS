package com.example.pdcs.domain;

public class Admin {
    private int AdminID;
    private String AdminName;
    private String AdminNumber;
    private String AdminPsd;
    public Admin(){}
    public String getAdminPsd() {
        return AdminPsd;
    }

    public void setAdminPsd(String adminPsd) {
        AdminPsd = adminPsd;
    }

    public String getAdminNumber() {
        return AdminNumber;
    }

    public void setAdminNumber(String adminNumber) {
        AdminNumber = adminNumber;
    }

    public String getAdminName() {
        return AdminName;
    }

    public void setAdminName(String adminName) {
        AdminName = adminName;
    }

    public int getAdminID() {
        return AdminID;
    }

    public void setAdminID(int adminID) {
        AdminID = adminID;
    }
}

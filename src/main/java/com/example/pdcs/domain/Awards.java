package com.example.pdcs.domain;

public class Awards {
    private int AwardID;
    private int WorkID;
    private String AwardName;
    private int CompetitonID;
    public Awards(){}
    public int getAwardID() {
        return AwardID;
    }

    public void setAwardID(int awardID) {
        AwardID = awardID;
    }

    public int getWorkID() {
        return WorkID;
    }

    public void setWorkID(int workID) {
        WorkID = workID;
    }

    public String getAwardName() {
        return AwardName;
    }

    public void setAwardName(String awardName) {
        AwardName = awardName;
    }

    public int getCompetitonID() {
        return CompetitonID;
    }

    public void setCompetitonID(int competitonID) {
        CompetitonID = competitonID;
    }
}
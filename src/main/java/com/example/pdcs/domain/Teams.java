package com.example.pdcs.domain;

public class Teams {
    private int TeamID;
    private String TeamName;
    private int CaptainID;
    private int Member1ID;
    private int Member2ID;
    private int Member3ID;
    public Teams(){}

    public int getTeamID() {
        return TeamID;
    }

    public void setTeamID(int teamID) {
        TeamID = teamID;
    }

    public String getTeamName() {
        return TeamName;
    }

    public void setTeamName(String teamName) {
        TeamName = teamName;
    }

    public int getCaptainID() {
        return CaptainID;
    }

    public void setCaptainID(int captainID) {
        CaptainID = captainID;
    }

    public int getMember1ID() {
        return Member1ID;
    }

    public void setMember1ID(int member1ID) {
        Member1ID = member1ID;
    }

    public int getMember2ID() {
        return Member2ID;
    }

    public void setMember2ID(int member2ID) {
        Member2ID = member2ID;
    }

    public int getMember3ID() {
        return Member3ID;
    }

    public void setMember3ID(int member3ID) {
        Member3ID = member3ID;
    }
}

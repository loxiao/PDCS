package com.example.pdcs.domain;

public class Teams {
    private int TeamID;
    private String TeamName;
    private int CaptainID;
    private Integer Member1ID;
    private Integer Member2ID;
    private Integer Member3ID;
    private int CompetitionID;
    public Teams(){}

    public int getCompetitionID() {
        return CompetitionID;
    }

    public void setCompetitionID(int competitionID) {
        CompetitionID = competitionID;
    }

    public Integer getMember3ID() {
        return Member3ID;
    }

    public void setMember3ID(Integer member3ID) {
        Member3ID = member3ID;
    }

    public Integer getMember2ID() {
        return Member2ID;
    }

    public void setMember2ID(Integer member2ID) {
        Member2ID = member2ID;
    }

    public Integer getMember1ID() {
        return Member1ID;
    }

    public void setMember1ID(Integer member1ID) {
        Member1ID = member1ID;
    }

    public int getCaptainID() {
        return CaptainID;
    }

    public void setCaptainID(int captainID) {
        CaptainID = captainID;
    }

    public String getTeamName() {
        return TeamName;
    }

    public void setTeamName(String teamName) {
        TeamName = teamName;
    }

    public int getTeamID() {
        return TeamID;
    }

    public void setTeamID(int teamID) {
        TeamID = teamID;
    }
}

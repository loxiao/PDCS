package com.example.pdcs.domain;

public class Awards {
    private int AwardID;
    private int WorkID;
    private String AwardName;
    private int CompetitionID;
    private String AwardImageURL;
    private Integer Winner1ID;
    private Integer Winner2ID;
    private Integer Winner3ID;
    private Integer Winner4ID;
    public Awards(){}

    public Integer getWinner4ID() {
        return Winner4ID;
    }

    public void setWinner4ID(Integer winner4ID) {
        Winner4ID = winner4ID;
    }

    public Integer getWinner3ID() {
        return Winner3ID;
    }

    public void setWinner3ID(Integer winner3ID) {
        Winner3ID = winner3ID;
    }

    public Integer getWinner2ID() {
        return Winner2ID;
    }

    public void setWinner2ID(Integer winner2ID) {
        Winner2ID = winner2ID;
    }

    public Integer getWinner1ID() {
        return Winner1ID;
    }

    public void setWinner1ID(Integer winner1ID) {
        Winner1ID = winner1ID;
    }

    public String getAwardImageURL() {
        return AwardImageURL;
    }

    public void setAwardImageURL(String awardImageURL) {
        AwardImageURL = awardImageURL;
    }

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

    public int getCompetitionID() {
        return this.CompetitionID;
    }

    public void setCompetitionID(int competitionID) {
        this.CompetitionID = competitionID;
    }
}

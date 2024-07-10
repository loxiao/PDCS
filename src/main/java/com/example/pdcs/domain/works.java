package com.example.pdcs.domain;

public class works {
    private int WorkID;
    private String WorkName;
    private int CompetitionID;
    private int TeamID;
    private int Likes;
    private String Comments;
    private String ImageURL;
    public works(){}

    public int getWorkID() {
        return WorkID;
    }

    public void setWorkID(int workID) {
        WorkID = workID;
    }

    public String getWorkName() {
        return WorkName;
    }

    public void setWorkName(String workName) {
        WorkName = workName;
    }

    public int getCompetitionID() {
        return CompetitionID;
    }

    public void setCompetitionID(int competitionID) {
        CompetitionID = competitionID;
    }

    public int getTeamID() {
        return TeamID;
    }

    public void setTeamID(int teamID) {
        TeamID = teamID;
    }

    public int getLikes() {
        return Likes;
    }

    public void setLikes(int likes) {
        Likes = likes;
    }

    public String getComments() {
        return Comments;
    }

    public void setComments(String comments) {
        Comments = comments;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String imageURL) {
        ImageURL = imageURL;
    }
}

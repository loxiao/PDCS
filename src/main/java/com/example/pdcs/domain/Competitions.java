package com.example.pdcs.domain;

import java.util.Date;

public class Competitions {
    private int CompetitionID;
    private String CompetitionName;
    private Date CompetitionDate;
    private Date RegistrationDeadline;
    private int CompetitionTypeID;
    private String CompetitionTypeName;
    private String CompetitionDescription;
    private int MaxParticipants;
    private String Theme;
    public Competitions(){}

    public String getTheme() {
        return Theme;
    }

    public void setTheme(String theme) {
        Theme = theme;
    }

    public int getMaxParticipants() {
        return MaxParticipants;
    }

    public void setMaxParticipants(int maxParticipants) {
        MaxParticipants = maxParticipants;
    }

    public String getCompetitionDescription() {
        return CompetitionDescription;
    }

    public void setCompetitionDescription(String competitionDescription) {
        CompetitionDescription = competitionDescription;
    }

    public int getCompetitionID() {
        return CompetitionID;
    }

    public void setCompetitionID(int competitionID) {
        CompetitionID = competitionID;
    }

    public String getCompetitionName() {
        return CompetitionName;
    }

    public void setCompetitionName(String competitionName) {
        CompetitionName = competitionName;
    }

    public Date getCompetitionDate() {
        return CompetitionDate;
    }

    public void setCompetitionDate(Date competitionDate) {
        CompetitionDate = competitionDate;
    }

    public Date getRegistrationDeadline() {
        return RegistrationDeadline;
    }

    public void setRegistrationDeadline(Date registrationDeadline) {
        RegistrationDeadline = registrationDeadline;
    }

    public int getCompetitionTypeID() {
        return CompetitionTypeID;
    }

    public void setCompetitionTypeID(int competitionTypeID) {
        CompetitionTypeID = competitionTypeID;
    }

    public String getCompetitionTypeName() {
        return CompetitionTypeName;
    }

    public void setCompetitionTypeName(String competitionTypeName) {
        CompetitionTypeName = competitionTypeName;
    }
}

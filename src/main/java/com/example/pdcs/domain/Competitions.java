package com.example.pdcs.domain;

import java.util.Date;

public class Competitions {
    private int CompetitionID;
    private String CompetitionName;
    private Date CompetitonDate;
    private Date RegistrationDeadline;
    private int CompetitionTypeID;
    private String CompetitionTypeName;
    private String CompetitionDescription;
    public Competitions(){}

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

    public Date getCompetitonDate() {
        return CompetitonDate;
    }

    public void setCompetitonDate(Date competitonDate) {
        CompetitonDate = competitonDate;
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

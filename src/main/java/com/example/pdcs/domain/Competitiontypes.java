package com.example.pdcs.domain;

public class Competitiontypes {
    private int competitionTypeID;
    private String TypeName;
    public Competitiontypes(){}

    public int getCompetitionTypeID() {
        return competitionTypeID;
    }

    public void setCompetitionTypeID(int competitionTypeID) {
        this.competitionTypeID = competitionTypeID;
    }

    public String getTypeName() {
        return TypeName;
    }

    public void setTypeName(String typeName) {
        TypeName = typeName;
    }
}

package com.example.poster.domain;

public class competitiontypes {
    private int competitionTypeID;
    private String TypeName;
    public competitiontypes(){}

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

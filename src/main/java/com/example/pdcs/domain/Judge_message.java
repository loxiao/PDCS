package com.example.pdcs.domain;

public class Judge_message {
    private int MessageID;
    private int CompetitionID;
    private int JudgeID;
    private int IsAwarded;
    public Judge_message(){

    }

    public int getIsAwarded() {
        return IsAwarded;
    }

    public void setIsAwarded(int isAwarded) {
        IsAwarded = isAwarded;
    }

    public int getJudgeID() {
        return JudgeID;
    }

    public void setJudgeID(int judgeID) {
        JudgeID = judgeID;
    }

    public int getCompetitionID() {
        return CompetitionID;
    }

    public void setCompetitionID(int competitionID) {
        CompetitionID = competitionID;
    }

    public int getMessageID() {
        return MessageID;
    }

    public void setMessageID(int messageID) {
        MessageID = messageID;
    }
}

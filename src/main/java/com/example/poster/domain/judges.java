package com.example.poster.domain;

public class judges {
    private int JudgeID;
    private String JudgesName;
    private String JudgesNumber;
    private String JudgesPsd;
    public judges(){}

    public int getJudgeID() {
        return JudgeID;
    }

    public void setJudgeID(int judgeID) {
        JudgeID = judgeID;
    }

    public String getJudgesName() {
        return JudgesName;
    }

    public void setJudgesName(String judgesName) {
        JudgesName = judgesName;
    }

    public String getJudgesNumber() {
        return JudgesNumber;
    }

    public void setJudgesNumber(String judgesNumber) {
        JudgesNumber = judgesNumber;
    }

    public String getJudgesPsd() {
        return JudgesPsd;
    }

    public void setJudgesPsd(String judgesPsd) {
        JudgesPsd = judgesPsd;
    }
}

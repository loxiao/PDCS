package com.example.poster.domain;

public class participant {
    private int participant_id;
    private String participant_name;
    private String participant_number;
    private String participant_psd;
    private String participant_address;
    public participant(){}

    public int getParticipant_id() {
        return participant_id;
    }

    public void setParticipant_id(int participant_id) {
        this.participant_id = participant_id;
    }

    public String getParticipant_name() {
        return participant_name;
    }

    public void setParticipant_name(String participant_name) {
        this.participant_name = participant_name;
    }

    public String getParticipant_number() {
        return participant_number;
    }

    public void setParticipant_number(String participant_number) {
        this.participant_number = participant_number;
    }

    public String getParticipant_psd() {
        return participant_psd;
    }

    public void setParticipant_psd(String participant_psd) {
        this.participant_psd = participant_psd;
    }

    public String getParticipant_address() {
        return participant_address;
    }

    public void setParticipant_address(String participant_address) {
        this.participant_address = participant_address;
    }
}

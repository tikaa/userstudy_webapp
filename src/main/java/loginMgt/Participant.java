package main.java.loginMgt;

import main.java.model.DataElement;

import java.util.List;

public class Participant {

    private String participantID;
    private int decideQuickly;
    private int decideBetter;
    private int privacyInformed;
    private int howLikelyToUse;
    private int necessarySkills;
    private int easeOfInteraction;
    private int interesting;
    private int enjoyable;

    public int getMentalEffort() {
        return mentalEffort;
    }

    public void setMentalEffort(int mentalEffort) {
        this.mentalEffort = mentalEffort;
    }

    public int getClarity() {
        return clarity;
    }

    public void setClarity(int clarity) {
        this.clarity = clarity;
    }

    private int mentalEffort;
    private int clarity;
    private List<DataElement> dataElemList;


    public static Participant getParticipant() {
        return participant;
    }

    public static void setParticipant(Participant participant) {
        Participant.participant = participant;
    }

    private boolean isChangingDesign;
    //User Acceptance of Hedonic Information Systems
    //Author(s): Hans van der Heijden

    private static Participant participant;

    private Participant() {
    }

    public static Participant getInstance() {

        if (participant == null) {
            synchronized (Participant.class) {
                if (participant == null) {
                    participant = new Participant();
                }
            }
        }
        return participant;
    }

    public List<DataElement> getDataElemList() {
        return dataElemList;
    }

    public void setDataElemList(List<DataElement> dataElemList) {
        this.dataElemList = dataElemList;
    }

    public String getParticipantID() {
        return participantID;
    }

    public void setParticipantID(String participantID) {
        this.participantID = participantID;
    }

    public int getDecideQuickly() {
        return decideQuickly;
    }

    public void setDecideQuickly(int decideQuickly) {
        this.decideQuickly = decideQuickly;
    }

    public int getDecideBetter() {
        return decideBetter;
    }

    public void setDecideBetter(int decideBetter) {
        this.decideBetter = decideBetter;
    }

    public int getPrivacyInformed() {
        return privacyInformed;
    }

    public void setPrivacyInformed(int privacyInformed) {
        this.privacyInformed = privacyInformed;
    }

    public int getHowLikelyToUse() {
        return howLikelyToUse;
    }

    public void setHowLikelyToUse(int howLikelyToUse) {
        this.howLikelyToUse = howLikelyToUse;
    }

    public int getNecessarySkills() {
        return necessarySkills;
    }

    public void setNecessarySkills(int necessarySkills) {
        this.necessarySkills = necessarySkills;
    }

    public int getEaseOfInteraction() {
        return easeOfInteraction;
    }

    public void setEaseOfInteraction(int easeOfInteraction) {
        this.easeOfInteraction = easeOfInteraction;
    }

    public int getInteresting() {
        return interesting;
    }

    public void setInteresting(int interesting) {
        this.interesting = interesting;
    }

    public int getEnjoyable() {
        return enjoyable;
    }

    public void setEnjoyable(int enjoyable) {
        this.enjoyable = enjoyable;
    }

    public boolean isChangingDesign() {
        return isChangingDesign;
    }

    public void setChangingDesign(boolean changingDesign) {
        isChangingDesign = changingDesign;
    }
}

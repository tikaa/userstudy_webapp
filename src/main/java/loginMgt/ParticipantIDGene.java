package main.java.loginMgt;

import java.util.Random;

public class ParticipantIDGene {

    private static ParticipantIDGene participantID;

    private ParticipantIDGene(){}

    public static ParticipantIDGene getInstance() {
        if (participantID == null) {
            synchronized (ParticipantIDGene.class) {
                if (participantID == null) {
                    participantID = new ParticipantIDGene();
                }
            }
        }
        return participantID;
    }

    public String idGenerator(){
        Random rnd = new Random();
        int n = 100000 + rnd.nextInt(900000);
        return String.valueOf(n);

    }
}

package main.java.util;

import main.java.loginMgt.Participant;
import main.java.model.DataElement;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;

public class EmailSender {

   public void sendEmail() {

       final String username = "wnthksnrth@gmail.com";
       final String password = "tika89@WSO2";

       Properties props = new Properties();
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.starttls.enable", "true");
       props.put("mail.smtp.host", "smtp.gmail.com");
       props.put("mail.smtp.port", "587");

       Session session = Session.getInstance(props,
               new javax.mail.Authenticator() {
                   protected PasswordAuthentication getPasswordAuthentication() {
                       return new PasswordAuthentication(username, password);
                   }
               });

       try {
           Message message = new MimeMessage(session);
           message.setFrom(new InternetAddress("wnthksnrth@gmail.com"));
           message.setRecipients(Message.RecipientType.TO,
                   InternetAddress.parse("pgeekiyanage600@gmail.com"));
           message.setSubject(emailSubject());
           message.setText(bodyContent());
           Transport.send(message);

           System.out.println("Done");

       } catch (MessagingException e) {
           throw new RuntimeException(e);
       }
   }

   private String emailSubject(){
       return "User Study Response from : " + Participant.getInstance().getParticipantID();
   }

    public String bodyContent() {


        List<DataElement> listofData = Participant.getInstance().getDataElemList();
        Participant currParticipant = Participant.getInstance();
        String participantResponse = "\n \n Participant Response : " + currParticipant.getParticipantID() + "\n \n";
        participantResponse += "  \r\n";   //
        for (int i = 0; i < listofData.size(); i++) {
            DataElement tempElement = listofData.get(i);
            participantResponse += " Data Element Name : " + tempElement.getDataElemName();
            participantResponse += "  \r\n";   //

            participantResponse += " Purpose for Collection : " + tempElement.getReasonForSelection();
            participantResponse += "  \r\n";   //

            participantResponse += " Data Element shared : " + String.valueOf(tempElement.isPreShared());
            participantResponse += "  \r\n";   ////
            participantResponse += " " + tempElement.getHowPreShared();
            participantResponse += "  \r\n";   //

            participantResponse += "  Data Element stored : " + String.valueOf(tempElement.isPreStored());
            participantResponse += "  \r\n";   //
            participantResponse += " " + tempElement.getHowPreStored();
            participantResponse += "  \r\n";   //
            participantResponse += " " + tempElement.getWherePostStored();
            participantResponse += "  \r\n";   //

            participantResponse += "  Data Element Attributes : ";
            participantResponse += "  \r\n";   //
            participantResponse += "  \r\n";   //
            participantResponse += " Sensitivity : " + String.valueOf(tempElement.getSensitivity());
            participantResponse += " Visibility : " + String.valueOf(tempElement.getVisibility());
            participantResponse += " Relatedness : " + String.valueOf(tempElement.getRelatedness());

            participantResponse += "  \r\n";   //
            participantResponse += " Privacy Risk : " + String.valueOf(tempElement.getPrivacyRisk());

            participantResponse += "  \r\n";   //
            participantResponse += " Is selected after methodology : " + String.valueOf(tempElement.getIsPostSelected());

            participantResponse += "  \r\n";   //
            participantResponse += " Is shared after methodology : " + tempElement.isPostShared();
            participantResponse += "  " + tempElement.getHowPostShared();
            participantResponse += "  \r\n";   //

            participantResponse += "  \r\n";   //
            participantResponse += " Is stored after methodology : " + String.valueOf(tempElement.isPostStored());
            participantResponse += " " + tempElement.getHowPostStored();
            participantResponse += "  \r\n";   //
            participantResponse += " " + tempElement.getWherePreStored();
            participantResponse += "  \r\n --------- End of Data Element Selection---------------";   //

        }


        participantResponse += "  \r\n Participant's Rating for the Methodology \r\n";   //
        participantResponse += "Clarity Rating : " + currParticipant.getClarity();
        participantResponse += "  \r\n";   //
        participantResponse += "Decide Better Rating : " + currParticipant.getDecideBetter();
        participantResponse += "  \r\n";   //
        participantResponse += "Decide Quickly Rating : " + currParticipant.getDecideQuickly();
        participantResponse += "  \r\n";   //
        participantResponse += "Likely To Use Rating : " + currParticipant.getHowLikelyToUse();
        participantResponse += "  \r\n";   //
        participantResponse += "Privacy Informed Rating : " + currParticipant.getPrivacyInformed();
        participantResponse += "  \r\n";   //
        participantResponse += "Enjoyable Rating : " + currParticipant.getEnjoyable();
        participantResponse += "  \r\n";   //
        participantResponse += "Ease of Interaction Rating : " + currParticipant.getEaseOfInteraction();
        participantResponse += "  \r\n";   //
        participantResponse += "Metal Effort Rating : " + currParticipant.getMentalEffort();
        participantResponse += "  \r\n";   //
        participantResponse += "Interesting Rating : " + currParticipant.getInteresting();
        participantResponse += "  \r\n";   //
        participantResponse += "Necessary Skills Rating : " + currParticipant.getNecessarySkills();
        participantResponse += "  \r\n";   //
        return participantResponse;
    }



}

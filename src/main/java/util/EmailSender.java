package main.java.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailSender {

    public void sendEmail(String content) {

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
            message.setSubject("New Submission for Survey on Privacy Concerned Software Development");
            message.setText(content);
            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}

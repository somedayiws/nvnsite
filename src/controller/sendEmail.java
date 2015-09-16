package controller;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class sendEmail {

//    private static String USER_NAME = "traitim25101994@gmail.com";  // GMail user name (just the part before "@gmail.com")
//    private static String PASSWORD = "quochaiyeungocvien"; // GMail password
//    private static String RECIPIENT = "hoquochaibkdn@gmail.com";
//
//    public static void main(String[] args) {
//        String from = USER_NAME;
//        String pass = PASSWORD;
//        String[] to = { RECIPIENT }; // list of recipient email addresses
//        String subject = "Java send mail example";
//        String body = "Welcome to JavaMail!";
//
//        sendFromGMail(from, pass, to, subject, body);
//    }

    public static void sendFromGMail(String[] to, String subject, String body) {
    	String from = "hoquochaibkdn@gmail.com";
    	String pass ="87033577";
        Properties props = System.getProperties();
        
        System.out.println("\nbefore_props: "+props);
        
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        System.out.println("\nafter_props: "+props);
        
        Session session = Session.getDefaultInstance(props);        
        System.out.println("\nsession: "+session);
        
        MimeMessage message = new MimeMessage(session);
        System.out.println("\nmessage1: "+message);

        try {
            message.setFrom(new InternetAddress(from));
            System.out.println("\nmessage2: "+message);
            
            InternetAddress[] toAddress = new InternetAddress[to.length];
            System.out.println("\nbefore_toAddress: "+toAddress);

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
                System.out.println("\ntoAddress["+i+"]: "+toAddress[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
                System.out.println("\nmessage["+i+"]: "+message);
            }

            message.setSubject(subject);
            message.setText(body);            
            System.out.println("\nmessage_after: "+message);
            
            
            Transport transport = session.getTransport("smtp");
          
            
            transport.connect(host, from, pass);
            System.out.println("\ntransport: "+transport);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}
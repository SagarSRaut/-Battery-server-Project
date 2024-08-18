package com.project.helper;


import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;

import org.apache.log4j.Logger;

public class EmailHelper {
	static String sender_email;
	static String sender_password;
	private static EmailHelper emailHelper;
	
	static final Logger logger=Logger.getLogger(EmailHelper.class);
	
	private EmailHelper()
	{
		sender_email="serverbattery@gmail.com";
		sender_password="project123@";
	}
	
	private EmailHelper(String emailId, String password)
	{
		sender_email=emailId;
		sender_password=password;
	}
	
	public static EmailHelper getObject(String emailId, String password)
	{
	if (emailHelper == null){  
      synchronized(EmailHelper.class){  
        if (emailHelper == null){  
        	emailHelper = new EmailHelper(emailId,password);//parametrized constr  
        }  
    }              
    }  
		logger.info("Parameterised Email object created");
		return emailHelper;
	}
	
	public static EmailHelper getObject()
	{
	if (emailHelper == null){  
      synchronized(EmailHelper.class){  
        if (emailHelper == null){  
        	emailHelper = new EmailHelper();//parameterless constr  
        }  
    }              
    }  
		logger.info("Object created with default Email constructor");
		return emailHelper;
	}
	
	
	public static void sendEmail(String receiver_email,String email_subj,String email_msg) throws AddressException, MessagingException
	{
		
		Properties props= new Properties();
	
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
		            "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		
		javax.mail.Session sc= javax.mail.Session.getDefaultInstance(props, new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(sender_email,sender_password);
			}
		});

		
		MimeMessage message = new MimeMessage(sc);
		message.setFrom(new InternetAddress(sender_email));//sender  
	    message.addRecipient(Message.RecipientType.TO,new InternetAddress(receiver_email));//receiver
	    logger.info("Mail Sent Successfully");
	    System.out.println("mail sent successfully");
	    
		message.setSubject(email_subj);
		message.setContent(email_msg,"text/html");
		Transport.send(message);
		
		
		
	}
	
	
	public static void sendEmailWithAttachment(String receiver_email,String email_subj,String email_msg,String filePath )
	{
		//1) get the session object     
		  Properties props = System.getProperties();  
		  props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class",
			            "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			  
		  
		  Session session = Session.getDefaultInstance(props,  
		   new javax.mail.Authenticator() {  
		   protected PasswordAuthentication getPasswordAuthentication() {  
		   return new PasswordAuthentication(sender_email,sender_password);  
		   }  
		  });  
		     
		  //2) compose message     
		  try{  
		    MimeMessage message = new MimeMessage(session);  
		    message.setFrom(new InternetAddress(sender_email));  
		    message.addRecipient(Message.RecipientType.TO,new InternetAddress(receiver_email));  
		    message.setSubject(email_subj);  
		      
		    //3) create MimeBodyPart object and set your message text     
		    BodyPart messageBodyPart1 = new MimeBodyPart();  
		    messageBodyPart1.setText(email_msg);  
		      
		    //4) create new MimeBodyPart object and set DataHandler object to this object      
		    MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
		  
		    String filename = filePath;//change accordingly  
		    DataSource source = new FileDataSource(filename);  
		    messageBodyPart2.setDataHandler(new DataHandler(source));  
		    messageBodyPart2.setFileName(filename);  
		     
		     
		    //5) create Multipart object and add MimeBodyPart objects to this object      
		    Multipart multipart = new MimeMultipart();  
		    multipart.addBodyPart(messageBodyPart1);  
		    multipart.addBodyPart(messageBodyPart2);  
		  
		    //6) set the multiplart object to the message object  
		    message.setContent(multipart );  
		     
		    //7) send message  
		    Transport.send(message);  
		   logger.info("Mail Sent with Attachment");
		   System.out.println("Mail sent....");  
		   }catch (MessagingException ex) {ex.printStackTrace();} 
	}
}

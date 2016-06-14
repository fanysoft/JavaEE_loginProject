package email;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class SendEmail {

	public void posli(String db_email, String db_password) {

		Properties props = new Properties();
		props.setProperty("mail.host", "smtp.seznam.cz");
		props.setProperty("mail.smtp.port", "25");
		props.setProperty("mail.smtp.auth", "true");
		
		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("demojavaemail@email.cz","tvrdeheslo");
			}
		};
		
		Session session = Session.getDefaultInstance(props, auth);
		
		Message msg = new MimeMessage(session);
		
		try {
			msg.setSubject("Java EE Demo - Acount password reminder");
			msg.setText("Dear user "+db_email+", your forgotten password is "+db_password+ ". Greetings from Mars.");
			msg.setFrom(new InternetAddress("demojavaemail@email.cz", "Java Demo"));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress("josef.vancura@email.cz"));
			Transport.send(msg);
		
		
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		System.out.println("Finished - email sent.");
		
		
	}

	
		
		
		
		
		
		
	

}

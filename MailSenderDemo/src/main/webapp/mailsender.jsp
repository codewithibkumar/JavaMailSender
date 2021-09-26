<%@ page language="java" import='java.util.Properties,com.ducat.MyPassword, javax.mail.*,javax.mail.internet.*' contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String to = request.getParameter("toemail");
String sub = request.getParameter("subject");
String msg = request.getParameter("msg");
//Get properties object    
Properties props = new Properties();    
props.put("mail.smtp.host", "smtp.gmail.com");    
props.put("mail.smtp.socketFactory.port", "465");    
props.put("mail.smtp.socketFactory.class",    
          "javax.net.ssl.SSLSocketFactory");    
props.put("mail.smtp.auth", "true");    
props.put("mail.smtp.port", "465");    
//get Session   
Session session1 = Session.getDefaultInstance(props,    
 new javax.mail.Authenticator() {    
 protected PasswordAuthentication getPasswordAuthentication() {    
 return new PasswordAuthentication("ibkumar.hcl@gmail.com",MyPassword.getPassword());  
 }    
});    
//compose message    
try {    
 MimeMessage message = new MimeMessage(session1);    
 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
 message.setSubject(sub);    
 message.setText(msg);    
 //send message  
 Transport.send(message);    
 System.out.println("message sent successfully");    
} catch (MessagingException e) {throw new RuntimeException(e);}    

%>
</body>
</html>
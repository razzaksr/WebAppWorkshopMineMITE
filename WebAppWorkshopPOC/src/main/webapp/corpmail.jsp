<%@page import="core.mod.Companies"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Vector"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="core.mod.Candidates"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sending Emails</title>
</head>
<body>
<%response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expiry", "0");
	if(session.getAttribute("logged")!=null){ %>
<%List<Candidates> can=(List<Candidates>)pageContext.getAttribute("tomail", PageContext.APPLICATION_SCOPE);
Companies com =(Companies) pageContext.getAttribute("forcorp", PageContext.APPLICATION_SCOPE);
List<String> mail=new Vector<String>();
for(Candidates m:can)
{
	mail.add(m.getEmail());
}

String frm="zealoustechcorptest@gmail.com",pss="testcorptechzealous";
Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.port", "587");
props.put("mail.smtp.host", "smtp.gmail.com");
/* 
  props.put("mail.smtp.socketFactory.port", "587");
  props.put("mail.smtp.socketFactory.class",
        	"javax.net.ssl.SSLSocketFactory");
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.port", "587");
 */ 
  Session sessions = Session.getInstance(props,
   new javax.mail.Authenticator() {
   protected PasswordAuthentication getPasswordAuthentication() {
   return new PasswordAuthentication(frm,pss);//change accordingly
   }
  });
 
//compose message
  try {

	  InternetAddress[] ids=new InternetAddress[mail.size()];
	  for(int index=0;index<mail.size();index++)
	  {
		  ids[index]=new InternetAddress(mail.get(index));
		  this.log(""+ids[index]);
	  }
   MimeMessage message = new MimeMessage(sessions);
   message.setFrom(new InternetAddress(frm));//change accordingly
   //message.addRecipient(Message.RecipientType.TO,new InternetAddress("razzaksr@gmail.com"));
   //message.setRecipients(Message.RecipientType.TO,InternetAddress.parse("razzaksr@gmail.com"));
   message.setRecipients(Message.RecipientType.TO,ids);
   message.setSubject("Interview Alert: Company - "+com.getOrg());
   message.setText("Dear candidate, you have interview on "+com.getDate()+" for the company "+com.getOrg()+" offering the salary of "+com.getSalary()+" role of "+com.getRole()+".\nplease prepare well. \nWise people makes opportunity,Smart people grab the opportunity. All the best.");
   this.log("Message Composed for "+ids.toString());
   //jp.showMessageDialog(this, "Message sent successfully", "Sending mail", 1, null);
   //send message
   //System.out.println(message+" "+addr.toString());
   
	/*
	 * MimeBodyPart messageBodyPart = new MimeBodyPart();
	 * messageBodyPart.setContent("Zealous email", "text/html");
	 * 
	 * Multipart multipart = new MimeMultipart();
	 * multipart.addBodyPart(messageBodyPart); MimeBodyPart attachPart = new
	 * MimeBodyPart();
	 * 
	 * attachPart.attachFile("/var/tmp/image19.png");
	 * multipart.addBodyPart(attachPart); message.setContent(multipart);
	 */
   
   Transport.send(message);
	this.log("Message Sent for "+ids.toString());
   //System.out.println("Mail has sent");
	response.sendRedirect("filterForCorps.jsp");
  } 
  catch (javax.mail.MessagingException e) 
  {
	  //throw new RuntimeException(e);
} %>
<%}else{
	response.sendRedirect("index.jsp");
	}%>
</body>
</html>
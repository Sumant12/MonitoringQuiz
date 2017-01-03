<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>

<%@page import="javax.mail.*,javax.mail.internet.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" import="java.sql.*" %>


<% 

String forgottenemail = request.getParameter("forgottenemail");




try
{
	
	
	
	
	System.out.println("in forgot1");
	
	java.sql.Connection conn = DBasesql.getCon();
	String sql = "select * from user where email=?";
	PreparedStatement pst=conn.prepareStatement(sql);
	pst.setString(1,forgottenemail);
	
	ResultSet rs=pst.executeQuery();
	System.out.println("in forgot1 rs");
	if(rs.next())
	{
		System.out.println("in forgot1 rs2");
	Properties props = new Properties();
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class",
		"javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "465");
System.out.println("done1");
Session session1 = Session.getDefaultInstance(props,null);



Message message = new MimeMessage(session1);
message.setFrom(new InternetAddress("monitoringottdv@gmail.com"));
message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse(forgottenemail));
message.setSubject("Welcome to checkmail");
//message.setText("success ");
message.setText("Dear "+forgottenemail+"," +
					"\n\n This is a mail from monitoringottdv@gmail.com!\n" +
					"\n" +
					"Regarding the password reset request. " +
					
					 
					
					"Your Username is: "+forgottenemail+"\n" +
							"   Password: "+rs.getString(3)+"\n"+"Login again with your new credentials.");
Transport t=session1.getTransport("smtp");
System.out.println("in forgot1 message");
t.connect("smtp.gmail.com","monitoringottdv@gmail.com","842015ottdv");
System.out.println("in forgot1 message connect");
//Transport.send(message);
t.sendMessage(message,message.getAllRecipients());
System.out.println("Done");
}
}

catch(Exception e)


{
	e.printStackTrace();
out.println("ERROR IN REGISTRATION");
}

	
		%>
		
		<jsp:forward page="forgot2.jsp"></jsp:forward>
		

</body>
</html>
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

String reg = (String)session.getAttribute("register");
if(reg.equals("1"))
{
	response.setHeader("Refresh","0;register.jsp");
%>

<%	
}
else
{

String name = request.getParameter("name");
//String lname = request.getParameter("lname");
//String uname = request.getParameter("uname");
String email = request.getParameter("email");
String pass = request.getParameter("pass"); 
String cpass = request.getParameter("cpass"); 
//String gender = request.getParameter("gender");
//String mobile = request.getParameter("mobile");
//String qualification = request.getParameter("qualification");
//String skills = request.getParameter("skills");
//String experience = request.getParameter("experience");
//String address = request.getParameter("address");
//String auth="1";

try
{
	/*
	java.sql.Connection conn = DBase.getCon();
	Statement stmt=conn.createStatement();
	int rowsAffected=stmt.executeUpdate("insert into register(firstname,lastname,email,phone,gender,qual,skills,exp,address) values ('"+fname+"','"+lname+"','" +email+"','"+mobile+"','"+gender+"','"+qualification+"','"+skills+"','"+experience+"','"+address+"')");
	if(rowsAffected ==1){
					session.setAttribute("user",email);

		Statement stmt1=conn.createStatement();
	int rowsAffected1=stmt1.executeUpdate("insert into login(user1,password,auth) values ('"+email+"','"+pass+"','" +auth+"')");

java.sql.Connection conn = DBasesql.getCon();
String sql = "insert into user(email,name,password,role) values(?,?,?,?)";
PreparedStatement pst=conn.prepareStatement(sql);
pst.setString(1,email);
pst.setString(2,name);
pst.setString(3,pass);
pst.setInt(4,role);
*/
if((pass.equals(cpass)) && (!name.equals("")) && (!pass.equals("")) )

{
	


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
System.out.println("done2");

message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse(email));
message.setSubject("Welcome to checkmail");
//message.setText("success ");
System.out.println("done3");
System.out.println(email);
System.out.println(pass);
System.out.println(name);

message.setText("Dear "+name+"," +
					"\n\n This is a mail from monitoringottdv@gmail.com!\n" +
					"\n" +
					"We are very thankful to inform you that you have successfully registered " +
					"" +
					"on our test portal\n" +
					 
					
					"Your <b>Username<b> is: "+email+"\n" +
							"   Password: "+pass+"\n"+" click on the below link to confirm your email"
							+"\n"+"http://localhost:8080/MonitoringOnlineTest/verification.jsp?username="+name+"&password="+pass+"&emailID="+email);
Transport t=session1.getTransport("smtp");
t.connect("smtp.gmail.com","sumanth201212@gmail.com","sai_1681");
//t.connect("smtp.gmail.com","monitoringottdv@gmail.com","842015ottdv");
System.out.println("done4");
//Transport.send(message);
t.sendMessage(message,message.getAllRecipients());
System.out.println("done5");
System.out.println("Done");
	
		%>
		<script type="text/javascript">
		alert("Registration successful. Please login now");
		
		
		</script>
		<jsp:forward page="register_message.jsp"></jsp:forward>
		
		<%
	
}
	else{
		response.sendRedirect("error.jsp");
	}
	
	
}
	
catch(Exception e)


{
	e.printStackTrace();
out.println("ERROR IN REGISTRATION");
}
}
%>
</body>
</html>
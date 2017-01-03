<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
String emailid = request.getParameter("email");
String email = (String)session.getAttribute("user");
java.sql.Connection conn = DBasesql.getCon();

String sql1 = "select * from user where email='"+email+"'";
PreparedStatement pst1 = conn.prepareStatement(sql1);
ResultSet rs = pst1.executeQuery();
if(!rs.next())
{
	response.setHeader("Refresh","0;index.jsp");
}
else
{

String sql = "update user SET email=?,name=? where email=?";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,emailid);
pst.setString(2,name);
pst.setString(3,email);
pst.executeUpdate();
session.setAttribute("user",emailid);
if(rs.getString("role").equals("2"))
{
response.setHeader("Refresh","0;edituser.jsp");
}
else
{
	response.setHeader("Refresh","0;editteacher.jsp");
}
}
%>

</body>
</html>
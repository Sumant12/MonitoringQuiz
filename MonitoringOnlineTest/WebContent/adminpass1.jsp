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
String pass = request.getParameter("pass");


java.sql.Connection conn = DBasesql.getCon();

String sql1 = "select * from user where email='admin@gmail.com'";
PreparedStatement pst1 = conn.prepareStatement(sql1);
ResultSet rs = pst1.executeQuery();
if(!rs.next())
{
	response.setHeader("Refresh","0;index.jsp");
}
else
{

String sql = "update user SET password=? where email='admin@gmail.com'";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,pass);
pst.executeUpdate();

response.setHeader("Refresh","0;adminhome.jsp");
}
%>

</body>
</html>
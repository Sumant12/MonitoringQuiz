<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" import="java.sql.*" %>
<% 
String name = request.getParameter("uname");
String pass = request.getParameter("pass"); 

try
{
	java.sql.Connection conn = DBasesql.getCon();
	String sql = "select * from user where email=? and password=?";
	PreparedStatement pst = conn.prepareStatement(sql);
	pst.setString(1,name);
	pst.setString(2,pass);
	ResultSet rs = pst.executeQuery();
	if(rs.next())
	{
		session.setAttribute("user",name);
		
		String auth = rs.getString(4);
		session.setAttribute("role",auth);
		if(auth.equals("0"))
		{
			%>
			<jsp:forward page="adminhome.jsp"></jsp:forward>
			<%
		}
		else if(auth.equals("1"))
		{
			response.sendRedirect("teacherhome.jsp");
			%>
			<!--  
			<jsp:forward page="teacherhome.jsp"></jsp:forward>
			-->
			<%
		}
		else
		{
			response.sendRedirect("userhome.jsp");
			%>
			<!--<jsp:forward page="userhome.jsp"></jsp:forward>-->
			<%
		}
	}
	else
	{
		%>
		<jsp:forward page="error.jsp"></jsp:forward>
		<%
	}
}
catch(Exception e)
{
System.out.println(e);

}

%>
</body>
</html>
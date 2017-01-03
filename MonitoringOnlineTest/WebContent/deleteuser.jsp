<%@page import="java.sql.*" %>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String deleteUser[]=request.getParameterValues("selectuser");

 java.sql.Connection conn = DBasesql.getCon();
String sql = "delete from user where email=?";
PreparedStatement pst = conn.prepareStatement(sql);
for(int i=0;i<deleteUser.length;i++)
{
	out.println(deleteUser[i]);
	
	pst.setString(1,deleteUser[i]);
	int x=pst.executeUpdate();
}


out.println("deleted all selected");


%>
<jsp:forward page="adminhome.jsp"/>
</body>
</html>
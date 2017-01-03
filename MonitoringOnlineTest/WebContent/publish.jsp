<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Publish</title>
</head>
<body>
<%
String test_id = request.getParameter("id");
String sql = "update test SET status='1' where test_id='"+test_id+"'";
java.sql.Connection conn = DBasesql.getCon();
PreparedStatement pst = conn.prepareStatement(sql);
pst.executeUpdate();
%>
<h1>Test published successfully. Please Wait......</h1>
<%
response.setHeader("Refresh","2;teacherhome.jsp");
%>
</body>
</html>
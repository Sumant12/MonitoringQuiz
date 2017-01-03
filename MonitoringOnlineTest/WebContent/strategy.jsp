<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="teacherheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Strategies</title>
</head>
<body>
<br>
<h1 align="center"><span class="label label-default">Select Test</span></h1>
<form method="post" name="strategyform" action="strategy2.jsp" style="text-align:center">
<br>
<div align="center">
<select class="form form-control" size="1" name="test" style="width:20%">
<%
if(session.getAttribute("user")==null)
{
	//response.setHeader("Refresh","0;index.jsp");
	response.sendRedirect("index.jsp");
}
String email = (String)session.getAttribute("user");
java.sql.Connection conn = DBasesql.getCon();
String sql = "select * from user where email=? and role=?";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,email);
pst.setString(2,"1");
ResultSet rs = pst.executeQuery();
if(!rs.next())
{
	//response.setHeader("Refresh","0;index.jsp");
	response.sendRedirect("index.jsp");
}

sql = "select * from test where email=?";
pst = conn.prepareStatement(sql);
pst.setString(1,email);
rs = pst.executeQuery();
while(rs.next())
{
	int tid = rs.getInt("test_id");
	String tname = rs.getString("test_name");
	%>
	
	<option value=<%= tid %>><%= tname%></option>
	<%
}
%>
</select>
<h5><Span style="color:blue">(Select the test.)</Span></h5>
</div>
<br>
              
               <input type="submit" value="Select" class="btn btn-primary" >
</form>
</body>
</html>
<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<jsp:include page="teacherheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Home</title>
</head>
<body>
<%
if(session.getAttribute("user")==null)
{
	//response.setHeader("Refresh","0;index.jsp");
	//response.sendRedirect("index.jsp");
	response.setHeader("Refresh","0;login.jsp");
	
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
	//response.sendRedirect("index.jsp");
	response.setHeader("Refresh","0;login.jsp");
%>

<%
}
else
{
%>

<h1 align="center"><span class="label label-success"><%="welcome "+rs.getString("name") %></span></h1>
<%
sql = "select * from test,subject where test.email=? and test.status='0' and test.subj_id=subject.subj_id";
pst = conn.prepareStatement(sql);
pst.setString(1,email);
rs = pst.executeQuery();
%>
<div class="container">

<h3 align="center">Unpublished Test</h3>
<div class="table-responsive">
<table class="table-bordered" style="width:100%">
<thead>
<tr style="font-size:18px" >
	<th> Test Name</th>
	<th> Subject</th>
	<th> Duration(in minutes)</th>
	<th> Action</th>
	
</tr>
</thead>
<%
while(rs.next())
{
	String test_id = rs.getString("test_id");
	%>
	<tr style="font-size:16px">
	<td><%=rs.getString("test_name") %></td>
	<td><%=rs.getString("subj_name") %></td>
	<td><%=rs.getString("test_duration") %></td>
	<td><a href="edittest.jsp?id=<%=test_id%>">edit|</a><a href="publish.jsp?id=<%=test_id%>">Publish</a></td>
	</tr>
	<%
}
%>
</table>
</div>

</div>
<%
sql = "select * from test,subject where test.email=? and test.status='1' and test.subj_id=subject.subj_id";
pst = conn.prepareStatement(sql);
pst.setString(1,email);
rs = pst.executeQuery();
%>
<div class="container">

<h3 align="center">Published Test</h3>
<div class="table-responsive">
<table class="table-bordered" style="width:100%">
<thead>
<tr style="font-size:18px" >
	<th> Test Name</th>
	<th> Subject</th>
	<th> Duration(in minutes)</th>
	<th> Action</th>
	
</tr>
</thead>
<%
while(rs.next())
{
	String test_id = rs.getString("test_id");
	%>
	<tr style="font-size:16px">
	<td><%=rs.getString("test_name") %></td>
	<td><%=rs.getString("subj_name") %></td>
	<td><%=rs.getString("test_duration") %></td>
	<td><a href="userrank.jsp?id=<%=test_id%>">View Rank List|</a><a href="closetest.jsp?id=<%=test_id%>">Close Test| </a><a href="editquestion.jsp?id=<%=test_id%>">Edit Test</a></td>
	</tr>
	<%
}
}
%>
</table>
</div>

</div>
</body>
</html>
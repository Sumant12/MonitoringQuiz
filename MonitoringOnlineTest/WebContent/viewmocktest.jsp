<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="userheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Test</title>
</head>
<body>
<br>
<h1 align="center"><span class="label label-default">Select Mock Test of Your Choice</span></h1>
<form method="post" name="viewtestform" action="pretestmock.jsp" style="text-align:center">
<br>
<%
if(session.getAttribute("user")==null)
{
	response.setHeader("Refresh","0;index.jsp");
}
String email = (String)session.getAttribute("user");
%>
<div align="center">
<select class="form form-control" size="1" name="test" style="width:20%">
<%
java.sql.Connection conn = DBasesql.getCon();
String sql = "select test.test_id,test.test_name,subject.subj_name from test,subject where test.subj_id=subject.subj_id and test.status='1'";
String sql1 = "select * from result where email=? and test_id=?";
PreparedStatement pst = conn.prepareStatement(sql);
PreparedStatement pst1 = conn.prepareStatement(sql1);


ResultSet rs = pst.executeQuery();

while(rs.next())
{
	pst1.setString(1,email);
	
	int tid = rs.getInt("test_id");
	String tid1 = ""+tid;
	pst1.setString(2,tid1);
	ResultSet rs1 = pst1.executeQuery();
	if(!rs1.next())
	{
	String tname = rs.getString("test_name");
	String sname = rs.getString("subj_name");
	%>
	<option value=<%= tid %>><%= tname+"-"+sname %></option>
	<%
	}
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
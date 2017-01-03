<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>

</head>
<body>
<jsp:include page="header.jsp" />
	<div class="clearfix"></div>
	<%
try
{
	String subject=request.getParameter("name");

java.sql.Connection conn=DBasesql.getCon();

String sql="select test_name from subject s,test t  where s.subj_name=?and t.subj_id=s.subj_id and t.status=1 ";
PreparedStatement  pst = conn.prepareStatement(sql);
System.out.println("pass2");

pst.setString(1,subject);


ResultSet rs=pst.executeQuery();
%>
<div class="panel panel-danger">
  <div class="panel-heading">
    <h3 class="panel-title">Test Available</h3>
  </div>
   <div class="panel-body" style="font-size:14px">
  <%
while(rs.next())
{
	
%> 
  <a href="login.jsp">
   <br>

<%
out.println(rs.getString(1));	
}

}

catch(Exception e)
{
	System.out.println();
}

%>
</a>
</div>
</div>
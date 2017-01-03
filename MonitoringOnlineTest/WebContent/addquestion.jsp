<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="teacherheader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Test</title>
</head>
<body>
<%
if(session.getAttribute("user")==null)
{
	//response.setHeader("Refresh","0;index.jsp");
	response.sendRedirect("index.jsp");
}
%>
<br>
<h1 align="center"><span class="label label-default">Add Question</span></h1>
<form method="post" name="testform2" action="addquestion1.jsp" style="text-align:center">
<br>
<%
String email = (String)session.getAttribute("user");
%>
<div align="center">
<select class="form form-control" size="1" name="test" style="width:20%">
<%
java.sql.Connection conn = DBasesql.getCon();
String sql = "select test.test_id,test.test_name,subject.subj_name from test,subject where test.email=? and test.subj_id=subject.subj_id and test.status='0'";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,email);
ResultSet rs = pst.executeQuery();
while(rs.next())
{
	int tid = rs.getInt("test_id");
	String tname = rs.getString("test_name");
	String sname = rs.getString("subj_name");
	%>
	<option value=<%= tid %>><%= tname+"-"+sname %></option>
	<%
}
%>

</select>
<h5><Span style="color:blue">(Select the test.)</Span></h5>
</div>
 <br>
              
               <input type="submit" value="Add Questions" class="btn btn-primary" >
</form>
</body>
</html>
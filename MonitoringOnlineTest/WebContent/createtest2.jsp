<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Test</title>
</head>
<body>
<%
String tname = request.getParameter("testname");
int dur = Integer.parseInt(request.getParameter("duration"));
String tsubj = request.getParameter("subject");
String subjname = request.getParameter("subj");
String email = (String)session.getAttribute("user");
try
{
	java.sql.Connection conn = DBasesql.getCon();
	String sql = "insert into test(test_name,subj_id,test_duration,email,status) values(?,?,?,?,?)";
if(!tsubj.equals("other"))
{
	
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,tname);
pst.setString(2,tsubj);
pst.setInt(3,dur);
pst.setString(4,email);
pst.setString(5,"0");
pst.executeUpdate();
%>
<jsp:forward page="addquestion.jsp"></jsp:forward>
<%
}
else if(tsubj.equals("other"))
{
	String sql1 = "insert into subject(subj_name) values(?)";
	PreparedStatement pst = conn.prepareStatement(sql1);
	pst.setString(1,subjname);
	pst.executeUpdate();
	ResultSet rs = pst.executeQuery("select * from subject");
	rs.last();
	tsubj = rs.getString(1);
	pst = conn.prepareStatement(sql);
	pst.setString(1,tname);
	pst.setString(2,tsubj);
	pst.setInt(3,dur);
	pst.setString(4,email);
	pst.setString(5,"0");
	pst.executeUpdate();
	%>
	<jsp:forward page="addquestion.jsp"></jsp:forward>
	<%
}
}
catch(Exception e)
{
	
}
%>

</body>
</html>
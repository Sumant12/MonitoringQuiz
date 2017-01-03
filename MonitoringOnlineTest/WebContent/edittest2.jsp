<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Test</title>
</head>
<body>
<%
java.sql.Connection conn = DBasesql.getCon();
String tname = request.getParameter("testname");
int dur = Integer.parseInt(request.getParameter("duration"));
String tsubj = request.getParameter("subject");
String subjname = request.getParameter("subj");
String test_id = request.getParameter("testid");
String sql = "update test SET test_name=?,subj_id=?,test_duration=? where test_id='"+test_id+"'";

if(!tsubj.equals("other"))
{
	PreparedStatement pst = conn.prepareStatement(sql);
	pst.setString(1,tname);
	pst.setString(2,tsubj);
	pst.setInt(3,dur);
	pst.executeUpdate();
	response.sendRedirect("teacherhome.jsp");
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
	pst.executeUpdate();
	response.sendRedirect("teacherhome.jsp");
}
%>

</body>
</html>
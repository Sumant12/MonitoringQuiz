<%@page import="java.sql.*"%>
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
java.sql.Connection conn = DBasesql.getCon();
String sql = "select sum(marks) m, sum(time) t from response where email=? and test_id=?";
PreparedStatement pst = conn.prepareStatement(sql);
String email = (String)session.getAttribute("user");
String test_id = request.getParameter("testid");
pst.setString(1,email);
pst.setString(2,test_id);
ResultSet rs = pst.executeQuery();
String marks="";
String maxmarks="";
if(rs.next())
{
	marks = rs.getString("m");
	String time = rs.getString("t");
	sql = "insert into result(test_id,email,total_marks,total_time) values(?,?,?,?)";
	pst = conn.prepareStatement(sql);
	pst.setString(1,test_id);
	pst.setString(2,email);
	pst.setString(3,marks);
	pst.setString(4,time);
	pst.executeUpdate();
}
sql = "select sum(marks) s from testquestion,question,level where testquestion.test_id=? and testquestion.ques_id=question.ques_id and question.level_id=level.level_id";
pst = conn.prepareStatement(sql);
pst.setString(1,test_id);
rs = pst.executeQuery();
if(rs.next())
{
	maxmarks = rs.getString("s");
}
%>
Congratulations for completing the test. Your score is <%= marks %> out of <%= maxmarks %>
<br>
Please Wait.......
<%


response.setHeader("Refresh","5;userhome.jsp");
%>
</body>
</html>
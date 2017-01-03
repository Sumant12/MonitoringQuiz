<%@page import="java.sql.*"%>
<%@page import="dbsql.DBasesql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
java.sql.Connection conn = DBasesql.getCon();
String test_id = request.getParameter("id");
String sql = "select * from question where ques_id=?";
int i = ((Integer)session.getAttribute("flag")).intValue();
int[] questions = (int[])session.getAttribute("questions");
int ques_id=0;
if(i>=questions.length)
{
	response.sendRedirect("testresult.jsp");
}
else
{
ques_id = questions[i];
}
i=i+1;
session.setAttribute("flag",i);
PreparedStatement pst = conn.prepareStatement(sql);
pst.setInt(1,ques_id);
ResultSet rs = pst.executeQuery();
%>
<form method="post" action="submittest2.jsp" name="testform" id="testform" >
<%
String sql1 = "select * from test where test_id=?";
PreparedStatement pst1 = conn.prepareStatement(sql1);
pst1.setString(1,test_id);
ResultSet rs1 = pst1.executeQuery();
if(rs1.next())
{
	%>
	<div>
<h1 align="center"><span class="label label-default"><%=rs1.getString("test_name")%></span></h1>
</div>
<div class="container" style="font-size:16px">
	<%
}
if(rs.next())
{
	%>
	<%= i+") "+rs.getString("question")+" (level : "+rs.getString("level_id")+" )" %>
	
	<br>
	<br>
	<input type="radio"  name="<%= i %>" value="a"><%= rs.getString("option1") %>
	<br>
	<input type="radio" name="<%= i %>" value="b"><%= rs.getString("option2") %>
	<br>
	<input type="radio" name="<%= i %>" value="c"><%= rs.getString("option3") %>
	<br>
	<input type="radio" name="<%= i %>" value="d"><%= rs.getString("option4") %>
	<br>
	<input type="submit" value="Next Question">
	<%
}

%>
</div>
<input type="hidden" name="testid" value="<%= test_id%>">
<input type="hidden" name="quesid" value="<%= ques_id%>">
</form>
</body>
</html>